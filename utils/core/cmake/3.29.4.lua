help([[
CMake 3.29.4
============

Installed by: S. Lemaire, EPCC
Date: 4 June 2024

]])


local modbase = os.getenv("EPCC_SOFTWARE_DIR") or "/work/y07/shared"

local pkgNameVer = myModuleFullName()
local pkgVersionBase = pathJoin(modbase, "utils/core", pkgNameVer)

prepend_path("PATH", pathJoin(pkgVersionBase, "bin"))
prepend_path("CPATH", pathJoin(pkgVersionBase, "include"))
prepend_path("LD_LIBRARY_PATH", pathJoin(pkgVersionBase, "lib"))
prepend_path("LIBRARY_PATH", pathJoin(pkgVersionBase, "lib"))
prepend_path("LD_RUN_PATH", pathJoin(pkgVersionBase, "lib"))
prepend_path("MANPATH", pathJoin(pkgVersionBase, "share/man"))

