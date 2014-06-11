#include "typedefs.h"
#include "physics.h"
#include "random.h"
#include "gmx_random.h"
#include "mtop_util.h"
#include "smalloc.h"    // for snew()
#include "vec.h"        // for copy_rvecn()
#include "mdrun.h"      // for do_constrain_first()
#include "gshmc.h"

static void low_mspeed2(FILE *fplog, t_commrec *cr, real tempi, t_mdatoms *mdatoms,rvec v[], gmx_rng_t rng)
{
  int  i,m,nrdf;
  real boltz,sd;
  real ekin,temp,scal;

  int start  = mdatoms->start;
  int homenr = mdatoms->homenr;
  int nrend  = start + homenr;
  real *massT = mdatoms->massT;

  boltz=BOLTZ*tempi;
  ekin=0.0;
  nrdf=0;

  for (i = start; i < nrend; i++)
  {
    if (massT[i] > 0) 
    {
      sd=sqrt(boltz/massT[i]);
      for (m=0; (m<DIM); m++) 
      {
        v[i][m]=sd*gmx_rng_gaussian_real(rng);
        ekin += 0.5*massT[i]*v[i][m]*v[i][m];
      }
      nrdf += DIM;
    }
  }
  temp=(2.0*ekin)/(nrdf*BOLTZ);
  if (temp > 0) 
  {
    scal=sqrt(tempi/temp);
    for(i = start; i < nrend; i++)
      for(m=0; (m<DIM); m++)
        v[i][m]*=scal;
  }

  if (MASTER(cr))
  {
//     fprintf(stderr,"\n Velocities were taken from a Maxwell distribution at %g K\n", tempi);
     fprintf(fplog, "\n Velocities were taken from a Maxwell distribution at %g K\n", tempi);
     if (debug) {
       fprintf(debug,
               "Velocities were taken from a Maxwell distribution\n"
               "Initial generated temperature: %12.5e (scaled to: %12.5e)\n",
               temp,tempi);
     }
  }
}

