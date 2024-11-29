help([[
Ncview 2.1.11
=============

Ncview is a visual browser for netCDF format files.
This version of the Ncview was compiled using GCC v11.2.0 .

Installed by: M. Bareford, EPCC
Date: 29 Nov 2024
]])

local base = os.getenv("EPCC_SOFTWARE_DIR")
local pkgNameVer = myModuleFullName()
local modBase = pathJoin(base, "utils/core", pkgNameVer)

setenv("NCVIEW_ROOT", modBase)
prepend_path("PATH", pathJoin(modBase, "bin"))

family("ncview")
