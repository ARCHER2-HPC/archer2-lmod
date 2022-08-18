help([[
Paraview visualisation servers and libraries.
Version 5.10.1

Installed: 18th August  2022(kevin@epcc.ed.ac.uk)

Modules loaded at compile time:
  1) gcc/10.2.0                                  9) cray-libsci/21.04.1.1
  2) craype/2.7.6                               10) bolt/0.7
  3) craype-x86-rome                            11) epcc-setup-env
  4) libfabric/1.11.0.4.71                      12) load-epcc-module
  5) craype-network-ofi                         13) PrgEnv-gnu/8.0.0
  6) perftools-base/21.02.0                     14) cray-python/3.8.5.0
  7) xpmem/2.2.40-7.0.1.0_2.7__g1d7a24d.shasta  15) cray-hdf5/1.12.0.3
  8) cray-mpich/8.1.4
]])

load("cray-python")

local pkgNameVer = myModuleFullName()
local base = pathJoin("/work/y07/shared/utils/core", pkgNameVer)

prepend_path("PATH", pathJoin(base, "paraview/bin"))

prepend_path("LD_LIBRARY_PATH", pathJoin(base, "ospray/2.1.0/ospray/lib64"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "ospray/2.1.0/openvkl/lib64"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "ospray/2.1.0/embree/lib64"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "llvm/lib"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "mesa/21.0.1/lib64"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "paraview/lib64"))

prepend_path("PYTHONPATH", pathJoin(base, "paraview/lib64/python3.8/site-packages"))
