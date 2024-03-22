help([[
VMD 1.9.3 (serial)
==================

VMD is a molecular visualization program for displaying,
animating, and analyzing large biomolecular systems
using 3-D graphics and built-in scripting.

See https://www.ks.uiuc.edu/Research/vmd/ .

  Installed by: M. Bareford, EPCC
  Date: 23 January 2024
]])

load("PrgEnv-gnu")
load("cray-hdf5")
load("cray-netcdf")

local pkgName = myModuleName()
local pkgNameVer = myModuleFullName()
local pkgNameBase = pathJoin("/work/y07/shared/utils/core", pkgName)
local pkgVersionBase = pathJoin("/work/y07/shared/utils/core", pkgNameVer)

prepend_path("LD_LIBRARY_PATH", "/work/y07/shared/utils/core/tcl/8.6.13/lib")
prepend_path("LD_LIBRARY_PATH", "/work/y07/shared/utils/core/tk/8.6.13/lib")
prepend_path("LD_LIBRARY_PATH", pathJoin(pkgVersionBase, "lib"))

prepend_path("PATH", pathJoin(pkgVersionBase, "bin"))

family("vmd")
