help([[
NCO (netCFD operators) 5.0.5
============================

The netCDF Operators (NCO) comprise about a dozen standalone,
command-line programs that take netCDF, HDF, and/or DAP files as
input, then operate (e.g., derive new fields, compute statistics,
print, hyperslab, manipulate metadata, regrid) and output the results
to screen or files in text, binary, or netCDF formats.

This version includes ncap2 (not available in 5.0.3)

Installed by: D. Henty, EPCC
Date: 9 Feb 2022
]])

local pkgNameVer = myModuleFullName()
local base = pathJoin("/work/y07/shared/utils/core", pkgNameVer)

prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))
prepend_path("MANPATH", pathJoin(base, "share/man"))

family("nco")
