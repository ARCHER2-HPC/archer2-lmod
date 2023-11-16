help([[
Code_Saturne 7.0.1
==================

This module defines the system paths and environment variables
needed to use the Code_Saturne 7.0.1 GCC 11.2.0 build. Once the
module is loaded the executable will be available as 'code_saturne'.

  Installed by: W. Lucas, EPCC
  Date: 7 June 2023
]])

local pkgNameVer = myModuleFullName()
local base = pathJoin("/work/y07/shared/apps/core", pkgNameVer)

load("PrgEnv-gnu")
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
