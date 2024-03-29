help([[
Python netcdf4
==============

https://unidata.github.io/netcdf4-python/

  Installed by: William Lucas, EPCC
  Date: 13 June 2023
]])

always_load("cray-python")

local pkgNameVer = myModuleFullName()
local pkgVersionBase = pathJoin("/work/y07/shared/python/core", pkgNameVer)

prepend_path("PATH", pathJoin(pkgVersionBase, "bin"))
prepend_path("PYTHONPATH", pathJoin(pkgVersionBase, "lib/python3.9/site-packages"))
prepend_path("MANPATH", pathJoin(pkgVersionBase, "lib/python3.9/site-packages"))

family("netcdf4")
