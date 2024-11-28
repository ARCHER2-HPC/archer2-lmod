help([[
Spindle 0.13
============
This module allows you to use Spindle, a tool for improving the library-loading performance of dynamically linked HPC applications.

For further details, https://computing.llnl.gov/projects/spindle .

Build instructions: https://github.com/hpc-uk/build-instructions/blob/main/utils/spindle/build_spindle_0.13_archer2_gcc11.md
Run instructions: https://github.com/hpc-uk/build-instructions/blob/main/utils/spindle/run_spindle_0.13_archer2_gcc11.md

   - Installed by: M. Bareford, EPCC"
   - Date: 28 Nov 2024\n"
]])

local modBase = os.getenv("EPCC_SOFTWARE_DIR")

local pkgName = myModuleName()
local pkgNameVer = myModuleFullName()
local pkgNameBase = pathJoin(modBase, "utils/core", pkgName)
local pkgVersionBase = pathJoin(modBase, "utils/core", pkgNameVer)

prepend_path("PATH", pathJoin(pkgVersionBase, "bin"))
prepend_path("CPATH", pathJoin(pkgVersionBase, "include"))
prepend_path("MANPATH", pathJoin(pkgVersionBase, "share/man"))
prepend_path("LD_LIBRARY_PATH", pathJoin(pkgVersionBase, "lib"))
prepend_path("LD_LIBRARY_PATH", pathJoin(pkgVersionBase, "lib/spindle"))

family("spindle")
