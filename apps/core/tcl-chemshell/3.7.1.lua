help([[

=====================

This module sets up your environment to access Tcl-ChemShell
3.7.1. Once loaded you can access MPI-enabled Tcl-Chemshell
executables using the usual commands.

   Installed by: W. Lucas, EPCC
   Installation date: 7 June 2023
]])

load("PrgEnv-gnu")
load("tcl/8.6.13")

local pkgName = myModuleName()
local pkgNameVer = myModuleFullName()
local pkgNameBase = pathJoin("/work/y07/shared/apps/core", pkgName)
local pkgVersionBase = pathJoin("/work/y07/shared/apps/core", pkgNameVer)

prepend_path("PATH", pathJoin(pkgVersionBase, "chemsh-tcl/bin"))
setenv("LIBTCL", "/work/y07/shared/utils/core/tcl/8.6.13/lib/libtcl8.6.so")
setenv("TCLLIBPATH", pathJoin(pkgVersionBase, "chemsh-tcl/tcl"))
 
family("tclchemshell")

