help([[
cp2k-2023.1
===========
This module sets up your environment to access CP2K-2023.1.
This module also sets the CP2K_DATA directory.

   - Installed by: M. Bareford, EPCC"
   - Date: 26 January 2023\n"

]])

load("PrgEnv-gnu")
load("cpe/21.09")
load("mkl")

local pkgName = myModuleName()
local pkgNameVer = myModuleFullName()
local pkgNameBase = pathJoin("/work/y07/shared/apps/core", pkgName)
local pkgVersionBase = pathJoin("/work/y07/shared/apps/core", pkgNameVer)

setenv("CP2K_DIR", pkgVersionBase)
setenv("CP2K_DATA", pathJoin(pkgVersionBase, "data"))

prepend_path("PATH", pathJoin(pkgVersionBase, "exe/ARCHER2"))
prepend_path("LD_LIBRARY_PATH", os.getenv("CRAY_LD_LIBRARY_PATH"))

family("cp2k")
