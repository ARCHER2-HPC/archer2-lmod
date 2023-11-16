help([[
VASP 5.4.4.pl2-VTST
===================

This module sets up your environment to access VASP 5.4.4 with the
VASP Transition State Tools from University of Texas:

https://theory.cm.utexas.edu/vtsttools/

Once this module has been loaded you can access the VASP 5.4.4
executables as:

 *'vasp_std'       - Multiple k-point (complex) version
 *'vasp_gam'       - Gamma-point only version
 *'vasp_ncl'       - Multiple k-point, noncollinear version

The VTST scripts are also added to your PATH and are available at
the location stored in the VTST_SCRIPTS environment variable.

If you are only interested in the gamma-point, the
gamma-point version of the code runs about 30-50%
faster than the complex code.

For access to VASP, please request access through
SAFE. see:

  * https://epcced.github.io/safe-docs/safe-for-users/#how-to-request-access-to-a-package-group

Modules loaded at compile time:


   Compiled: 23 June 2023
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
prepend_path("PATH", pathJoin(pkgVersionBase, "vtstscripts-1033"))
setenv("VASP", pkgVersionBase)

setenv("VASP_VDW_KERNEL", pathJoin(pkgNameBase, "vdw_kernel"))
setenv("VASP_PSPOT_DIR", pathJoin(pkgNameBase, "5/potpaw"))
setenv("VTST_SCRIPTS", pathJoin(pkgVersionBase, "vtstscripts-1033"))

family("vasp")