/* Function for performing Pande test in GSHMC */
int metropolis(FILE *fplog, gmx_mtop_t *mtop, t_inputrec *ir, t_state *current[7], t_state *candidate[7], double dDeltaXi,
               real Ucurrent, real Ucandidate, gmx_rng_t rng, int iTest, real Kcurrent, real Kcandidate, int iTrial, double *weight, 
               gmx_large_int_t step, gmx_bool *bFlip)
{
  real dHamCand = 0.0, dHamCurr = 0.0;
  real Etotcandidate = Ucandidate + Kcandidate;
  real Etotcurrent   = Ucurrent   + Kcurrent;

  if (ir->epc != epcANDERSEN)
  {
     if (ir->met == metGSHMC)
     {
        /* Calculate shadow hamiltonian for candidate position and momentum */
        dHamCand = shadow(mtop, ir, candidate, Ucandidate);
        /* Calculate shadow hamiltonian for current position and momentum */
        dHamCurr = shadow(mtop, ir, current, Ucurrent);
     }
     else
     {
        /* Calculate hamiltonian for candidate position and momentum */
        //dHamCand = hamiltonian(mtop, ir, candidate, Ucandidate); // PRUEBA
        dHamCand = Etotcandidate;
        /* Calculate hamiltonian for current position and momentum */
        //dHamCurr = hamiltonian(mtop, ir, current, Ucurrent); // PRUEBA
        dHamCurr = Etotcurrent;
     }
  }
  else
  {
     if (ir->met == metGSHMC)
     {
        /* Calculate shadow hamiltonian for candidate position and momentum */
        dHamCand = shadow_andersen(mtop, ir, candidate, Ucandidate);
        /* Calculate shadow hamiltonian for current position and momentum */
        dHamCurr = shadow_andersen(mtop, ir, current,   Ucurrent); 
     }
     else
     {
        /* Calculate hamiltonian for candidate position and momentum */
        dHamCand = hamiltonian_andersen(mtop, ir, candidate, Ucandidate);
        /* Calculate hamiltonian for current position and momentum */
        dHamCurr = hamiltonian_andersen(mtop, ir, current, Ucurrent);
     }
  }

  real dDelta_H = dHamCand - dHamCurr;
  real dBeta = 1.0 / (BOLTZ*ir->dTempi);
  real dProbabilityA = 0.0;
  real dProbabilityS = 0.0;

  real dExponent = -dBeta * (dDelta_H + dDeltaXi);
  real dExponent2 = -dBeta * (-dDelta_H + dDeltaXi);
  
  static int iResultPrev = REJECTED;

  static real dProbabilityAPrevInv = 0.0;

  int iResult = 0;

  *bFlip = FALSE;

  /* We choose which test we perform */
  if (ir->bPandeTest && iTest == MDMC)
  {
     /* Perform Pande test */
     if (dExponent > 0.0)
     {
        iResult = ACCEPTED;
        /* Calculate the acceptance probability */
        dProbabilityA = 1.0;
     }
     else
     {
        dProbabilityA = exp(dExponent);
        /* Perform the test */
        real dAlpha = gmx_rng_uniform_real(rng);
        if (dAlpha < dProbabilityA)
           iResult = ACCEPTED;
        else
        {
           /* Calculate the self-transition probability */
           if (iResultPrev == ACCEPTED)
           {
              if ((dProbabilityA/dProbabilityAPrevInv) * (1 - dProbabilityAPrevInv) < 1 - dProbabilityA)
                 dProbabilityS = (dProbabilityA/dProbabilityAPrevInv) * (1 - dProbabilityAPrevInv);
              else
                 dProbabilityS = (1 - dProbabilityA);
           }
           else
              dProbabilityS = 0;
           /* Continue performing the test */
           if (dAlpha < dProbabilityA + dProbabilityS)
              iResult = REJECTED;
           else
           {
              iResult = REJECTED;
              *bFlip = TRUE;
           }
        }
     }
     /* Update if the movement was accepted or not and with which probability */
     iResultPrev = iResult;
     if (dExponent2 > 0)
        dProbabilityAPrevInv = 1;
     else
        dProbabilityAPrevInv = exp(dExponent2);
  }
  else
  {
     /* Perform metropolis test */
     if (dExponent > 0.0)
     {
        iResult = ACCEPTED;
        dProbabilityA = 1.0;
     }
     else
     {
        dProbabilityA = exp(dExponent);
//        dProbabilityA = exp(dExponent) * current[curre]->q / candidate[curre]->q; // PRUEBA
        real dAlpha = gmx_rng_uniform_real(rng); 
        if (dAlpha < dProbabilityA)
           iResult = ACCEPTED;
        else 
           iResult = REJECTED;
     }
  }

/* PRUEBA */
//if (iTest==MDMC)
// iResult = ACCEPTED;
/* PRUEBA */

  static int MDMCcount = 0;
  static int PMMCcount = 0;
  static int MDMCaccepted = 0;
  static int PMMCaccepted = 0;
  static int PandeSelf = 0;
  static int PandeFlip = 0;

  char sMessage[255];
  if (iTest == MDMC)
  {
     MDMCcount++;
     if (iResult == ACCEPTED)
     {
        MDMCaccepted++;

        /* Calculate reweight and output for autocorrelating */
        *weight = exp( -dBeta * (Etotcandidate - dHamCand));
     }
     else if (ir->bPandeTest)
     {
        if (bFlip == FALSE)
           PandeSelf++;
        else
           PandeFlip++;
     }
     sprintf(sMessage, 
          "\nMDMC step %s, with probability %f. Total accepted = %d. Acceptance rate = %f. \n",
          (iResult==ACCEPTED? "ACCEPTED": "REJECTED"), 
          dProbabilityA,
          (iTest==MDMC? MDMCaccepted: PMMCaccepted),
          (iTest==MDMC? MDMCaccepted / (float) MDMCcount : PMMCaccepted / (float) PMMCcount)
         ); 
  }         
  else if (iTest == PMMC)
  {
     if (iResult == ACCEPTED || iTrial == ir->iMomUpd)
        PMMCcount++;
     if (iResult == ACCEPTED)
        PMMCaccepted++;
     sprintf(sMessage, 
          "PMMC step (trial %d) %s, with probability %f. Total accepted = %d. Acceptance rate = %f. \n",
          iTrial,
          (iResult==ACCEPTED? "ACCEPTED": "REJECTED"), 
          dProbabilityA,
          (iTest==MDMC? MDMCaccepted: PMMCaccepted),
          (iTest==MDMC? MDMCaccepted / (float) MDMCcount : PMMCaccepted / (float) PMMCcount)
         ); 
  } 
  printf("step = %d \n", step);
  fprintf(fplog, "step = %d \n", step);

  printf("%s", sMessage);
  fprintf(fplog, "%s", sMessage);

  if (ir->met == metGSHMC)
  {
     fprintf(fplog, "dShadowHamCand = %f, dShadowHamCurr = %f \n", dHamCand, dHamCurr);
     printf("dShadowHamCand = %f, dShadowHamCurr = %f \n", dHamCand, dHamCurr);
  }
  else if (ir->met == metGHMC || ir->met == metHMC)
  {
     fprintf(fplog, "dHamCand = %f, dHamCurr = %f \n", dHamCand, dHamCurr);
     printf("dHamCand = %f, dHamCurr = %f \n", dHamCand, dHamCurr);
  }
  
  printf("dExponent = %f, dDelta_H = %f, dDeltaXi = %f \n", dExponent, dDelta_H, dDeltaXi);

  if (ir->bPandeTest && iTest == MDMC && iResult == REJECTED)
  {
     printf("Total self-transitions %d and total flipping transitions %d with self-transition probability %f. \n", PandeSelf, PandeFlip, dProbabilityS);
     fprintf(fplog, "Total self-transitions %d and total flipping transitions %d with self-transition probability %f. \n", PandeSelf, PandeFlip, dProbabilityS);
  }

  return iResult;
}

