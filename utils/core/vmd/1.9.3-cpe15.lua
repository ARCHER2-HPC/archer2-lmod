help([[
vmd
===

VMD is a molecular visualization program for displaying,
animating, and analyzing large biomolecular systems
using 3-D graphics and built-in scripting.

See https://www.ks.uiuc.edu/Research/vmd/

  Installed by: Rui Apóstolo, EPCC
  Date: 8 June, 2023
]])

load("PrgEnv-cray/8.3.3")
load("cray-hdf5/1.12.2.1")
load("cray-netcdf/4.9.0.1")
load("tcl/8.6.13")
load("tk/8.6.13")

local pkgName = myModuleName()
local pkgNameVer = myModuleFullName()
local pkgNameBase = pathJoin("/work/y07/shared/utils/core", pkgName)
local pkgVersionBase = pathJoin("/work/y07/shared/utils/core", pkgNameVer)

-- prepend_path("LD_LIBRARY_PATH", pathJoin(pkgNameBase, "tcl/8.5.0-gcc10/lib"))
-- prepend_path("LD_LIBRARY_PATH", pathJoin(pkgNameBase, "tk/8.5.6-gcc10/lib"))
prepend_path("PATH", pathJoin(pkgVersionBase, "bin"))

family("vmd")
