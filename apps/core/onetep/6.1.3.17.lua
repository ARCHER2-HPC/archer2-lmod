help([[
ONETEP 6.1.3.17
===============

This module sets up your environment to access ONETEP 6.1.3.17
Once loaded you can access the ONETEP executable using the
name 'onetep.archer2.

For access to ONETEP, please request access through
SAFE. see:

  * https://epcced.github.io/safe-docs/safe-for-users/#how-to-request-access-to-a-package-group

  Installed by: M. Bareford, EPCC
  Date: 13 December 2021
]])

local pkgName = myModuleName()
local pkgNameVer = myModuleFullName()
local pkgNameBase = pathJoin("/work/y07/shared/apps/core", pkgName)
local pkgVersionBase = pathJoin("/work/y07/shared/apps/core", pkgNameVer)
 
prepend_path("PATH", pathJoin(pkgVersionBase, "bin"))

setenv("PSPOT_DIR", pathJoin(pkgVersionBase, "pseudo"))

family("onetep")
