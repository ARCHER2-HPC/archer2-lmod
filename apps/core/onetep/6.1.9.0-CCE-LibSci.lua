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
  Date: 17 March 2023


Modules loaded at compile time:


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

local basepath = "/work/y07/shared/apps/core/onetep/6.1.9.0"
 
prepend_path("PATH", pathJoin(basepath, "bin_CCE-LibSci"))

setenv("PSPOT_DIR", pathJoin(basepath, "pseudo"))

family("onetep")