/* Function for calculating hamiltonians in GHMC */
double hamiltonian(gmx_mtop_t *mtop, t_inputrec *ir, t_state *state[7], real Upot)
{
  rvec *Q[6][4];   // Interpolation polynomials for calculating hamiltonians
  real term11 = 0.0;
  real dHamiltonian = 0.0;
  real dt2 = ir->delta_t * ir-> delta_t; // integration timestep. we apply it here instead of in Q
  int  k, l, n;

  gmx_mtop_atomloop_all_t aloop;
  t_atom *atom;

  /* Calculate interpolation polynomials Q */
  for (k = 0; k < 6; k++)
     for (l = 0; l < 4; l++)
        snew(Q[k][l], mtop->natoms);
  centered_differences(state, Q, mtop->natoms);

  /* Calculate the Hamiltonian */
  aloop = gmx_mtop_atomloop_all_init(mtop);
  while (gmx_mtop_atomloop_all_next(aloop, &n, &atom))
  {
     term11 += iprod(Q[1][2][n], Q[1][2][n]) * atom->m;
  }
  dHamiltonian = 0.5 *  term11 / dt2 + Upot;
  
  for (k = 0; k < 6; k++)
     for (l = 0; l < 4; l++)
        sfree(Q[k][l]);

  return dHamiltonian;
}

/* Function for calculating shadow hamiltonians in GSHMC */
double shadow(gmx_mtop_t *mtop, t_inputrec *ir, t_state *state[7], real Upot)
{
  rvec *Q[6][4];   // Interpolation polynomials for calculating shadow hamiltonians
  real term11 = 0.0, term13 = 0.0, term22 = 0.0, term15 = 0.0, term24 = 0.0, term33 = 0.0;
  real dShadow = 0.0;
  real dt2 = ir->delta_t * ir-> delta_t; // integration timestep. we apply it here instead of in Q
  int  k, l, n;

  gmx_mtop_atomloop_all_t aloop;
  t_atom *atom;

  /* Calculate interpolation polynomials Q */
  for (k = 0; k < 6; k++)
     for (l = 0; l < 4; l++)
        snew(Q[k][l], mtop->natoms);
  centered_differences(state, Q, mtop->natoms);

  /* Calculate 4th order shadow hamiltonian */
  if (ir->iHamOrd == 4)
  {
     aloop = gmx_mtop_atomloop_all_init(mtop);
     while (gmx_mtop_atomloop_all_next(aloop, &n, &atom))
     {
        term11 += iprod(Q[1][2][n], Q[1][2][n]) * atom->m;
        term13 += iprod(Q[1][1][n], Q[3][1][n]) * atom->m;
        term22 += iprod(Q[2][1][n], Q[2][1][n]) * atom->m;
     }
     dShadow = 0.5 * ( term11 + (term13 - 0.5*term22)/6.0 ) / dt2 + Upot;
  }

  /* Calculate 6th order shadow hamiltonian */
  if (ir->iHamOrd == 6)
  {
     aloop = gmx_mtop_atomloop_all_init(mtop);
     while (gmx_mtop_atomloop_all_next(aloop, &n, &atom))
     {
        term11 += iprod(Q[1][3][n], Q[1][3][n]) * atom->m;
        term22 += iprod(Q[2][2][n], Q[2][2][n]) * atom->m;
        term13 += iprod(Q[1][2][n], Q[3][2][n]) * atom->m;
        term15 += iprod(Q[1][1][n], Q[5][1][n]) * atom->m;
        term24 += iprod(Q[2][1][n], Q[4][1][n]) * atom->m;
        term33 += iprod(Q[3][1][n], Q[3][1][n]) * atom->m;
     }
     dShadow = 0.5 * (term11 + (term13 - 0.5*term22)/6.0 + (term15 - term24 + 0.5*term33)/180.0) / dt2 + Upot;
  }
 
  for (k = 0; k < 6; k++)
     for (l = 0; l < 4; l++)
        sfree(Q[k][l]);

  return dShadow;
}

