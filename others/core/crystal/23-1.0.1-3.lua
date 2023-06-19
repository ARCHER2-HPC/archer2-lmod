help([[
CRYSTAL23 1.0.1-3
=================

This module sets up your environment to
access CRYSTAL23 1.0.1-3 using CPE/21.09

        Installed: 25 January 2023
        Installed by: B.G.Searle, STFC Daresbury
]])

load("PrgEnv-gnu")
prepend_path("LD_LIBRARY_PATH", os.getenv("CRAY_LD_LIBRARY_PATH"))

local pkgNameVer = myModuleFullName()
local base = pathJoin("/work/y07/shared/apps/core", pkgNameVer)

prepend_path("PATH", pathJoin(base, "bin"))
 
family("crystal")
