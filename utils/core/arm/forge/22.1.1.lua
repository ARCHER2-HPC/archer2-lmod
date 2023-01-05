help([[
Arm Forge 22.1.1
================
Arm Forge is a debugging tool for scalar, multi-threaded and large-scale parallel applications.

Installed by: M. Bareford, EPCC
Date: 5 December 2022

]])
local pkgNameVer = myModuleFullName()
local base = pathJoin("/work/y07/shared/utils/core/", pkgNameVer)
local workDir = os.getenv("HOME")
workDir = workDir:gsub("home","work")

prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))
setenv("ALLINEA_CONFIG_DIR", pathJoin(workDir, ".allinea"))
setenv("ALLINEA_MPIRUN", "/usr/bin/srun")
setenv("FORGE_DIR", base)