/* Function for calculating interpolation polynomials using centered differences */
void centered_differences(t_state *s[7], rvec *Q[6][4], int natoms)
{
  int i,j;
  real sub_3 = 0.0;
  real sub_2 = 0.0;
  real sub_1 = 0.0;
  real add_1 = 0.0;
  real add_2 = 0.0;
  real add_3 = 0.0;

  for (i = 0; i < natoms; i++)
  {
     for (j = 0; j < DIM; j++)
     {
        sub_3 = s[forw3]->x[i][j] - s[back3]->x[i][j]; 
        sub_2 = s[forw2]->x[i][j] - s[back2]->x[i][j]; 
        sub_1 = s[forw1]->x[i][j] - s[back1]->x[i][j]; 
        add_1 = s[forw1]->x[i][j] + s[back1]->x[i][j]; 
        add_2 = s[forw2]->x[i][j] + s[back2]->x[i][j]; 
        add_3 = s[forw3]->x[i][j] + s[back3]->x[i][j]; 

        /* Centered differences of order k with order of accuracy 2 (l=1) */
        Q[0][1][i][j] = s[curre]->x[i][j];
        Q[1][1][i][j] = sub_1 / 2.0;
        Q[2][1][i][j] = add_1 - 2.0 * s[curre]->x[i][j];
        Q[3][1][i][j] = (sub_2 - 2.0 * sub_1) / 2.0;
        Q[4][1][i][j] = add_2 - 4.0*add_1 + 6.0*s[curre]->x[i][j];
        Q[5][1][i][j] = (5.0*sub_1 - 4.0*sub_2 + sub_3) / 2.0;

        /* Centered differences of order k with order of accuracy 4 (l=2) */
        Q[1][2][i][j] = (-sub_2 + 8.0*sub_1) / 12.0;
        Q[2][2][i][j] = (-add_2 + 16.0*add_1 - 30.0*s[curre]->x[i][j]) / 12.0;
        Q[3][2][i][j] = (-sub_3 + 8.0*sub_2 - 13.0*sub_1) / 8.0;

        /* Centered differences of order k with order of accuracy 6 (l=3) */
        Q[1][3][i][j] = (45.0*sub_1 - 9.0*sub_2 + sub_3) / 60.0;
        Q[2][3][i][j] = (2.0*add_3 - 27.0*add_2 + 270.0*add_1 - 490.0*s[curre]->x[i][j]) / 180.0;
     }
  }
}

/* Function for calculating hamiltonians in GHMC and Andersen barostat */
double hamiltonian_andersen(gmx_mtop_t *mtop, t_inputrec *ir, t_state *state[7], real Upot)
{
  rvec *D[6][4];   // Interpolation polynomials for calculating shadow hamiltonians
  real Q[6][4];
  real termQ0 = 0.0, termQ11 = 0.0;
  real termD11 = 0.0;
  real dHamiltonian = 0.0;
  real dt2 = ir->delta_t * ir-> delta_t; // integration timestep. we apply it here instead of in D and Q
  int  k, l, n;

  gmx_mtop_atomloop_all_t aloop;
  t_atom *atom;

  /* Calculate interpolation polynomials Q and D */
  for (k = 0; k < 6; k++)
     for (l = 0; l < 4; l++)
        snew(D[k][l], mtop->natoms);
  centered_differences_andersen(state, Q, D, mtop->natoms);

  /* Calculate the Hamiltonian */
  aloop = gmx_mtop_atomloop_all_init(mtop);
  while (gmx_mtop_atomloop_all_next(aloop, &n, &atom))
  {
     termD11 += iprod(D[1][2][n], D[1][2][n]) * atom->m;
  }
  termQ0 = Q[0][1];
  termQ11 = Q[1][2] * Q[1][2] * ir->dMuMass;
  dHamiltonian = 0.5 * termD11 / dt2 + Upot + ir->dAlphaPress * termQ0 / PRESFAC;
  
  for (k = 0; k < 6; k++)
     for (l = 0; l < 4; l++)
        sfree(D[k][l]);

  return dHamiltonian;
}

