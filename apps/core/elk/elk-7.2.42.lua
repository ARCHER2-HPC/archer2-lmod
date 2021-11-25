help([[
elk-7.2.42
==============
This module sets up your environment to access elk-7.2.42.
Elk is an all-electron full-potential linearised augmented-plane
 wave (LAPW) code with many advanced features

   - Installed by: H. Judge, EPCC"
   - Date: 18 October 2021\n"

]])

load("PrgEnv-gnu")

local pkgName = myModuleName()
local pkgNameVer = myModuleFullName()
local pkgNameBase = pathJoin("/work/y07/shared/apps/core", pkgName)
local pkgVersionBase = pathJoin("/work/y07/shared/apps/core", pkgNameVer)


prepend_path("PATH", pathJoin(pkgVersionBase, "src/bin"))

family("elk")
