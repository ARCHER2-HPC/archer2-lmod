help([[
Graphviz 10.0.1
===============
Graphviz is open source graph visualization software.

For further details, https://graphviz.org/ .

   - Installed by: M. Bareford, EPCC"
   - Date: 3 Jun 2024\n"
]])

local pkgName = myModuleName()
local pkgNameVer = myModuleFullName()
local pkgNameBase = pathJoin("/work/y07/shared/utils/core", pkgName)
local pkgVersionBase = pathJoin("/work/y07/shared/utils/core", pkgNameVer)

prepend_path("PATH", pathJoin(pkgVersionBase, "bin"))
prepend_path("CPATH", pathJoin(pkgVersionBase, "include"))
prepend_path("MANPATH", pathJoin(pkgVersionBase, "share/man"))
prepend_path("LD_LIBRARY_PATH", pathJoin(pkgVersionBase, "lib"))
prepend_path("LIBRARY_PATH", pathJoin(pkgVersionBase, "lib"))
prepend_path("PKG_CONFIG_PATH", pathJoin(pkgVersionBase, "lib/pkgconfig"))

family("graphviz")