double shadow_andersen(gmx_mtop_t *mtop, t_inputrec *ir, t_state *state[7], real Upot)
{
  rvec *D[6][4];   // Interpolation polynomials for calculating shadow hamiltonians
  real Q[6][4];
  real termQ0 = 0.0, termQ1 = 0.0, termQ2 = 0.0, termQ11 = 0.0, termQ112 = 0.0, termQ13 = 0.0, termQ22 = 0.0;
  real termD11 = 0.0, termD112 = 0.0, termD12 = 0.0, termD13 = 0.0, termD22 = 0.0;
  real termD15 = 0.0, termD24 = 0.0, termD33 = 0.0;
  real termQ15 = 0.0, termQ24 = 0.0, termQ33 = 0.0;
  real dShadow = 0.0;
  real dt2 = ir->delta_t * ir->delta_t; // integration timestep. we apply it here instead of in D and Q
  int  k, l, n;
  double mu = ir->dMuMass; // the mass of the piston

  /* Calculate interpolation polynomials Q and D */
  for (k = 0; k < 6; k++)
     for (l = 0; l < 4; l++)
        snew(D[k][l], mtop->natoms);
  centered_differences_andersen(state, Q, D, mtop->natoms);

  gmx_mtop_atomloop_all_t aloop;
  t_atom *atom;
  /* Calculate 4th order shadow hamiltonian */
  if (ir->iHamOrd == 4)
  {
     aloop = gmx_mtop_atomloop_all_init(mtop);
     while (gmx_mtop_atomloop_all_next(aloop, &n, &atom))
     {
        termD11 += iprod(D[1][2][n], D[1][2][n]) * atom->m;
        termD13 += iprod(D[1][1][n], D[3][1][n]) * atom->m;
        termD22 += iprod(D[2][1][n], D[2][1][n]) * atom->m;
     }
     termQ0 = Q[0][1];
     termQ11 = Q[1][2] * Q[1][2] * mu;
     termQ13 = Q[1][1] * Q[3][1] * mu;
     termQ22 = Q[2][1] * Q[2][1] * mu;

     /* Shadow Hamiltonian */
     dShadow = 0.5*(termD11 + termQ11)/dt2 + (2.0*(termQ13 + termD13) - (termQ22 + termD22)) / (24.0*dt2) + Upot + ir->dAlphaPress*termQ0/PRESFAC; 
  }

  /* Calculate 6th order shadow hamiltonian */
  if (ir->iHamOrd == 6)
  {
     aloop = gmx_mtop_atomloop_all_init(mtop);
     while (gmx_mtop_atomloop_all_next(aloop, &n, &atom))
     {
        termD11 += iprod(D[1][3][n], D[1][3][n]) * atom->m;
        termD22 += iprod(D[2][2][n], D[2][2][n]) * atom->m;
        termD13 += iprod(D[1][2][n], D[3][2][n]) * atom->m;
        termD15 += iprod(D[1][1][n], D[5][1][n]) * atom->m;
        termD24 += iprod(D[2][1][n], D[4][1][n]) * atom->m;
        termD33 += iprod(D[3][1][n], D[3][1][n]) * atom->m;
     }
     termQ0 = Q[0][1]; 
     termQ11 = Q[1][3] * Q[1][3] * mu; 
     termQ22 = Q[2][2] * Q[2][2] * mu;
     termQ13 = Q[1][2] * Q[3][2] * mu;
     termQ15 = Q[1][1] * Q[5][1] * mu;
     termQ24 = Q[2][1] * Q[4][1] * mu;
     termQ33 = Q[3][1] * Q[3][1] * mu;
     dShadow = 0.5*(termD11+termQ11)/dt2 + (2.0*(termQ13 + termD13) - (termQ22 + termD22)) / (24.0*dt2) + 
               (termD15 + termQ15 - termD24 - termQ24 + 0.5*termD33 + 0.5*termQ33)/(360.0*dt2) + Upot + ir->dAlphaPress*termQ0/PRESFAC;
  }

  return dShadow;
}

/* Function for calculating interpolation polynomials using centered differences when using GSHMC and Andersen barostat */
void centered_differences_andersen(t_state *s[7], real Q[6][4], rvec *D[6][4], int natoms)
{
  int i,j;
  real subD_3 = 0.0;
  real subD_2 = 0.0;
  real subD_1 = 0.0;
  real addD_1 = 0.0;
  real addD_2 = 0.0;
  real addD_3 = 0.0;
  real subQ_3 = 0.0;
  real subQ_2 = 0.0;
  real subQ_1 = 0.0;
  real addQ_1 = 0.0;
  real addQ_2 = 0.0;
  real addQ_3 = 0.0;

  for (i = 0; i < natoms; i++)
  {
     for (j = 0; j < DIM; j++)
     {
        subD_3 = s[forw3]->x[i][j] - s[back3]->x[i][j]; 
        subD_2 = s[forw2]->x[i][j] - s[back2]->x[i][j];
        subD_1 = s[forw1]->x[i][j] - s[back1]->x[i][j]; 
        addD_1 = s[forw1]->x[i][j] + s[back1]->x[i][j];
        addD_2 = s[forw2]->x[i][j] + s[back2]->x[i][j]; 
        addD_3 = s[forw3]->x[i][j] + s[back3]->x[i][j];

        /* Centered differences of order k with order of accuracy 2 (l=1) */
        D[1][1][i][j] = subD_1 / 2.0;
        D[2][1][i][j] = addD_1 - 2.0 * s[curre]->x[i][j];
        D[3][1][i][j] = (subD_2 - 2.0 * subD_1) / 2.0;
        D[4][1][i][j] = addD_2 - 4.0*addD_1 + 6.0*s[curre]->x[i][j];
        D[5][1][i][j] = (5.0*subD_1 - 4.0*subD_2 + subD_3) / 2.0;

        /* Centered differences of order k with order of accuracy 4 (l=2) */
        D[1][2][i][j] = (-subD_2 + 8.0*subD_1) / 12.0;
        D[2][2][i][j] = (-addD_2 + 16.0*addD_1 - 30.0*s[curre]->x[i][j]) / 12.0;  
        D[3][2][i][j] = (-subD_3 + 8.0*subD_2 - 13.0*subD_1) / 8.0;

        /* Centered differences of order k with order of accuracy 6 (l=3) */
        D[1][3][i][j] = (45.0*subD_1 - 9.0*subD_2 + subD_3) / 60.0;
        D[2][3][i][j] = (2.0*addD_3 - 27.0*addD_2 + 270.0*addD_1 - 490.0*s[curre]->x[i][j]) / 180.0;
     }
  }

  subQ_3 = s[forw3]->q - s[back3]->q;
  subQ_2 = s[forw2]->q - s[back2]->q;
  subQ_1 = s[forw1]->q - s[back1]->q;
  addQ_1 = s[forw1]->q + s[back1]->q;
  addQ_2 = s[forw2]->q + s[back2]->q;
  addQ_3 = s[forw3]->q + s[back3]->q;

  /* Centered differences of order k with order of accuracy 2 (l=1) */
  Q[0][1] = s[curre]->q;
  Q[1][1] = subQ_1 / 2.0;
  Q[2][1] = addQ_1 - 2.0 * s[curre]->q;
  Q[3][1] = (subQ_2 - 2.0 * subQ_1) / 2.0;
  Q[4][1] = addQ_2 - 4.0*addQ_1 + 6.0 * s[curre]->q;
  Q[5][1] = (5.0*subQ_1 - 4.0*subQ_2 + subQ_3) / 2.0;

  /* Centered differences of order k with order of accuracy 4 (l=2) */
  Q[1][2] = (-subQ_2 + 8.0*subQ_1) / 12.0;
  Q[2][2] = (-addQ_2 + 16.0*addQ_1 - 30.0*s[curre]->q) / 12.0;
  Q[3][2] = (-subQ_3 + 8.0*subQ_2 - 13.0*subQ_1) / 8.0;

  /* Centered differences of order k with order of accuracy 6 (l=3) */
  Q[1][3] = (45.0*subQ_1 - 9.0*subQ_2 + subQ_3) / 60.0;
  Q[2][3] = (2.0*addQ_3 - 27.0*addQ_2 + 270.0*addQ_1 - 490.0*s[curre]->q) / 180.0;
}

