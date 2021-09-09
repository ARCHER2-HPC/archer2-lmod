help([[
NWChem 7.0.2
============
This module defines the system paths and
environment variables needed to use NWChem
7.0.2 Once the module is loaded the executable
will be available as 'nwchem'

Installed by: A. Turner, EPCC"
Date: 13 January 2021\n"

]])

local pkgNameVer = myModuleFullName()
local base = pathJoin("/work/y07/shared/apps", pkgNameVer, "core")

prepend_path("PATH", pathJoin(base, "bin/LINUX64"))

setenv("NWCHEM", base)
setenv("NWCHEM_BASIS_LIBRARY", pathJoin(base, "libraries"))
setenv("NWCHEM_NWPW_LIBRARY", pathJoin(base, "libraryps"))

