help([[
Arm Forge 21.0.2
============
Arm Forge is a debugging tool for scalar, multi-threaded and large-scale parallel applications.

Installed by: C. Laoide-Kemp, EPCC
Date: 11 May 2022

]])
local pkgNameVer = myModuleFullName()
local base = pathJoin("/work/y07/shared/utils/core/", pkgNameVer)
local workDir = os.getenv("HOME")
workDir = workDir:gsub("home","work")

prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))
setenv("ALLINEA_CONFIG_DIR", pathJoin(workDir, ".allinea"))
setenv("ALLINEA_MPIRUN", "/usr/bin/srun")
setenv("FORGE_ROOT", base)
