help([[
CASTEP 20.11
============
 
This module sets up your environment to access CASTEP 20.11.
Once loaded you can access the CASTEP executable using the
name 'castep.mpi'.
 
Utilities are available in $CASTEP_UTILS. e.g. to browse:
  cd $CASTEP_UTILS
 
For access to CASTEP on ARCHER2, please request access through
the SAFE. see:
  * https://epcced.github.io/safe-docs/safe-for-users/#how-to-request-access-to-a-package-group\n
 
Installed by: A. Turner, EPCC
Date: 25 September 2021
]])

local pkgNameVer = myModuleFullName()
local base = pathJoin("/work/y07/shared/apps", pkgNameVer, "core")
 
prepend_path("PATH", pathJoin(base, "bin"))
 
setenv("CASTEP_UTILS", pathJoin(base, "bin"))
setenv("CASTEP_TMPDIR", ".")
setenv("CASTEP", base)
setenv("CASTEP_EXE", pathJoin(base, "bin/castep.mpi"))
setenv("CASTEP_MODULE", myModuleFullName())

family("castep")
