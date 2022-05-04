help([[
gnuplot
========

Gnuplot is a portable command-line driven graphing utility.

See http://www.gnuplot.info/ .

  Installed by: D. Henty, EPCC
  Date: 2 May 2022
]])

local pkgName = myModuleName()
local pkgNameVer = myModuleFullName()
local pkgNameBase = pathJoin("/work/y07/shared/utils/core", pkgName)
local pkgVersionBase = pathJoin("/work/y07/shared/utils/core", pkgNameVer)

prepend_path("PATH", pathJoin(pkgVersionBase, "bin"))

family("gnuplot")
