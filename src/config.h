/* Manually created from config.h.in to work with cmake */

/* Disable warnings about double-to-float conversion accuracy loss on MSVC */
#ifdef _MSC_VER
#pragma warning (disable : 4305)
#pragma warning (disable : 4244)
#pragma warning (disable : 4101)
#pragma warning (disable : 4996)
#pragma warning (disable : 4267)
#pragma warning (disable : 4090)
#endif

/* Name of package (translate from cmake to autoconf macro name) */
#define PACKAGE  "Gromacs"

/* Version number of package (translate from cmake to autoconf macro name) */
#define VERSION  "4.5.4"

/* Use the version string from generated version.h */
#define USE_VERSION_H

/* Default location of data files */
#define GMXLIBDIR "/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/share/gromacs/top"

/* Hardware and OS version for build host */
#define BUILD_MACHINE "Linux 3.5.0-45-generic x86_64"

/* Date and time for build */
#define BUILD_TIME "mié ene  8 18:08:17 CET 2014"

/* User doing build */
#define BUILD_USER "mfernandez@dulx0013 [CMAKE]"

/* Turn off water-water neighborlist optimization only */
/* #undef DISABLE_WATERWATER_NLIST */

/* Turn off all water neighborlist optimization */
/* #undef DISABLE_WATER_NLIST */

/* Fortran support */
/* #undef GMX_FORTRAN */

/* Define to a macro mangling the given C identifier (in lower and upper
   case), which must not contain underscores, for linking with Fortran. */
#define F77_FUNC(name,NAME)     name ## _

/* As F77_FUNC, but for C identifiers containing underscores. */
#define F77_FUNC_(name,NAME)    name ## _

/* Use the d prefix on fftw2 includes */
/* #undef FFTW2_NAME_DFFTW */

/* Dont use any prefix on fftw2 includes */
/* #undef FFTW2_NAME_FFTW */

/* Use the s prefix on fftw2 includes */
/* #undef FFTW2_NAME_SFFTW */

/* IEEE754 floating-point format. Memory layout is defined by macros
 * GMX_IEEE754_BIG_ENDIAN_BYTE_ORDER and GMX_IEEE754_BIG_ENDIAN_WORD_ORDER. 
 */
#define GMX_FLOAT_FORMAT_IEEE754

/* Use assembly intrinsics kernels for BlueGene */
/* #undef GMX_BLUEGENE */

/* Power6 acceleration */
/* #undef GMX_POWER6 */

/* Work around broken calloc() */
/* #undef GMX_BROKEN_CALLOC */

/* Enable special hacks for Cray XT3 */
/* #undef GMX_CRAY_XT3 */

/* Do not optimize FFTW setups (not needed with SSE FFT kernels) */
/* #undef GMX_DISABLE_FFTW_MEASURE */

/* Compile in double precision */
#define GMX_DOUBLE

/* Use Built-in FFTPACK FFT library */
/* #undef GMX_FFT_FFTPACK */

/* Use FFTW2 FFT library */
/* #undef GMX_FFT_FFTW2 */

/* Use FFTW3 FFT library */
#define GMX_FFT_FFTW3

/* Use Intel MKL FFT library */
/* #undef GMX_FFT_MKL */

/* Use AMD core math library */
/* #undef GMX_FFT_ACML */

/* Single-precision SSE instructions on ia32 */
/* #undef GMX_IA32_SSE */

/* Double-precision SSE2 instructions on ia32 */
/* #undef GMX_IA32_SSE2 */

/* Use ia64 assembly tuned for Itanium2 */
/* #undef GMX_IA64_ASM */

/* Integer byte order is big endian. */
/* #undef GMX_INTEGER_BIG_ENDIAN */

/* Use our own instead of system XDR libraries */
/* #undef GMX_INTERNAL_XDR */

/* Use MPI (with mpicc) for parallelization */
/* #undef GMX_LIB_MPI */

/* MPI_IN_PLACE exists for collective operations */
/* #undef MPI_IN_PLACE_EXISTS */

/* Make a parallel version of GROMACS using message passing 
   (MPI or thread_mpi) */
#define GMX_MPI

/* Use threads for parallelization */
#define GMX_THREADS

/* Use old threading (domain decomp force calc) code */
/* #undef GMX_THREAD_SHM_FDECOMP */

/* Ignore calls to nice(3) */
/* #undef GMX_NO_NICE */

/* Ignore calls to system(3) */
/* #undef GMX_NO_SYSTEM */

/* Use PowerPC Altivec inner loops */
/* #undef GMX_PPC_ALTIVEC */

/* Use (modified) Gamess-UK for QM-MM calculations */
/* #undef GMX_QMMM_GAMESS */

/* Use (modified) Gaussian0x for QM-MM calculations */
/* #undef GMX_QMMM_GAUSSIAN */

/* Use (modified) Mopac 7 for QM-MM calculations */
/* #undef GMX_QMMM_MOPAC */

/* Use the GROMACS software 1/sqrt(x) */
#define GMX_SOFTWARE_INVSQRT

/* Use the PowerPC hardware 1/sqrt(x) */
/* #undef GMX_POWERPC_INVSQRT */

