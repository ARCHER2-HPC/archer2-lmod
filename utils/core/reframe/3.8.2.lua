help([[
ReFrame regression testing software
]])

prereq("cray-python")

local pkgNameVer = myModuleFullName()
local base = pathJoin("/work/y07/shared/utils/core", pkgNameVer)

prepend_path("PATH", pathJoin(base, "bin"))
family("reframe")
