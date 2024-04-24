help([[
Ncview 2.1.10
=============

Ncview is a visual browser for netCDF format files.
This version of the Ncview was compiled using GCC v11.2.0 .

Installed by: M. Bareford, EPCC
Date: 23 Apr 2024
]])

local pkgNameVer = myModuleFullName()
local base = pathJoin("/work/y07/shared/utils/core", pkgNameVer)

setenv("NCVIEW_ROOT", base)
prepend_path("PATH", pathJoin(base, "bin"))

family("ncview")
