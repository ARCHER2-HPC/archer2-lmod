help([[
CRYSTAL17 1.0.2
===============

This module sets up your environment to
access CRYSTAL17 1.0.2 using CPE/21.03

        Installed: 28 April 2021
        Installed by: B.G.Searle, STFC Daresbury
]])

local pkgNameVer = myModuleFullName()
local base = pathJoin("/work/y07/shared/apps/core", pkgNameVer)

prepend_path("PATH", pathJoin(base, "bin"))
 
family("crystal")
