help([[
VASP 6.4.1-VTST
===============

This module sets up your environment to access VASP 6.4.1 with the
VASP Transition State Tools from University of Texas:

https://theory.cm.utexas.edu/vtsttools/

Once this module has been loaded you can access the VASP 6.4.1
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

craype-x86-rome
libfabric/1.12.1.2.2.0.0
craype-network-ofi
perftools-base/22.12.0
xpmem/2.5.2-2.4_3.30__gd0f7936.shasta
bolt/0.8
epcc-setup-env
load-epcc-module
gcc/10.3.0
craype/2.7.19
cray-dsmml/0.2.2
cray-mpich/8.1.23
cray-libsci/22.12.1.1
PrgEnv-gnu/8.3.3
cray-fftw/3.3.10.3
cray-hdf5-parallel/1.12.2.1


   Compiled: 20 July 2023 (made OFI default MPI protocol)
   Maintained by: A. R. Turner, EPCC
]])

local modbase = os.getenv("EPCC_SOFTWARE_DIR") or "/work/y07/shared"

local base = pathJoin(modbase, "apps/core")

local pkgName = myModuleName()
local pkgNameVer = myModuleFullName()
local pkgNameBase = pathJoin(base, pkgName)
local pkgVersionBase = pathJoin(base, pkgNameVer)

load("PrgEnv-gnu")
load("cray-libsci/22.12.1.1")
load("cray-fftw/3.3.10.3")
load("cray-hdf5-parallel/1.12.2.1")
prepend_path("LD_LIBRARY_PATH", os.getenv("CRAY_LD_LIBRARY_PATH"))
load("gcc/10.3.0")

prepend_path("PATH", pathJoin(pkgVersionBase, "bin"))
prepend_path("PATH", pathJoin(pkgVersionBase, "vtstscripts-1033"))
setenv("VASP", pkgVersionBase)

setenv("VASP_VDW_KERNEL", pathJoin(pkgVersionBase, "vdw_kernel"))
setenv("VASP_PSPOT_DIR", pathJoin(pkgNameBase, "6/potpaw"))
setenv("VTST_SCRIPTS", pathJoin(pkgVersionBase, "vtstscripts-1033"))

family("vasp")