/* Compile with dlopen */
#define GMX_DLOPEN

/* Define when pthreads are used */
#define THREAD_PTHREADS

/* Define when Windows threads are used */
/* #undef THREAD_WINDOWS */

/* Define for busy wait option  */
/* #undef TMPI_WAIT_FOR_NO_ONE */

/* Define for copy buffer option */
/* #undef TMPI_COPY_BUFFER */

/* Define for profiling option */
/* #undef TMPI_PROFILE */

/* Define for sysconf() */
#define HAVE_SYSCONF

/* Define for GetSystemInfo() */
/* #undef HAVE_SYSTEM_INFO */

/* Single-precision SSE instructions on X86_64 */
/* #undef GMX_X86_64_SSE */

/* Double-precision SSE2 instructions on X86_64 */
#define GMX_X86_64_SSE2

/* Enable x86 gcc inline assembly */
#define GMX_X86_GCC_INLINE_ASM

/* Enable x86 MSVC inline assembly */
/* #undef GMX_X86_MSVC_INLINE_ASM */

/* Support for SSE intrinsics */
/* #undef GMX_SSE */

/* Support for SSE2 intrinsics */
/* #undef GMX_SSE2 */

/* Support for SSE3 intrinsics */
/* #undef GMX_SSE3 */

/* Support for SSE4.1 intrinsics */
/* #undef GMX_SSE4_1 */

/* Define to 1 if you have the <altivec.h> header file. */
/* #undef HAVE_ALTIVEC_H */

/* Define to 1 if the system has the type gmx_bool. */
/* #undef HAVE_BOOL */

/* Define to 1 if fseeko (and presumably ftello) exists and is declared. */
#define HAVE_FSEEKO

/* Define to 1 if _fseeki64 (and presumably _fseeki64) exists and is declared. */
/* #undef HAVE__FSEEKI64 */

/* Define to 1 if you have the m library (-lm). */
#define HAVE_LIBM

/* Define to 1 if you have the mkl library (-lmkl). */
/* #undef HAVE_LIBMKL */

/* Define to 1 if you have the gsl library (-lgsl). */
/* #undef HAVE_LIBGSL */

/* Define to 1 if you have the xml2 library (-lxml2). */
/* #undef HAVE_LIBXML2 */

/* Define to 1 if you have the dl library (-ldl). */
/* #undef HAVE_LIBDL */

/* Have io.h (windows)*/
/* #undef HAVE_IO_H */

/* Define to 1 if you have the strcasecmp() function. */
#define HAVE_STRCASECMP

/* Define to 1 if you have the strdup() function. */
#define HAVE_STRDUP

/* Define to 1 if you have the vfprintf() function. */
/* #undef HAVE_VFPRINTF */

/* Define to 1 if you have the memcmp() function. */
#define HAVE_MEMCMP

/* Define to 1 if you have the posix_memalign() function. */
#define HAVE_POSIX_MEMALIGN

/* Define to 1 if you have the memalign() function. */
#define HAVE_MEMALIGN

/* Define to 1 if you have the MSVC _aligned_malloc() function. */
/* #undef HAVE__ALIGNED_MALLOC */

/* Define to 1 if you have the gettimeofday() function. */
#define HAVE_GETTIMEOFDAY

/* Define to 1 if you have the cbrt() function. */
#define HAVE_CBRT

/* Define to 1 if you have the isnan() function. */
#define HAVE_ISNAN

/* Define to 1 if you have the _isnan() function. */
/* #undef HAVE__ISNAN */

/* Define to 1 if you have the isfinite() function. */
/* #undef HAVE_ISFINITE */

/* Define to 1 if you have the _isfinite() function. */
/* #undef HAVE__ISFINITE */

/* Define to 1 if you have the fsync() function. */
#define HAVE_FSYNC

/* Define to 1 if you have the Windows _commit() function. */
/* #undef HAVE__COMMIT */

/* Define to 1 if you have the fileno() function. */
#define HAVE_FILENO

/* Define to 1 if you have the _fileno() function. */
/* #undef HAVE__FILENO */

/* Define to 1 if you have the <string.h> header file. */
#define HAVE_STRING_H

/* Define to 1 if yo have the <math.h> header file. */
#define HAVE_MATH_H

/* Define to 1 if yo have the <limits.h> header file. */
#define HAVE_LIMITS_H

/* Define to 1 if yo have the <memory.h> header file. */
#define HAVE_MEMORY_H

/* Define to 1 if yo have the <unistd.h> header file. */
#define HAVE_UNISTD_H

/* Define to 1 if yo have the <direct.h> header file. */
/* #undef HAVE_DIRECT_H */

/* Define to 1 if yo have the <pwd.h> header file. */
#define HAVE_PWD_H

/* Define to 1 if yo have the <stdint.h> header file. */
#define HAVE_STDINT_H

/* Define to 1 if yo have the <stdlib.h> header file. */
#define HAVE_STDLIB_H

/* Define to 1 if yo have the <pthread.h> header file. */
#define HAVE_PTHREAD_H

