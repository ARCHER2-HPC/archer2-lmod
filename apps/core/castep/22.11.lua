help([[
CASTEP 22.11
============
 
This module sets up your environment to access CASTEP 22.11.
Once loaded you can access the CASTEP executable using the
name 'castep.mpi'. This module also includes the CASTEP tools.
 
For access to CASTEP on ARCHER2, please request access through
the SAFE. see:
  * https://epcced.github.io/safe-docs/safe-for-users/#how-to-request-access-to-a-package-group\n
 
Installed by: A. Turner, EPCC
Date: 5 December 2022

Modules loaded at compile time:

  1) gcc/10.2.0
  2) craype/2.7.6
  3) craype-x86-rome
  4) libfabric/1.11.0.4.71
  5) craype-network-ofi
  6) perftools-base/21.02.0
  7) xpmem/2.2.40-7.0.1.0_2.7__g1d7a24d.shasta
  8) cray-mpich/8.1.4
  9) cray-libsci/21.04.1.1
  10) bolt/0.8
  11) epcc-setup-env
  12) load-epcc-module
  13) PrgEnv-gnu/8.0.0
  14) cray-fftw/3.3.8.11

]])

load("cray-fftw")

local modbase = os.getenv("EPCC_SOFTWARE_DIR") or "/work/y07/shared"

local pkgNameVer = myModuleFullName()
local base = pathJoin(modbase, "apps/core", pkgNameVer)

prepend_path("PATH", pathJoin(base, "bin"))
 
setenv("CASTEP_UTILS", pathJoin(base, "bin"))
setenv("CASTEP_TMPDIR", ".")
setenv("CASTEP", base)
setenv("CASTEP_EXE", pathJoin(base, "bin/castep.mpi"))
setenv("CASTEP_MODULE", myModuleFullName())

family("castep")
