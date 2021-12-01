help([[
Ncview 2.1.7
============

Ncview is a visual browser for netCDF format files.
This version of the Ncview was compiled using GCC v10.2.0 .

Installed by: M. Bareford, EPCC
Date: 30 Nov 2021
]])

local pkgNameVer = myModuleFullName()
local base = pathJoin("/work/y07/shared/utils/core", pkgNameVer)

setenv("NCVIEW_ROOT", base)
prepend_path("PATH", pathJoin(base, "bin"))

family("ncview")
