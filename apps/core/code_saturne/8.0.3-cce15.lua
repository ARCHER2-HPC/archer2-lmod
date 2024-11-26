help([[
Code_Saturne 8.0.3
==================

This module defines the system paths and environment variables
needed to use the Code_Saturne 8.0.3 CCE 15.0.0 build. Once the
module is loaded the executable will be available as 'code_saturne'.

  Installed by: W. Lucas, EPCC
  Date: 26 November 2024
]])

local pkgNameVer = myModuleFullName()
local modbase = os.getenv("EPCC_SOFTWARE_DIR") or "/work/y07/shared"
local base = pathJoin(modbase, "apps/core", pkgNameVer)

load("PrgEnv-cray")
load("craype-network-ucx")
load("cray-mpich-ucx")

prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("PYTHONPATH", pathJoin(base, "lib/python3.9/site-packages"))
prepend_path("PYTHONPATH", pathJoin(base, "lib/python3.9/site-packages/code_saturne"))
prepend_path("MANPATH", pathJoin(base, "share/man"))

setenv("CODE_SATURNE_DIR", base)
setenv("CODE_SATURNE_INC", pathJoin(base, "include"))
setenv("CODE_SATURNE_LIB", pathJoin(base, "lib"))

family("code_saturne")
