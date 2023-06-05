help([[
VASP 6.4.1
==========

This module sets up your environment to access VASP 6.4.1.

Once this module has been loaded you can access the VASP 6.4.1
executables as:

 *'vasp_std'       - Multiple k-point (complex) version
 *'vasp_gam'       - Gamma-point only version
 *'vasp_ncl'       - Multiple k-point, noncollinear version

If you are only interested in the gamma-point, the
gamma-point version of the code runs about 30-50%
faster than the complex code.

For access to VASP, please request access through
SAFE. see:

  * https://epcced.github.io/safe-docs/safe-for-users/#how-to-request-access-to-a-package-group

Modules loaded at compile time:


   Compiled: 30 May 2023
   Maintained by: A. R. Turner, EPCC
]])

local pkgName = myModuleName()
local pkgNameVer = myModuleFullName()
local pkgNameBase = pathJoin("/work/y07/shared/apps/core", pkgName)
local pkgVersionBase = pathJoin("/work/y07/shared/apps/core", pkgNameVer)

load("PrgEnv-gnu")
load("cray-libsci/22.12.1.1")
load("cray-fftw/3.3.10.3")
load("cray-hdf5-parallel/1.12.2.1")
prepend_path("LD_LIBRARY_PATH", os.getenv("CRAY_LD_LIBRARY_PATH"))
load("gcc/10.3.0")
load("craype-network-ucx")
load("cray-mpich-ucx/8.1.23")
setenv("UCX_IB_REG_METHODS", "direct")

prepend_path("PATH", pathJoin(pkgVersionBase, "bin"))
setenv("VASP", pkgVersionBase)

setenv("VASP_VDW_KERNEL", pathJoin(pkgVersionBase, "vdw_kernel"))
setenv("VASP_PSPOT_DIR", pathJoin(pkgNameBase, "6/potpaw"))

family("vasp")

