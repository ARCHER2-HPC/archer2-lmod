help([[
Quantum Esspresso 6.8
=====================

This module sets up your environment to access Quantum Esspresso
6.8. Once loaded you can access MPI-enabled Quantum Esspresso
executables using the usual commands.

   Installed by: E. Broadway, EPCC
   Installation date: 26th June 2024
]])

local pkgName = myModuleName()
local pkgNameVer = myModuleFullName()
local pkgNameBase = pathJoin("/work/y07/shared/apps/core", pkgName)
local pkgVersionBase = pathJoin("/work/y07/shared/apps/core", pkgNameVer)

 
prepend_path("PATH", pathJoin(pkgVersionBase, "bin"))
family("quantum_espresso")
