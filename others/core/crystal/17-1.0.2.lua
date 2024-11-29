help([[
CRYSTAL17 1.0.2
===============

This module sets up your environment to
access CRYSTAL17 1.0.2 using CPE/21.03

        Installed: 28 April 2021
        Installed by: B.G.Searle, STFC Daresbury
]])

local modbase = os.getenv("EPCC_SOFTWARE_DIR") or "/work/y07/shared"

local pkgNameVer = myModuleFullName()
local base = pathJoin(modbase, "apps/core", pkgNameVer)

prepend_path("PATH", pathJoin(base, "bin"))
 
family("crystal")
