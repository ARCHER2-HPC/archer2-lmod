help([[
Linaro Forge 22.1.3
===================
Linaro Forge is a debugging/profiling tool for scalar, multi-threaded and large-scale parallel applications.

Run "ssh <username>@login.archer2.ac.uk -L 4241:dvn04:4241" to setup port 4241 for accessing the
Forge Licence Server Status page at "http://localhost:4241/status.html".

Installed by: M. Bareford, EPCC
Date: 20 May 2024

]])
local pkgNameVer = myModuleFullName()
local base = pathJoin("/work/y07/shared/utils/core/", pkgNameVer)
local workDir = os.getenv("HOME")
workDir = workDir:gsub("home","work")

prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))
setenv("FORGE_CONFIG_DIR", pathJoin(workDir, ".forge"))
setenv("FORGE_MPIRUN", "/usr/bin/srun")
setenv("FORGE_DIR", base)
