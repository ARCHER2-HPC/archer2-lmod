help([[
NCL (NCAR Command Language) 6.6.2
=================================

NCL is an interpreted language to assist in the analysis
and visualisation of data in, among others, the NetCDF 3/4,
HDF 4/5, and GRIB 1/2 formats.

This version of NCL was made available via conda.

Installed by: W. Lucas, EPCC
Date: 18 Oct 2021
]])

local modbase = os.getenv("EPCC_SOFTWARE_DIR") or "/work/y07/shared"
local pkgNameVer = myModuleFullName()

local base = pathJoin(modbase, "utils/core", pkgNameVer)


setenv("NCARG_ROOT", base)
prepend_path("PATH", pathJoin(base, "bin"))

family("ncl")
