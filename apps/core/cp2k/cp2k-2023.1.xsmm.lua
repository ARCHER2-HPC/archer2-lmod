help([[
cp2k-2023.1.xsmm
================
This module sets up your environment to access CP2K 2023.1.xsmm.

CP2K 2023.1.xsmm was compiled using the GCC 11.2.0 compilers and is
linked with the cray-fftw/3.3.10.3 and mkl/2023.0.0 modules.

The versions of the CP2K supporting libraries are as follows,
libint 2.6.0-cp2k-lmax-4, libxc 6.1.0, libxsmm 1.17, ELPA 2022.11.001
and Plumed 2.8.2.

Please note, this CP2K version includes the libxsmm library, which
supports small matrix-matrix multiplications, and replaces CP2K's own
libsmm library. The libxsmm library is not included in the default
cp2k-2023.1 install due to the fact that cp2k/libxsmm is known to
fail on ARCHER2 for some hybrid MPI/OpenMP configurations. For other
job types however, this version may give a faster time to solution
compared to cp2k/2023.1.

   - Installed by: M. Bareford, EPCC"
   - Date: 8 June 2023\n"
]])

load("PrgEnv-gnu")
load("cray-fftw")
load("mkl")

local pkgName = myModuleName()
local pkgNameVer = myModuleFullName()
local pkgNameBase = pathJoin("/work/y07/shared/apps/core", pkgName)
local pkgVersionBase = pathJoin("/work/y07/shared/apps/core", pkgNameVer)

setenv("CP2K_DIR", pkgVersionBase)
setenv("CP2K_DATA", pathJoin(pkgVersionBase, "data"))

prepend_path("PATH", pathJoin(pkgVersionBase, "exe/ARCHER2"))
prepend_path("PATH", pathJoin(pkgVersionBase, "libs/plumed/2.8.2/bin"))

family("cp2k")
