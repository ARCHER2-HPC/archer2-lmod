help([[
Nektar++ 5.0.3
==============
Nektar++ is a spectral/hp element framework designed to support the construction of efficient high-performance scalable solvers
for a wide range of partial differential equations, see https://www.nektar.info .

This module sets up your environment to access the Nektar++ solvers and libraries.
Nektar++ was built with GCC 11.2.0 (CPE 21.09); it uses Cray MICH 8.1.9, Cray FFTW 3.3.8.11
and Cray LibSci 21.08.1.2 .

Build instructions: https://github.com/hpc-uk/build-instructions/blob/main/apps/nektarplusplus/build_nektarplusplus_5.0.3_archer2_gcc11_cmpich8.md

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

setenv("NEK_DIR", pkgVersionBase)

prepend_path("PATH", "${NEK_DIR}/bin")
prepend_path("LD_LIBRARY_PATH", "${NEK_DIR}/lib64")
prepend_path("LD_LIBRARY_PATH", "${NEK_DIR}/lib64/nektar++/thirdparty")

family("nektar")
