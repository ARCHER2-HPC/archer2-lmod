help([[
cp2k-8.2
==============
This module sets up your environment to access CP2K-8.2.
This module also sets the CP2K_DATA directory.

   - Installed by: H. Judge, EPCC"
   - Date: 24 November 2021\n"

]])

load("PrgEnv-gnu")
load("cpe/21.09")
load("craype-network-ucx")
load("cray-mpich-ucx")
load("mkl/19.5-281")

local pkgName = myModuleName()
local pkgNameVer = myModuleFullName()
local pkgNameBase = pathJoin("/work/y07/shared/apps/core", pkgName)
local pkgVersionBase = pathJoin("/work/y07/shared/apps/core", pkgNameVer)

prepend_path("LD_LIBRARY_PATH", os.getenv("CRAY_LD_LIBRARY_PATH"))
setenv("CP2K_DATA", pathJoin(pkgVersionBase, "data"))

prepend_path("PATH", pathJoin(pkgVersionBase, "exe/ARCHER2"))

family("cp2k")
