help([[
FHI-aims
========

This module sets up your environment to access FHI-aims 240920.0

Once this module has been loaded you can access the FHI-aims 240920.0
executables as:

 * 'aims.mpi.x' - standard executable
 * 'aims.vibrations.mpi.x' - vibrarional calculation executable

For access to FHI-aims, please request access through
SAFE. see:

  * https://epcced.github.io/safe-docs/safe-for-users/#how-to-request-access-to-a-package-group

   Compiled: 11 October 2024"
   Maintained by: A. R. Turner, EPCC"
]])

local pkgName = myModuleName()
local pkgNameVer = myModuleFullName()
local pkgNameBase = pathJoin("/work/y07/shared/apps/core", pkgName)
local pkgVersionBase = pathJoin("/work/y07/shared/apps/core", pkgNameVer)

prepend_path("PATH", pathJoin(pkgVersionBase, "bin"))

family("fhiaims")

