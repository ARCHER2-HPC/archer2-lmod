help([[
VASP 6.3.1
==========

This module sets up your environment to access VASP 6.3.1. This
version has been compiled against the AOCL 3.1 numerical performance
libraries from AMD.

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

gcc/10.2.0
craype/2.7.6
craype-x86-rome
perftools-base/21.02.0
xpmem/2.2.40-7.0.1.0_2.7__g1d7a24d.shasta
bolt/0.7
epcc-setup-env
load-epcc-module
PrgEnv-gnu/8.0.0
cray-python/3.8.5.0
aocl/3.1
cray-ucx/2.7.0-1
craype-network-ucx
cray-mpich-ucx/8.1.9


   Compiled: 25 May 2022"
   Maintained by: A. R. Turner, EPCC"
]])

local pkgName = myModuleName()
local pkgNameVer = myModuleFullName()
local pkgNameBase = pathJoin("/work/y07/shared/apps/core", pkgName)
local pkgVersionBase = pathJoin("/work/y07/shared/apps/core", pkgNameVer)

load("PrgEnv-gnu")
load("aocl/3.1")
load("craype-network-ucx")
load("cray-mpich-ucx/8.1.9")
setenv("UCX_IB_REG_METHODS", "direct")

prepend_path("PATH", pathJoin(pkgVersionBase, "bin"))
setenv("VASP", pkgVersionBase)

setenv("VASP_VDW_KERNEL", pathJoin(pkgVersionBase, "vdw_kernel"))
setenv("VASP_PSPOT_DIR", pathJoin(pkgNameBase, "potpaw"))

family("vasp")