/* Define to 1 if yo have the <dirent.h> header file. */
#define HAVE_DIRENT_H

/* Define to 1 if yo have the <inttypes.h> header file. */
#define HAVE_INTTYPES_H

/* Define to 1 if yo have the <regex.h> header file. */
#define HAVE_REGEX_H

/* Define to 1 if you have the <sys/types.h> header file. */
#define HAVE_SYS_TYPES_H

/* Define to 1 if you have the <sys/stat.h> header file. */
#define HAVE_SYS_STAT_H

/* Define to 1 if you have the <sys/time.h> header file. */
#define HAVE_SYS_TIME_H

/* Define to 1 if you have the <rpc/rpc.h> header file. */
#define HAVE_RPC_RPC_H

/* Define to 1 if you have the <rpc/xdr.h> header file. */
#define HAVE_RPC_XDR_H

/* Define to 1 if yo have the <xmmintrin.h> header file. */
#define HAVE_XMMINTRIN_H

/* Define to 1 if yo have the <emmintrin.h> header file. */
#define HAVE_EMMINTRIN_H

/* Define to 1 if yo have the <pmmintrin.h> header file. */
/* #undef HAVE_PMMINTRIN_H */

/* Define to 1 if yo have the <smmintrin.h> header file. */
/* #undef HAVE_SMMINTRIN_H */

/* Define for sched.h (this is for thread_mpi)*/
#define HAVE_SCHED_H

/* Define to 1 if you have the vprintf() function. */
#define HAVE_VPRINTF

/* Bytes in IEEE fp word are in big-endian order if set, little-endian if not.
   Only relevant when FLOAT_FORMAT_IEEE754 is defined. */
/* #undef GMX_IEEE754_BIG_ENDIAN_BYTE_ORDER */

/* The two words in a double precision variable are in b ig-endian order if
   set, little-endian if not. Do NOT assume this is the same as the byte
   order! Only relevant when FLOAT_FORMAT_IEEE754 is defined. */
/* #undef GMX_IEEE754_BIG_ENDIAN_WORD_ORDER */

/* Define as the return type of signal handlers (int or void). */
#define RETSIGTYPE void

/* Define if SIGUSR1 is present */
#define HAVE_SIGUSR1

/* The size of int, as computed by sizeof. */
#define SIZEOF_INT 4

/* The size of long int, as computed by sizeof. */
#define SIZEOF_LONG_INT 8

/* The size of long long int, as computed by sizeof. */
#define SIZEOF_LONG_LONG_INT 8

/* The size of off_t, as computed by sizeof. */
#define SIZEOF_OFF_T 8

/* The size of void*, as computed by sizeof. */
#define SIZEOF_VOIDP 8

/* Define to 1 to make fseeko visible on some hosts (e.g. glibc 2.2). */
/* #undef _LARGEFILE_SOURCE */

/* Define for large files, on AIX-style hosts. */
/* #undef _LARGE_FILES */

/* Some systems requires this to be set to 64 for large file support */
/* #undef _FILE_OFFSET_BITS */

/* Gromacs shortcut define for fseeko & ftello being present with 64-bit support */
#define GMX_LARGEFILES

/* Define to int if <sys/types.h> does not define. */
/* #undef gid_t */

/* Define to __inline__ or __inline if that is what the C compiler
   calls it, or to nothing if inline is not supported under any name.  */
#ifndef __cplusplus
#define inline 
#endif

/* Define to __restrict__ or __restrict if that is what the C compiler
   calls it, or to nothing if restrict is not supported under any name.  */
#define restrict 

#ifndef CPLUSPLUS
#ifdef __cplusplus
#define CPLUSPLUS
#endif
#endif  

/* Define to long int if <sys/types.h> does not define. */                    
/* #undef off_t */
                                                                                
/* Define to unsigned int if <sys/types.h> does not define. */
/* #undef size_t */

/* Define to int if <sys/types.h> does not define. */
/* #undef uid_t */
                                                                
/* Build special-purpose mdrun library */
/* #undef GMX_FAHCORE */

#ifdef GMX_FAHCORE
#define FULLINDIRECT 1
#define USE_FAH_XDR  1
#include "swindirect.h"
#endif

/* Define if we have pipes */
#define HAVE_PIPES


/* Catch stupid CMake problems on OS X */
#ifdef __APPLE__
#  if ((defined(__LP64__) && __LP64__ && defined(SIZEOF_VOIDP) && SIZEOF_VOIDP<8) || ( (!defined(__LP64__) || __LP64__==0) && (defined(SIZEOF_VOIDP) && SIZEOF_VOIDP>4)))
#    error "Inconsistency between current OS X architecture and the one used to generate original" 
#    error "CMake configuration. This is probably caused by starting CMake with the default value"
#    error "for CMAKE_OSX_ARCHITECTURES (blank), and then changing it. In this case all the tests"
#    error "will have been performed with the original (now incorrect) architecture."
#    error "To fix this, set CMAKE_OSX_ARCHITECTURES on the _command_line_ before starting CMake,"
#    error "or create a new such entry with your choice in the GUI _before_ hitting 'configure'."
#  endif
#endif
