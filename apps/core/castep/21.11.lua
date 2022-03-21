help([[
CASTEP 21.11
============
 
This module sets up your environment to access CASTEP 21.11.
Once loaded you can access the CASTEP executable using the
name 'castep.mpi'. This module also includes the CASTEP tools.
 
For access to CASTEP on ARCHER2, please request access through
the SAFE. see:
  * https://epcced.github.io/safe-docs/safe-for-users/#how-to-request-access-to-a-package-group\n
 
Installed by: A. Turner, EPCC
Date: 1 March 2021
]])

load("PrgEnv-cray")
load("cpe/21.09")
prepend_path("LD_LIBRARY_PATH", os.getenv("CRAY_LD_LIBRARY_PATH"))

local pkgNameVer = myModuleFullName()
local base = pathJoin("/work/y07/shared/apps/core", pkgNameVer)

prepend_path("PATH", pathJoin(base, "bin"))
 
setenv("CASTEP_UTILS", pathJoin(base, "bin"))
setenv("CASTEP_TMPDIR", ".")
setenv("CASTEP", base)
setenv("CASTEP_EXE", pathJoin(base, "bin/castep.mpi"))
setenv("CASTEP_MODULE", myModuleFullName())

family("castep")
