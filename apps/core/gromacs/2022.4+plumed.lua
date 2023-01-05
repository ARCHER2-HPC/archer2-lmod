help([[
Gromacs 2022.4+plumed
=====================
This module sets up your environment to access Gromacs 2022.4
patched with plumed v2.8.1.
Once loaded you can access Gromacs single- and double-precision
MPI executables using the 'gmx_mpi' command and the `gmx_mpi_d` command
respectively. You can also use a serial version on the login node
by using the 'gmx' command.

   - Installed by: J. Sindt, EPCC"
   - Date: 6 December 2022\n"

]])

load("cpe/21.09")
load("PrgEnv-gnu")
load("gcc/11.2.0")
load("cray-fftw/3.3.8.11")

pushenv("SLURM_CPU_FREQ_REQ","2250000")

local pkgName = myModuleName()
local pkgNameVer = myModuleFullName()
local pkgNameBase = pathJoin("/work/y07/shared/apps/core", pkgName)
local pkgVersionBase = pathJoin("/work/y07/shared/apps/core", pkgNameVer)

prepend_path("LD_LIBRARY_PATH", os.getenv("CRAY_LD_LIBRARY_PATH"))
prepend_path("PATH", pathJoin(pkgVersionBase, "gromacs-2022.4/bin"))
prepend_path("PATH", pathJoin(pkgVersionBase, "plumed-2.8.1/bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin(pkgVersionBase, "plumed-2.8.1/lib"))

family("gromacs")

