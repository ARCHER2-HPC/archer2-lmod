help([[
tensorflow
==========
https://www.tensorflow.org/

Build instructions: https://github.com/hpc-uk/build-instructions/blob/main/pyenvs/tensorflow/build_tensorflow_2.11.0_archer2.md

  Installed by: Michael Bareford, EPCC
  Date: 9 February 2023
]])

load("PrgEnv-gnu")
load("cpe/21.09")
load("cray-python")

local pkgNameVer = myModuleFullName()
local pkgVersionBase = pathJoin("/work/y07/shared/python/core", pkgNameVer)
local pythonSitePackages = pathJoin(pkgVersionBase, "python/3.9.4.1/lib/python3.9/site-packages")
 
prepend_path("PATH", pathJoin(pkgVersionBase, "python/3.9.4.1/bin"))
prepend_path("PYTHONPATH", pythonSitePackages)
prepend_path("MANPATH", pythonSitePackages)

prepend_path("LD_LIBRARY_PATH", pathJoin(os.getenv("GCC_PREFIX"), "/snos/lib64"))
prepend_path("LD_LIBRARY_PATH", os.getenv("CRAY_LD_LIBRARY_PATH"))

family("tensorflow")
