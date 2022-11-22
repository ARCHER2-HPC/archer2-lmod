help([[
VASP 6.3.2
==========

This module sets up your environment to access VASP 6.3.2.

Once this module has been loaded you can access the VASP 6.3.1
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

  1) gcc/10.2.0
  2) craype/2.7.6
  3) craype-x86-rome
  4) perftools-base/21.02.0
  5) xpmem/2.2.40-7.0.1.0_2.7__g1d7a24d.shasta
  6) bolt/0.7
  7) epcc-setup-env
  8) load-epcc-module
  9) PrgEnv-gnu/8.0.0
 10) cray-libsci/21.08.1.2
 11) cray-fftw/3.3.8.13
 12) cray-ucx/2.7.0-1
 13) craype-network-ucx
 14) cray-mpich-ucx/8.1.9

   Compiled: 15 November 2022"
   Maintained by: A. R. Turner, EPCC"
]])

local pkgName = myModuleName()
local pkgNameVer = myModuleFullName()
local pkgNameBase = pathJoin("/work/y07/shared/apps/core", pkgName)
local pkgVersionBase = pathJoin("/work/y07/shared/apps/core", pkgNameVer)

load("PrgEnv-gnu")
load("cray-libsci/21.08.1.2")
load("cray-fftw/3.3.8.13")
load("cray-hdf5-parallel/1.12.1.1")
prepend_path("LD_LIBRARY_PATH", os.getenv("CRAY_LD_LIBRARY_PATH"))
load("craype-network-ucx")
load("cray-mpich-ucx/8.1.9")
setenv("UCX_IB_REG_METHODS", "direct")

prepend_path("PATH", pathJoin(pkgVersionBase, "bin"))
setenv("VASP", pkgVersionBase)

setenv("VASP_VDW_KERNEL", pathJoin(pkgVersionBase, "vdw_kernel"))
setenv("VASP_PSPOT_DIR", pathJoin(pkgNameBase, "6/potpaw"))

family("vasp")