void momentum_flip(int natoms, rvec v[])
{
  int n, d;
  for (n = 0; n < natoms; n++)
     for (d = 0; d < DIM; d++) 
        v[n][d] = -1.0 * v[n][d];
}

void momentum_update(FILE *fplog, gmx_constr_t constr, t_inputrec *ir, t_mdatoms *mdatoms, t_state *state,
                     rvec *f, t_graph *graph, t_commrec *cr, t_nrnb *nrnb,
                     t_forcerec *fr, gmx_localtop_t *top, tensor shake_vir,
                     gmx_rng_t rng, double *dDeltaXi, rvec *f_forw, rvec *f_back)
{
  real phi = ir->dPhi;
  real delta_t = ir->delta_t;
  real *massT = mdatoms->massT; 
  int n, d;
  int start  = mdatoms->start;
  int homenr = mdatoms->homenr;
  int nrend = start + homenr;
  real u, u_prime, vq_prime, boltz; // Andersen barostat

  boltz=BOLTZ*ir->dTempi;

  rvec *xcopy=NULL;
  rvec *vcopy=NULL;

  rvec *vel=NULL, *vel_prime=NULL;
  rvec *xi=NULL,  *xi_prime=NULL;
  snew(vel,       state->nalloc);
  snew(vel_prime, state->nalloc);
  snew(xi,        state->nalloc);
  snew(xi_prime,  state->nalloc);

  /* Create a new random velocity vector xi */
  low_mspeed2(fplog, cr, ir->dTempi, mdatoms, xi, rng);

  /* stop center of mass motion for the new xi */
  stop_cm(stdout, state->natoms, massT, state->x, xi);

  /* constrain the new xis        */
  if (constr)
  {
     snew(xcopy, state->nalloc);
     snew(vcopy, state->nalloc);

     copy_rvecn(state->x, xcopy, 0, state->natoms);
     copy_rvecn(state->v, vcopy, 0, state->natoms);
     copy_rvecn(xi,    state->v, 0, state->natoms);

     do_constrain_first(fplog, constr, ir, mdatoms, state, f,
                        graph, cr, nrnb, fr, top, shake_vir);

     copy_rvecn(state->v,    xi, 0, state->natoms);
     copy_rvecn(xcopy, state->x, 0, state->natoms);
     copy_rvecn(vcopy, state->v, 0, state->natoms);

     sfree(xcopy);
     sfree(vcopy);
  }

  /* perform the partial momentum update */
  /* also calculate dDeltaXi for the Pande test later */
  *dDeltaXi = 0.0;
  copy_rvecn(state->v, vel, 0, state->natoms);


  /* variable change to increase acceptance rate */
  if (ir->bVarChange && ir->met == metGSHMC) // do variable change
     for (n = start; n < nrend; n++)
        if (massT[n] > 0)
           for (d=0; d<DIM; d++) 
              vel[n][d] = vel[n][d] - delta_t*(-f_forw[n][d] + f_back[n][d]) / (24.0*massT[n]);
  /* variable change to increase acceptance rate */


  for (n = start; n < nrend; n++)
  {
     for (d=0; d<DIM; d++) 
     {
        vel_prime[n][d] =  cos(phi)*vel[n][d] + sin(phi)*xi[n][d];
        xi_prime[n][d]  = -sin(phi)*vel[n][d] + cos(phi)*xi[n][d];
        *dDeltaXi += (xi_prime[n][d] - xi[n][d])*(xi_prime[n][d] + xi[n][d]) * massT[n];
     }
  }
  copy_rvecn(vel_prime, state->v, 0, state->natoms);

  if (ir->epc == epcANDERSEN)
  {
     if (MASTER(cr))
     {
        /* New terms derived from Andersen barostat */
        u = sqrt(boltz) * gmx_rng_gaussian_real(rng) / sqrt(ir->dMuMass);
        vq_prime =  cos(phi)*(state->v_q) + sin(phi)*u;
        u_prime  = -sin(phi)*(state->v_q) + cos(phi)*u;
        state->v_q = vq_prime;
        *dDeltaXi += (sqr(u_prime) - sqr(u)) * ir->dMuMass;
     }
     if (PAR(cr))
        gmx_bcast(sizeof(double), &state->v_q, cr);
  }


  /* variable change to increase acceptance rate */
  if (ir->bVarChange && ir->met == metGSHMC) // undo variable change
     for (n = start; n < nrend; n++)
        if (massT[n] > 0)
           for (d=0; d<DIM; d++) 
              vel_prime[n][d] = vel_prime[n][d] + delta_t*(-f_forw[n][d] + f_back[n][d]) / (24.0*massT[n]);
  /* variable change to increase acceptance rate */


  *dDeltaXi = (*dDeltaXi)/2.0;
  if (PAR(cr))
     gmx_sumd(1, dDeltaXi, cr);

  sfree(vel);
  sfree(vel_prime);
  sfree(xi);
  sfree(xi_prime);
}

