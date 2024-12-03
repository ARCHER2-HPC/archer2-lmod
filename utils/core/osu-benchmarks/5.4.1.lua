help([[
OSU MPI micro-benchmarks
========================

   - Installed by: A. Turner, EPCC"
   - Date: 17 August 2023\n"
]])


local modbase = os.getenv("EPCC_SOFTWARE_DIR") or "/work/y07/shared"

local pkgNameVer = myModuleFullName()
local pkgVersionBase = pathJoin(modbase, "apps/core", pkgNameVer)

local path_extension = "libexec/osu-micro-benchmarks/mpi"

prepend_path("PATH", pathJoin(pkgVersionBase, path_extension, "collective"))
prepend_path("PATH", pathJoin(pkgVersionBase, path_extension, "startup"))
prepend_path("PATH", pathJoin(pkgVersionBase, path_extension, "pt2pt"))
prepend_path("PATH", pathJoin(pkgVersionBase, path_extension, "one-sided"))

family("osubenchmarks")
