help([[
CASTEP 23.11
============
 
This module sets up your environment to access CASTEP 23.11.
Once loaded you can access the CASTEP executable using the
name 'castep.mpi'. This module also includes the CASTEP tools.
 
For access to CASTEP on ARCHER2, please request access through
the SAFE. see:
  * https://epcced.github.io/safe-docs/safe-for-users/#how-to-request-access-to-a-package-group\n
 
Installed by: A. Turner, EPCC
Date: 5 December 2022

Modules loaded at compile time:

craype-x86-rome
libfabric/1.12.1.2.2.0.0
craype-network-ofi
perftools-base/22.12.0
xpmem/2.5.2-2.4_3.30__gd0f7936.shasta
bolt/0.8
epcc-setup-env
load-epcc-module
gcc/11.2.0
craype/2.7.19
cray-dsmml/0.2.2
cray-mpich/8.1.23
cray-libsci/22.12.1.1
PrgEnv-gnu/8.3.3
cray-fftw/3.3.10.3

]])

load("cray-fftw")

local pkgNameVer = myModuleFullName()
local base = pathJoin("/work/y07/shared/apps/core", pkgNameVer)

prepend_path("PATH", pathJoin(base, "bin"))
 
setenv("CASTEP_UTILS", pathJoin(base, "bin"))
setenv("CASTEP_TMPDIR", ".")
setenv("CASTEP", base)
setenv("CASTEP_EXE", pathJoin(base, "bin/castep.mpi"))
setenv("CASTEP_MODULE", myModuleFullName())

family("castep")
