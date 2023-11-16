help([[

=====================

This module sets up your environment to access Py-ChemShell
commit cee39100. Once loaded you can access Py-Chemshell executables 
using the usual commands.

   Installed by: William Lucas, EPCC
   Installation date: 12 October 2023
]])

LmodMessage([[

Loading Py-ChemShell cee39100 compiled with NWChem 7.0.2 and GULP 6.1.2.

Warning: Py-ChemShell on ARCHER2 is compiled with GULP 6.1.2. This is a licenced
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

local pkgVersionBase = pathJoin("/work/y07/shared/apps/core/py-chemshell/cee39100")

prepend_path("PATH", pathJoin(pkgVersionBase, "chemsh-py/bin/cpe-gnu"))
 
family("pychemshell")

