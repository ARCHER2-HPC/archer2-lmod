help([[
CDO (Climate Data Operators) 1.9.9rc1
=====================================

CDO is a collection of command line operators to
manipulate and analyse climate and NWP model data.

This installation is provided via Singularity container.

Installed by: W. Lucas, EPCC
Date: 18 Oct 2021
]])

local pkgNameVer = myModuleFullName()
local base = pathJoin("/work/y07/shared/utils/core", pkgNameVer)

prepend_path("PATH", pathJoin(base, "bin"))

family("cdo")
