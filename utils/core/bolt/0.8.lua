help([[
bolt"
====\n"
This module sets up your environment to access 
the 'bolt' job submission script generation tool.
Once loaded, use the command 'bolt -h' to list
the options.

  * Installed by: A. Turner, EPCC"
  * Date: 18 November 2022\n"
]])

local pkgNameVer = myModuleFullName()
local pkgVersionBase = pathJoin("/work/y07/shared/utils/core", pkgNameVer)

setenv("BOLT_DIR", pkgVersionBase)
prepend_path("PATH", pathJoin(pkgVersionBase, "bin"))
prepend_path("PYTHONPATH", pathJoin(pkgVersionBase, "modules"))

