help([[
VASP 5.4.4.pl2
==============

This module sets up your environment to
access VASP 5.4.4.pl2 with the VTST 
tools:

 https://theory.cm.utexas.edu/vtsttools/index.html

Once this module has been loaded you can
access the VASP 5.4.4 executables as:

 *'vasp_std'       - Multiple k-point (complex) version
 *'vasp_gam'       - Gamma-point only version
 *'vasp_ncl'       - Multiple k-point, noncollinear version

The VTST scripts are also available as described in
the VTST documentation.

If you are only interested in the gamma-point, the
gamma-point version of the code runs about 30-50%
faster than the complex code.

For access to VASP, please request access through
SAFE. see:

  * https://epcced.github.io/safe-docs/safe-for-users/#how-to-request-access-to-a-package-group

   Compiled: 19 October 2021"
   Maintained by: A. R. Turner, EPCC"
]])

load("PrgEnv-gnu")
load("cpe/21.09")

local pkgName = myModuleName()
local pkgNameVer = myModuleFullName()
local pkgNameBase = pathJoin("/work/y07/shared/apps/core", pkgName)
local pkgVersionBase = pathJoin("/work/y07/shared/apps/core", pkgNameVer)

prepend_path("PATH", pathJoin(pkgVersionBase, "bin"))
setenv("VASP", pkgVersionBase)

setenv("VASP_VDW_KERNEL", pathJoin(pkgNameBase, "5/vdw_kernel"))
setenv("VASP_PSPOT_DIR", pathJoin(pkgNameBase, "5/potpaw"))

family("vasp")
