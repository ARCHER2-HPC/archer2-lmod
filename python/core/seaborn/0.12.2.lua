help([[
seaborn
=======

https://seaborn.pydata.org/

  Installed by: Andy Turner, EPCC
  Date: 19 July 2023
]])

always_load("cray-python")
prereq("matplotlib")

local modbase = os.getenv("EPCC_SOFTWARE_DIR") or "/work/y07/shared"

local pkgNameVer = myModuleFullName()
local pkgVersionBase = pathJoin(modbase, "python/core", pkgNameVer)

prepend_path("PATH", pathJoin(pkgVersionBase, "bin"))
prepend_path("PYTHONPATH", pathJoin(pkgVersionBase, "lib/python3.9/site-packages"))
prepend_path("MANPATH", pathJoin(pkgVersionBase, "lib/python3.9/site-packages"))

family("seaborn")
