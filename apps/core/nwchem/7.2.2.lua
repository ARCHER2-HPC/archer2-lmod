help([[
NWChem 7.2.2
============

This module defines the system paths and
environment variables needed to use NWChem
7.2.2 Once the module is loaded the executable
will be available as 'nwchem'

  Installed by: J. Herrera, EPCC
  Date: 19 Nov 2023
]])

local pkgNameVer = myModuleFullName()
local base = pathJoin("/work/y07/shared/apps/core", pkgNameVer)
 
prepend_path("PATH", pathJoin(base, "bin/LINUX64"))
 
setenv("NWCHEM", base)

family("nwchem")
