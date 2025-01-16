help([[

=====================

This module sets up your environment to access Py-ChemShell
version 23.0.3. Once loaded you can access Py-Chemshell executables 
using the usual commands.

   Installed by: William Lucas, EPCC
   Installation date: 26 November 2024
]])

LmodMessage([[

Loading Py-ChemShell 23.0.3 compiled with NWChem 7.2.2, GULP 6.2 and DL_POLY 5.0.0.

Warning: Py-ChemShell on ARCHER2 is compiled with GULP 6.2. This is a licenced
software that is free to use for academics. If you are not an academic user
(or if you are using Py-ChemShell for non-academic work), please ensure that
you have the correct GULP licence before using GULP functionalities in
Py-ChemShell or make sure that you are not using any of the GULP
functionalities in your code (i.e., do not set theory=GULP in your 
calculations).

]])

load("PrgEnv-gnu")
load("tcl/8.6.13")
load("tk/8.6.13")

local modbase = os.getenv("EPCC_SOFTWARE_DIR") or "/work/y07/shared"
local pkgNameVer = myModuleFullName()
local base = pathJoin(modbase, "apps/core", pkgNameVer)

setenv("CHEMSH_ARCH", "cpe-gnu")
prepend_path("PATH", pathJoin(base, "chemsh-py/bin/cpe-gnu"))
 
family("pychemshell")

