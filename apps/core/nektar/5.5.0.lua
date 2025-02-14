help([[
Nektar++ 5.5.0
==============
Nektar++ is a spectral/hp element framework designed to support the construction of efficient high-performance scalable solvers
for a wide range of partial differential equations, see https://www.nektar.info .

This module sets up your environment to access the Nektar++ solvers and libraries.
Nektar++ was built with GCC 11.2.0 (CPE 22.12); it uses Cray MICH 8.1.23, Cray FFTW 3.3.10.3 and Cray LibSci 22.12.1.1 .

Build instructions: https://github.com/hpc-uk/build-instructions/blob/main/apps/nektarplusplus/build_nektarplusplus_5.5.0_archer2_gcc11_cmpich8.md

   - Installed by: M. Bareford, EPCC"
   - Date: 22 April 2024\n"
]])

always_load("PrgEnv-gnu")
load("cray-fftw")

local modbase = os.getenv("EPCC_SOFTWARE_DIR") or "/work/y07/shared"

local pkgName = myModuleName()
local pkgNameVer = myModuleFullName()
local pkgNameBase = pathJoin(modbase, "/apps/core", pkgName)
local pkgVersionBase = pathJoin(modbase, "/apps/core", pkgNameVer)

setenv("NEK_DIR", pkgVersionBase)

prepend_path("PATH", pathJoin(pkgVersionBase, "bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin(pkgVersionBase, "lib64"))
prepend_path("LD_LIBRARY_PATH", pathJoin(pkgVersionBase, "lib64/nektar++"))

family("nektar")
