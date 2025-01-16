help([[
Paraview visualisation servers and libraries.
Version 5.11.1

Installed: 14th July 2023 (s.lemaire@epcc.ed.ac.uk)

Currently Loaded Modules:
  1) craype-x86-rome            3) craype-network-ofi       5) xpmem/2.5.2-2.4_3.30__gd0f7936.shasta  
  2) libfabric/1.12.1.2.2.0.0   4) perftools-base/22.12.0   6) bolt/0.8                                
  7) epcc-setup-env     9) gcc/11.2.0     11) cray-dsmml/0.2.2   13) cray-libsci/22.12.1.1  15) cray-python/3.9.13.1
  8) load-epcc-module  10) craype/2.7.19  12) cray-mpich/8.1.23  14) PrgEnv-gnu/8.3.3       16) cmake/3.21.3

]])

load("cray-python")

local pkgNameVer = myModuleFullName()
local modbase = os.getenv("EPCC_SOFTWARE_DIR")
local base = pathJoin(modbase, "utils/core", pkgNameVer)

prepend_path("PATH", pathJoin(base, "paraview/bin"))

prepend_path("LD_LIBRARY_PATH", pathJoin(base, "ospray/ospray/lib64"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "ospray/openvkl/lib64"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "ospray/embree/lib64"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "llvm/lib"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "mesa/lib64"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "paraview/lib64"))

prepend_path("PYTHONPATH", pathJoin(base, "paraview/lib64/python3.9/site-packages"))