void momentum_generate(FILE *fplog, gmx_constr_t constr, t_inputrec *ir, t_mdatoms *mdatoms, t_state *state,
                     rvec *f, t_graph *graph, t_commrec *cr, t_nrnb *nrnb,
                     t_forcerec *fr, gmx_localtop_t *top, tensor shake_vir,
                     gmx_rng_t rng)
{
  /* Create a new random velocity vector on state->v */
  low_mspeed2(fplog, cr, ir->dTempi, mdatoms, state->v, rng);

  /* stop center of mass motion for the new state->v */
  stop_cm(stdout, state->natoms, mdatoms->massT, state->x, state->v);

  /* constrain the new state->v                      */
  if (constr)
  {
     do_constrain_first(fplog, constr, ir, mdatoms, state, f,
                        graph, cr, nrnb, fr, top, shake_vir);
  }
}

/* save or restore a global state, including: positions, velocities, forces and energies */
void backup_state(t_state *state_a, t_state *state_b, rvec **f_a, rvec **f_b) 
{
    int i, j, nc;

//typedef struct
//{
//  int           natoms;
//  int           ngtc;
//  int           nnhpres;
//  int           nhchainlength; /* length of each nose-hoover chain      */
//  int           nrng;
//  int           nrngi;
//  int           flags;  /* Flags telling which entries are present      */
//  real          lambda; /* the free energy switching parameter          */
     state_b->natoms     = state_a->natoms;
     state_b->ngtc       = state_a->ngtc;
     state_b->nnhpres    = state_a->nnhpres;
     state_b->nhchainlength = state_a->nhchainlength;
     state_b->nrng    = state_a->nrng;
     state_b->nrngi   = state_a->nrngi;
     state_b->flags   = state_a->flags;
     state_b->lambda  = state_a->lambda;
//  matrix        box;    /* box vector coordinates                       */
//  matrix        box_rel; /* Relitaive box vectors to preserve shape     */
//  matrix        boxv;   /* box velocitites for Parrinello-Rahman pcoupl */
//  matrix        pres_prev; /* Pressure of the previous step for pcoupl  */
//  matrix        svir_prev; /* Shake virial for previous step for pcoupl */
//  matrix        fvir_prev; /* Force virial of the previous step for pcoupl  */
     copy_mat(state_a->box,     state_b->box);
     copy_mat(state_a->box_rel, state_b->box_rel);
     copy_mat(state_a->boxv,    state_b->boxv);
     copy_mat(state_a->pres_prev, state_b->pres_prev);
     copy_mat(state_a->svir_prev, state_b->svir_prev);
     copy_mat(state_a->fvir_prev, state_b->fvir_prev);
//  double        *nosehoover_xi;  /* for Nose-Hoover tcoupl (ngtc)       */
//  double        *nosehoover_vxi; /* for N-H tcoupl (ngtc)               */
//  double        *nhpres_xi;  /* for Nose-Hoover pcoupl for barostat     */
//  double        *nhpres_vxi; /* for Nose-Hoover pcoupl for barostat     */
//  double        *therm_integral; /* for N-H/V-rescale tcoupl (ngtc)     */
    srenew(state_b->nosehoover_xi,  state_b->nhchainlength * state_b->ngtc);
    srenew(state_b->nosehoover_vxi, state_b->nhchainlength * state_b->ngtc);
    srenew(state_b->nhpres_xi,      state_b->nhchainlength * state_b->nnhpres);
    srenew(state_b->nhpres_vxi,     state_b->nhchainlength * state_b->nnhpres);
    srenew(state_b->therm_integral, state_b->ngtc);
    for (i = 0; i < state_b->ngtc; i++)
    {
        nc = i * state_b->nhchainlength;
        for (j = 0; j < state_b->nhchainlength; j++)
        {
            state_b->nosehoover_xi[nc+j]  = state_a->nosehoover_xi[nc+j];
            state_b->nosehoover_vxi[nc+j] = state_a->nosehoover_vxi[nc+j];
        }
        if (state_a->therm_integral != NULL)
            state_b->therm_integral[i] = state_a->therm_integral[i];
    }
    if (state_a->nhpres_xi != NULL)
    {
        for (i = 0; i<state_b->nnhpres; i++)
        {
            nc = i * state_b->nhchainlength;
            for (j = 0; j < state_b->nhchainlength; j++)
            {
                state_b->nhpres_xi[nc+j]  = state_a->nhpres_xi[nc+j];
                state_b->nhpres_vxi[nc+j] = state_a->nhpres_vxi[nc+j];
            }
        }
    }
//  real          veta; /* trotter based isotropic P-coupling             */
//  real          vol0; /* initial volume,required for computing NPT conserverd quantity */
    state_b->veta       = state_a->veta;
    state_b->vol0       = state_a->vol0;
//  int           nalloc; /* Allocation size for x, v and sd_x when !=NULL*/
//  rvec          *x;     /* the coordinates (natoms)                     */
//  rvec          *v;     /* the velocities (natoms)                      */
    /* Make sure we have enough space for x and v */
    if (state_a->nalloc != state_b->nalloc)
    {
       state_b->nalloc = state_a->nalloc;
       srenew(state_b->x,state_b->nalloc);
       srenew(state_b->v,state_b->nalloc);
    }
    copy_rvecn(state_a->x, state_b->x, 0, state_b->natoms);
    copy_rvecn(state_a->v, state_b->v, 0, state_b->natoms);
//  rvec          *sd_X;  /* random part of the x update for stoch. dyn.  */
//  rvec          *cg_p;  /* p vector for conjugate gradient minimization */
    if (state_a->sd_X)
    {
       srenew(state_b->sd_X, state_b->nalloc);
       copy_rvecn(state_a->sd_X, state_b->sd_X, 0, state_a->natoms);
    }
    if (state_a->cg_p)
    {
       srenew(state_b->cg_p, state_b->nalloc);
       copy_rvecn(state_a->cg_p, state_b->cg_p, 0, state_a->natoms);
    }

//  unsigned int  *ld_rng;  /* RNG random state                           */
//  int           *ld_rngi; /* RNG index                                  */
    srenew(state_b->ld_rng, state_b->nrng);
    srenew(state_b->ld_rngi, state_b->nrngi);
    for(i=0; i<state_b->nrng; i++)
       state_b->ld_rng[i] = state_a->ld_rng[i];
    for(i=0; i<state_b->nrngi; i++)
       state_b->ld_rngi[i] = state_a->ld_rngi[i];
//  history_t     hist;   /* Time history for restraints                  */

//  ekinstate_t   ekinstate; /* The state of the kinetic energy data      */

//  energyhistory_t  enerhist; /* Energy history for statistics           */

//  int           ddp_count; /* The DD partitioning count for this state  */
//  int           ddp_count_cg_gl; /* The DD part. count for index_gl     */
//  int           ncg_gl; /* The number of local charge groups            */
//  int           *cg_gl; /* The global cg number of the local cgs        */
//  int           cg_gl_nalloc; /* Allocation size of cg_gl;              */
    state_b->ddp_count = state_a->ddp_count;
    state_b->ddp_count_cg_gl = state_a->ddp_count_cg_gl;
    state_b->ncg_gl = state_a->ncg_gl;
    state_b->cg_gl_nalloc = state_a->cg_gl_nalloc;
    srenew(state_b->cg_gl, state_b->cg_gl_nalloc);
    for(i=0; i<state_b->ncg_gl; i++)
       state_b->cg_gl[i] = state_a->cg_gl[i];

//  real          q;    /* Volume                                        */
//  real          v_q;  /* Velocity for the volume                       */
    state_b->q   = state_a->q;    /* Andersen barostat                   */
    state_b->v_q = state_a->v_q;  /* Andersen barostat                   */
//} t_state;

   if (f_a)
   {
      srenew(*f_b, state_a->nalloc);
      copy_rvecn(*f_a, *f_b, 0, state_a->natoms);
   } 
}
