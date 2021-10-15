help([[
NAMD 2.14.smp
=============
NAMD is a parallel molecular dynamics code designed for high-performance simulation of large biomolecular systems,
see https://www.ks.uiuc.edu/Research/namd/ .

This NAMD 2.14 has been built with SMP support, which introduces a dedicated communication thread for every process. 

This module sets up your environment to access NAMD 2.14 - the executable file is called namd2.
NAMD 2.14 was built with GCC 11.2.0 (CPE 21.09); it uses Cray MICH 8.1.9 (OFI), Cray FFTW 3.3.8.11,
TCL 8.5.9 and Charm++ 6.10.2.

   - Installed by: M. Bareford, EPCC"
   - Date: 13 October 2021\n"
]])

always_load("PrgEnv-gnu")
load("cray-fftw")
load("cpe/21.09")
load("xpmem")
load("perftools-base")

local pkgName = myModuleName()
local pkgNameVer = myModuleFullName()
local pkgNameBase = pathJoin("/work/y07/shared/apps/core", pkgName)
local pkgVersionBase = pathJoin("/work/y07/shared/apps/core", pkgNameVer)

prepend_path("PATH", pathJoin(pkgVersionBase, "bin"))
prepend_path("LD_LIBRARY_PATH", "/work/y07/shared/apps/core/namd/tcl/8.5.9/lib")

family("namd")
