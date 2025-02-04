help([[
Wannier 90 3.1.0
=================
This module sets up your environment to access Wannier 90 3.1.0.

   - Installed by: A. Turner, EPCC"
   - Date: 21 May 2024"

]])

family("wannier90")

local modbase = os.getenv("EPCC_SOFTWARE_DIR") or "/work/y07/shared"
local pkgNameVer = myModuleFullName()
local base = pathJoin(modbase, "apps/core", pkgNameVer)

append_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))
append_path("PATH", pathJoin(base, "bin"))

