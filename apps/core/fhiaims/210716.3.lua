help([[
FHI-aims
========

This module sets up your environment to access FHI-aims 210716.3

Once this module has been loaded you can access the FHI-aims 210716.3
executables as:

 *'aims.mpi.x'

For access to FHI-aims, please request access through
SAFE. see:

  * https://epcced.github.io/safe-docs/safe-for-users/#how-to-request-access-to-a-package-group

   Compiled: 6 April 2022"
   Maintained by: A. R. Turner, EPCC"
]])

local pkgName = myModuleName()
local pkgNameVer = myModuleFullName()
local pkgNameBase = pathJoin("/work/y07/shared/apps/core", pkgName)
local pkgVersionBase = pathJoin("/work/y07/shared/apps/core", pkgNameVer)

prepend_path("PATH", pathJoin(pkgVersionBase, "bin"))

family("fhiaims")

