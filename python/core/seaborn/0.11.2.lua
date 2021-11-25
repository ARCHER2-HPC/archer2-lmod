help([[
seaborn
=======

https://seaborn.pydata.org/

  Installed by: Andy Turner, EPCC
  Date: 11 October 2020
]])

always_load("cray-python")
prereq("matplotlib")

local pkgNameVer = myModuleFullName()
local pkgVersionBase = pathJoin("/work/y07/shared/python/core", pkgNameVer)

prepend_path("PATH", pathJoin(pkgVersionBase, "bin"))
prepend_path("PYTHONPATH", pathJoin(pkgVersionBase, "lib/python3.8/site-packages"))
prepend_path("MANPATH", pathJoin(pkgVersionBase, "lib/python3.8/site-packages"))

family("seaborn")
