help([[
Gromacs 2022.4
==============
This module sets up your environment to access Gromacs 2022.4.
Once loaded you can access Gromacs single- and double-precision
MPI executables using the 'gmx_mpi' command and the `gmx_mpi_d` command
respectively. You can also use a serial version on the login node
by using the 'gmx' command.

   - Installed by: J. Sindt, EPCC"
   - Date: 2 February 2023\n"

]])

load("PrgEnv-gnu")
load("cpe/21.09")

pushenv("SLURM_CPU_FREQ_REQ","2250000")

local pkgName = myModuleName()
local pkgNameVer = myModuleFullName()
local pkgNameBase = pathJoin("/work/y07/shared/apps/core", pkgName)
local pkgVersionBase = pathJoin("/work/y07/shared/apps/core", pkgNameVer)

prepend_path("LD_LIBRARY_PATH", os.getenv("CRAY_LD_LIBRARY_PATH"))
prepend_path("PATH", pathJoin(pkgVersionBase, "bin"))

family("gromacs")

