enum GSHMC_part {NONE, MDMC, PMMC};
enum leap {back3, back2, back1, curre, forw1, forw2, forw3};
enum test {REJECTED, ACCEPTED};

/*int metropolis(FILE *fplog, gmx_mtop_t *mtop, t_inputrec *ir, t_state *befor[7], t_state *after[7], double dDeltaXi,
               real Uold, real Unew, gmx_rng_t rng, int iTest, real Etot, int iTrial, double *weight,
               gmx_large_int_t step);*/
int metropolis(FILE *fplog, gmx_mtop_t *mtop, t_inputrec *ir, t_state *befor[7], t_state *after[7], double dDeltaXi,
               real Uold, real Unew, gmx_rng_t rng, int iTest, real Etotold, real Etotnew, int iTrial, double *weight,
               gmx_large_int_t step, gmx_bool *bFlip);

/* Function for calculating shadow hamiltonians in GSHMC */
double shadow(gmx_mtop_t *mtop, t_inputrec *inputrec, t_state *x[7], real Upot);

/* Function for calculating interpolation polynomials using centered differences */
void centered_differences(t_state *x[7], rvec *Q[6][4], int natoms);

/* Function for calculating shadow hamiltonians in GSHMC and Andersen barostat */
double shadow_andersen(gmx_mtop_t *mtop, t_inputrec *ir, t_state *state[7], real Etot);
double shadow_andersen2(gmx_mtop_t *mtop, t_inputrec *ir, t_state *state[7], real Etot);

/* Function for calculating interpolation polynomials using centered differences when using GSHMC and Andersen barostat */
void centered_differences_andersen(t_state *s[7], real Q[6][4], rvec *D[6][4], int natoms);

void momentum_flip(int natoms, rvec v[]);

void momentum_update(FILE *fplog, gmx_constr_t constr,
                     t_inputrec *ir, t_mdatoms *mdatoms,
                     t_state *state, rvec *f,
                     t_graph *graph, t_commrec *cr, t_nrnb *nrnb,
                     t_forcerec *fr, gmx_localtop_t *top, tensor shake_vir,
                     gmx_rng_t rng, double *Xi, rvec *f_forw, rvec *f_back);

void momentum_generate(FILE *fplog, gmx_constr_t constr, t_inputrec *ir, t_mdatoms *mdatoms, t_state *state,
                     rvec *f, t_graph *graph, t_commrec *cr, t_nrnb *nrnb,
                     t_forcerec *fr, gmx_localtop_t *top, tensor shake_vir,
                     gmx_rng_t rng);

void backup_state(t_state *state_a, t_state *state_b, rvec **f_a, rvec **f_b);

