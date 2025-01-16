help([[
VASP 5.4.4.pl2
==============

This module sets up your environment to
access VASP 5.4.4.pl2

Once this module has been loaded you can
access the VASP 5.4.4 executables as:

 *'vasp_std'       - Multiple k-point (complex) version
 *'vasp_gam'       - Gamma-point only version
 *'vasp_ncl'       - Multiple k-point, noncollinear version

If you are only interested in the gamma-point, the
gamma-point version of the code runs about 30-50%
faster than the complex code.

For access to VASP, please request access through
SAFE. see:

  * https://epcced.github.io/safe-docs/safe-for-users/#how-to-request-access-to-a-package-group

   Compiled: 5 June 2023"
   Maintained by: A. R. Turner, EPCC"
]])

load("PrgEnv-gnu")
load("gcc/10.3.0")
load("cray-fftw")
prepend_path("LD_LIBRARY_PATH", os.getenv("CRAY_LD_LIBRARY_PATH"))
-- setenv("UCX_IB_REG_METHODS", "direct")
--

local modbase = os.getenv("EPCC_SOFTWARE_DIR") or "/work/y07/shared"

local base = pathJoin(modbase, "apps/core")

local pkgName = myModuleName()
local pkgNameVer = myModuleFullName()
local pkgNameBase = pathJoin(base, pkgName)
local pkgVersionBase = pathJoin(base, pkgNameVer)

prepend_path("PATH", pathJoin(pkgVersionBase, "bin"))
setenv("VASP", pkgVersionBase)

setenv("VASP_VDW_KERNEL", pathJoin(pkgNameBase, "5/vdw_kernel"))
setenv("VASP_PSPOT_DIR", pathJoin(pkgNameBase, "5/potpaw"))

family("vasp")
