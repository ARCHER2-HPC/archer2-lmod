help([[
ONETEP 6.1.43.0
===============

This module sets up your environment to access ONETEP 6.1.43.0
Once loaded you can access the ONETEP executable using the
name 'onetep.archer2.

For access to ONETEP, please request access through
SAFE. see:

  * https://epcced.github.io/safe-docs/safe-for-users/#how-to-request-access-to-a-package-group

  Installed by: A. Turner, EPCC
  Date: 21 June 2023


Modules loaded at compile time:

craype-x86-rome
libfabric/1.12.1.2.2.0.0
craype-network-ofi
perftools-base/22.12.0
xpmem/2.5.2-2.4_3.30__gd0f7936.shasta
cce/15.0.0
craype/2.7.19
cray-dsmml/0.2.2
cray-mpich/8.1.23
cray-libsci/22.12.1.1
PrgEnv-cray/8.3.3
bolt/0.8
epcc-setup-env
load-epcc-module
cray-fftw/3.3.10.3


]])

-- Setup the correct software environment
load("PrgEnv-cray")
load("cce/15.0.0")
load("cray-fftw/3.3.10.3")
load("cray-mpich/8.1.23")
prepend_path("LD_LIBRARY_PATH", os.getenv("CRAY_LD_LIBRARY_PATH"))

-- Set the rutime environement
setenv("OMP_PLACES", "cores")
setenv("OMP_PROC_BIND", "close")
setenv("FI_MR_CACHE_MAX_COUNT", "0")

local modbase = os.getenv("EPCC_SOFTWARE_DIR") or "/work/y07/shared"

local pkgNameVer = myModuleFullName()
local basepath = pathJoin(modbase, "apps/core/onetep/6.1.43.0")

prepend_path("PATH", pathJoin(basepath, "bin_CCE-LibSci"))

setenv("PSPOT_DIR", pathJoin(basepath, "pseudo"))

family("onetep")
