help([[
genmaskcpu
==========

genmaskcpu is a tool to generate CPU masks to correctly pin
parallel processes and threads when using multiple subjobs
on a single node.

  Installed by: Andy Turner, EPCC
  Date: 4 Oct 2021
]])

prereq("cray-python")


local modbase = os.getenv("EPCC_SOFTWARE_DIR") or "/work/y07/shared"

local pkgNameVer = myModuleFullName()
local pkgVersionBase = pathJoin(modbase, "apps/core", pkgNameVer)

prepend_path("PATH", pkgVersionBase)

family("genmaskcpu")
