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
 
 
local version = "20.11"
local basepath = pathJoin("/work/y07/shared/apps/castep", version, "bin")
 
prepend_path("PATH", basepath)
 
setenv("CASTEP_UTILS", basepath)
setenv("CASTEP_TMPDIR", ".")
setenv("CASTEP", basepath)
setenv("CASTEP_EXE", pathJoin(basepath, "castep.mpi"))
setenv("CASTEP_MODULE", pathJoin(myModuleFullName()))
 
-- Only one module from a "family" can be loaded concurrently
family("castep")
