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

local modbase = os.getenv("EPCC_SOFTWARE_DIR") or "/work/y07/shared"
local pkgNameVer = myModuleFullName()
local base = pathJoin(modbase, "apps/core", pkgNameVer)

prepend_path("PATH", pathJoin(base, "chemsh-tcl/bin"))
setenv("LIBTCL", "/mnt/lustre/a2fs-work4/work/y07/shared/utils/core/tcl/8.6.13/lib/libtcl8.6.so")
setenv("TCLLIBPATH", pathJoin(base, "chemsh-tcl/tcl"))
 
family("tclchemshell")

