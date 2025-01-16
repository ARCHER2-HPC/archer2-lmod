help([[
ReFrame regression testing software
]])

local modbase = os.getenv("EPCC_SOFTWARE_DIR") or "/work/y07/shared"

local pkgNameVer = myModuleFullName()
local base = pathJoin(modbase, "utils/core", pkgNameVer)

prepend_path("PATH", pathJoin(base, "bin"))
family("reframe")
