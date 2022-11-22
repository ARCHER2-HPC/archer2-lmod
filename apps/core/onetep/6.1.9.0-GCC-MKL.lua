help([[
ONETEP 6.1.9.0
==============

This module sets up your environment to access ONETEP 6.1.9.0
Once loaded you can access the ONETEP executable using the
name 'onetep.archer2.

For access to ONETEP, please request access through
SAFE. see:

  * https://epcced.github.io/safe-docs/safe-for-users/#how-to-request-access-to-a-package-group

  Installed by: A. Turner, EPCC
  Date: 1 June 2022


Modules loaded at compile time:

craype/2.7.6
craype-x86-rome
libfabric/1.11.0.4.71
craype-network-ofi
perftools-base/21.02.0
xpmem/2.2.40-7.0.1.0_2.7__g1d7a24d.shasta
bolt/0.7
epcc-setup-env
load-epcc-module
PrgEnv-gnu/8.0.0
gcc/9.3.0
mkl/21.2-2883
cray-mpich/8.1.4

]])

load("PrgEnv-gnu")
load("gcc/9.3.0")
load("mkl")
load("cray-mpich/8.1.4")
prepend_path("LD_LIBRARY_PATH", os.getenv("CRAY_LD_LIBRARY_PATH"))

-- Set the rutime environement
setenv("OMP_PLACES", "cores")
setenv("OMP_PROC_BIND", "close")
setenv("FI_MR_CACHE_MAX_COUNT", "0")

local basepath = "/work/y07/shared/apps/core/onetep/6.1.9.0"
 
prepend_path("PATH", pathJoin(basepath, "bin_GCC-MKL"))

setenv("PSPOT_DIR", pathJoin(basepath, "pseudo"))

family("onetep")
