help([[
AMD uProf 3.6.449
=================
AMD uProf (pronounced MICRO-prof) is a software profiling analysis tool for x86 applications.
It provides event information unique to the AMD "Zen"-based processors and AMD INSTINCT MI Series accelerators.

See https://developer.amd.com/amd-uprof/ .

   - Installed by: M. Bareford, EPCC"
   - Date: 7 November 2022\n"
]])

local pkgName = myModuleName()
local pkgNameVer = myModuleFullName()
local pkgNameBase = pathJoin("/work/y07/shared/utils/dev", pkgName)
local pkgVersionBase = pathJoin("/work/y07/shared/utils/dev", pkgNameVer)

prepend_path("PATH", pathJoin(pkgVersionBase, "bin"))
prepend_path("CPATH", pathJoin(pkgVersionBase, "include"))
prepend_path("LD_LIBRARY_PATH", pathJoin(pkgVersionBase, "bin"))

family("amd-uprof")
