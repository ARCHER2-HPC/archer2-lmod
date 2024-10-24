help([[
Gromacs 2022.4+plumed
=====================
This module sets up your environment to access Gromacs 2022.4
patched with plumed v2.8.2.
Once loaded you can access Gromacs single- and double-precision
MPI executables using the 'gmx_mpi' command and the `gmx_mpi_d` command
respectively. You can also use a serial version on the login node
by using the 'gmx' command.

   - Installed by: R. Apóstolo, EPCC"
   - Date: 31 March 2023"

]])

-- load("cpe/22.12")
load("cray-python/3.9.13.1")
load("cray-fftw/3.3.10.3")

pushenv("SLURM_CPU_FREQ_REQ","2250000")

local pkgName = myModuleName()
local pkgNameVer = "gromacs/2022.4+plumed"
local pkgNameBase = pathJoin("/work/y07/shared/apps/core", pkgName)
local pkgVersionBase = pathJoin("/work/y07/shared/apps/core", pkgNameVer)

pushenv("PLUMED_ROOT", pathJoin(pkgVersionBase, "plumed2-2.8.2_omp/lib/plumed"))

prepend_path("LD_LIBRARY_PATH", os.getenv("CRAY_LD_LIBRARY_PATH"))
prepend_path("PATH", pathJoin(pkgVersionBase, "gromacs-2022.4/bin"))
prepend_path("PATH", pathJoin(pkgVersionBase, "plumed2-2.8.2_omp/bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin(pkgVersionBase, "plumed2-2.8.2_omp/lib"))

family("gromacs")

