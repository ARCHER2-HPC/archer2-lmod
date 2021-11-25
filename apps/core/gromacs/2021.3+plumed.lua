help([[
Gromacs 2021.3+plumed
=====================
This module sets up your environment to access Gromacs 2021.3
patched with plumed v2.7.2.
Once loaded you can access Gromacs single- and double-precision
MPI executables using the 'gmx_mpi' command and the `gmx_mpi_d` command
respectively. You can also use a serial version on the login node
by using the 'gmx' command.

   - Installed by: J. Sindt, EPCC"
   - Date: 18 October 2021\n"

]])

load("cpe/21.09")
load("PrgEnv-gnu")
load("gcc/11.2.0")

local pkgName = myModuleName()
local pkgNameVer = myModuleFullName()
local pkgNameBase = pathJoin("/work/y07/shared/apps/core", pkgName)
local pkgVersionBase = pathJoin("/work/y07/shared/apps/core", pkgNameVer)

prepend_path("PATH", pathJoin(pkgVersionBase, "gromacs-2021.3/bin"))
prepend_path("PATH", pathJoin(pkgVersionBase, "plumed-2.7.2/bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin(pkgVersionBase, "plumed-2.7.2/lib"))

family("gromacs")
