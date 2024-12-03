help([[
AMD uProf 4.0.341
=================
AMD uProf (pronounced MICRO-prof) is a software profiling analysis tool for x86 applications.
It provides event information unique to the AMD "Zen"-based processors and AMD INSTINCT MI Series accelerators.

See https://developer.amd.com/amd-uprof/ .

   - Installed by: A. Turner, EPCC"
   - Date: 14 June 2022\n"
]])

local modbase = os.getenv("EPCC_SOFTWARE_DIR") or "/work/y07/shared"

local pkgNameVer = myModuleFullName()
local pkgVersionBase = pathJoin(modbase, "utils/core", pkgNameVer)

prepend_path("PATH", pathJoin(pkgVersionBase, "bin"))
prepend_path("CPATH", pathJoin(pkgVersionBase, "include"))
prepend_path("LD_LIBRARY_PATH", pathJoin(pkgVersionBase, "bin"))

family("amduprof")
