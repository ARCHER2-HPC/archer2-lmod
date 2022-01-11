help([[
NAMD 2.14-nosmp
===============
NAMD is a parallel molecular dynamics code designed for high-performance simulation of large biomolecular systems,
see https://www.ks.uiuc.edu/Research/namd/ .

This NAMD 2.14 has been built without SMP support.

This module sets up your environment to access NAMD 2.14 - the executable file is called namd2.
NAMD 2.14 was built with GCC 11.2.0 (CPE 21.09); it uses Cray MICH 8.1.9, Cray FFTW 3.3.8.11,
TCL 8.5.9 and Charm++ 6.10.2.

https://github.com/hpc-uk/build-instructions/blob/main/apps/NAMD/build_namd_2.14_archer2_gcc11_cmpich8.md

   - Installed by: M. Bareford, EPCC"
   - Date: 15 October 2021\n"
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
