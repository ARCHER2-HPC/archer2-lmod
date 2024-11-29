help([[
cp2k-2023.1
===========
This module sets up your environment to access CP2K 2023.1.

CP2K 2023.1 was compiled using the GCC 11.2.0 compilers and is
linked with the cray-fftw/3.3.10.3 and mkl/2023.0.0 modules.

The versions of the CP2K supporting libraries are as follows,
libint 2.6.0-cp2k-lmax-4, libxc 6.1.0, ELPA 2022.11.001 and
Plumed 2.8.2.

   - Installed by: M. Bareford, EPCC"
   - Date: 29 March 2023\n"
]])

load("PrgEnv-gnu")
load("cray-fftw")
load("mkl")

local modbase = os.getenv("EPCC_SOFTWARE_DIR") or "/work/y07/shared"

local pkgNameVer = myModuleFullName()
local pkgVersionBase = pathJoin(modbase, "apps/core", pkgNameVer)

setenv("CP2K_DIR", pkgVersionBase)
setenv("CP2K_DATA", pathJoin(pkgVersionBase, "data"))

prepend_path("PATH", pathJoin(pkgVersionBase, "exe/ARCHER2"))
prepend_path("PATH", pathJoin(pkgVersionBase, "libs/plumed/2.8.2/bin"))

family("cp2k")
