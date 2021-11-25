help([[
Quantum Esspresso 6.8
=====================

This module sets up your environment to access Quantum Esspresso
6.8. Once loaded you can access MPI-enabled Quantum Esspresso
executables using the usual commands.

   Installed by: A. Turner, EPCC
   Installation date: 12 October 2021
]])

local pkgNameVer = myModuleFullName()
local base = pathJoin("/work/y07/shared/apps/core", pkgNameVer)
 
prepend_path("PATH", pathJoin(base, "bin"))
 
family("quantum_espresso")
