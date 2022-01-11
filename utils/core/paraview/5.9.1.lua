help([[
Paraview visualisation servers and libraries.
Version 5.9.1
]])

load("cray-python")

local pkgNameVer = myModuleFullName()
local base = pathJoin("/work/y07/shared/utils/core", pkgNameVer)

prepend_path("PATH", pathJoin(base, "paraview/build/install/bin"))
prepend_path("PATH", pathJoin(base, "llvm/bin"))

prepend_path("LD_LIBRARY_PATH", pathJoin(base, "ospray/2.1.0/ospray/lib64"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "ospray/2.1.0/openvkl/lib64"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "ospray/2.1.0/embree/lib64"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "llvm/lib"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "mesa/21.0.1/lib64"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "paraview/build/install/lib64"))

prepend_path("PYTHONPATH", pathJoin(base, "paraview/build/install/lib64/python3.8/site-packages"))

family("paraview")
