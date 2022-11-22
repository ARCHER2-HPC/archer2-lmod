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
cray-dsmml/0.1.4
cray-libsci/21.04.1.1
bolt/0.7
epcc-setup-env
load-epcc-module
PrgEnv-cray/8.1.0
cce/12.0.3
cray-fftw/3.3.8.11
cray-mpich/8.1.4

]])

-- Setup the correct software environment
load("PrgEnv-cray/8.1.0")
load("cce/12.0.3")
load("cray-fftw/3.3.8.11")
load("cray-mpich/8.1.4")
prepend_path("LD_LIBRARY_PATH", os.getenv("CRAY_LD_LIBRARY_PATH"))

-- Set the rutime environement
setenv("OMP_PLACES", "cores")
setenv("OMP_PROC_BIND", "close")
setenv("FI_MR_CACHE_MAX_COUNT", "0")

local basepath = "/work/y07/shared/apps/core/onetep/6.1.9.0"
 
prepend_path("PATH", pathJoin(basepath, "bin_CCE-LibSci"))

setenv("PSPOT_DIR", pathJoin(basepath, "pseudo"))

family("onetep")
