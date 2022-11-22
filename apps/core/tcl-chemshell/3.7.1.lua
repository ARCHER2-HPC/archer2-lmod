help([[

=====================

This module sets up your environment to access Tcl-ChemShell
3.7.1. Once loaded you can access MPI-enabled Tcl-Chemshell
executables using the usual commands.

   Installed by: J. Sindt, EPCC
   Installation date: 2 August 2022
]])

load("PrgEnv-gnu")

local pkgName = myModuleName()
local pkgNameVer = myModuleFullName()
local pkgNameBase = pathJoin("/work/y07/shared/apps/core", pkgName)
local pkgVersionBase = pathJoin("/work/y07/shared/apps/core", pkgNameVer)

prepend_path("PATH", pathJoin(pkgVersionBase, "chemsh-tcl/bin"))
setenv("LIBTCL", pathJoin(pkgVersionBase, "tcl8.6.8/lib/libtcl8.6.so"))
setenv("TCLLIBPATH", pathJoin(pkgVersionBase, "chemsh-tcl/tcl"))
 
family("tclchemshell")

