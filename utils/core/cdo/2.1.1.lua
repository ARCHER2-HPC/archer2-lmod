help([[
CDO (Climate Data Operators) 2.1.1
==================================

CDO is a collection of command line operators to
manipulate and analyse climate and NWP model data.

This installation is provided via Singularity container.

Installed by: W. Lucas, EPCC
Date: 9 March 2023
]])

local pkgNameVer = myModuleFullName()
local base = pathJoin("/work/y07/shared/utils/core", pkgNameVer)

prepend_path("PATH", pathJoin(base, "bin"))

family("cdo")
