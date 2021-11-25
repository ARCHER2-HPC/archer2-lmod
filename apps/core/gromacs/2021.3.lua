help([[
Gromacs 2021.3
==============
This module sets up your environment to access Gromacs 2021.3
Once loaded you can access Gromacs single- and double-precision
MPI executables using the 'gmx_mpi' command
respectively. You can also use a serial version on the login node
by using the 'gmx' command.

   - Installed by: A. Turner, EPCC"
   - Date: 5 October 2021\n"

]])

load("PrgEnv-gnu")
load("cpe/21.09")

local pkgName = myModuleName()
local pkgNameVer = myModuleFullName()
local pkgNameBase = pathJoin("/work/y07/shared/apps/core", pkgName)
local pkgVersionBase = pathJoin("/work/y07/shared/apps/core", pkgNameVer)

prepend_path("PATH", pathJoin(pkgVersionBase, "bin"))

family("gromacs")
