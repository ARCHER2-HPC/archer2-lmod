help([[
usage-analysis
==============

Tools to analyse usage of HPC systems.

  Installed by: Andy Turner, EPCC
  Date: 6 May 2021
]])

load("cray-python")
load("matplotlib")
load("seaborn")

local pkgNameVer = myModuleFullName()
local pkgVersionBase = pathJoin("/work/y07/shared/utils/core", pkgNameVer)

prepend_path("PATH", pathJoin(pkgVersionBase, "usage-analysis/bin"))
prepend_path("PYTHONPATH", pathJoin(pkgVersionBase, "python/lib/python3.8/site-packages"))
prepend_path("PYTHONPATH", pathJoin(pkgVersionBase, "usage-analysis/python-modules"))

setenv("SCUA_BASE", pathJoin(pkgVersionBase, "usage-analysis"))

