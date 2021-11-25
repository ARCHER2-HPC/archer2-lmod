help([[
vmd
========

VMD is a molecular visualization program for displaying,
animating, and analyzing large biomolecular systems
using 3-D graphics and built-in scripting.

See https://www.ks.uiuc.edu/Research/vmd/ .

  Installed by: H. Judge, EPCC
  Date: 14 October 2021
]])

load("PrgEnv-gnu")
load("cray-hdf5")
load("cray-netcdf")

local pkgName = myModuleName()
local pkgNameVer = myModuleFullName()
local pkgNameBase = pathJoin("/work/y07/shared/utils/core", pkgName)
local pkgVersionBase = pathJoin("/work/y07/shared/utils/core", pkgNameVer)

prepend_path("LD_LIBRARY_PATH", pathJoin(pkgNameBase, "tcl/8.5.0-gcc10/lib"))
prepend_path("LD_LIBRARY_PATH", pathJoin(pkgNameBase, "tk/8.5.6-gcc10/lib"))
prepend_path("PATH", pathJoin(pkgVersionBase, "bin"))

family("vmd")
