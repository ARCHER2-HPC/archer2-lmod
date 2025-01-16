help([[
CMake 3.21.3
============

Installed by: A. Turner, EPCC
Date: 5 October 2021

]])


local modbase = os.getenv("EPCC_SOFTWARE_DIR") or "/work/y07/shared"

local pkgNameVer = myModuleFullName()
local pkgVersionBase = pathJoin(modbase, "apps/core", pkgNameVer)

prepend_path("PATH", pathJoin(pkgVersionBase, "bin"))
prepend_path("CPATH", pathJoin(pkgVersionBase, "include"))
prepend_path("LD_LIBRARY_PATH", pathJoin(pkgVersionBase, "lib"))
prepend_path("LIBRARY_PATH", pathJoin(pkgVersionBase, "lib"))
prepend_path("LD_RUN_PATH", pathJoin(pkgVersionBase, "lib"))
prepend_path("MANPATH", pathJoin(pkgVersionBase, "share/man"))

