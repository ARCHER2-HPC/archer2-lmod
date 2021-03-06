help([[
pytorch
=======
https://pytorch.org/

Build instructions: https://github.com/hpc-uk/build-instructions/blob/main/pyenvs/pytorch/build_pytorch_1.10.0_archer2.md

  Installed by: Michael Bareford, EPCC
  Date: 13 December 2021
]])

always_load("cray-python/3.8.5.0")

local pkgNameVer = myModuleFullName()
local pkgVersionBase = pathJoin("/work/y07/shared/python/core", pkgNameVer)
local pythonSitePackages = pathJoin(pkgVersionBase, "python/3.8.5.0/lib/python3.8/site-packages")
 
prepend_path("PATH", pathJoin(pkgVersionBase, "python/3.8.5.0/bin"))
prepend_path("PYTHONPATH", pythonSitePackages)
prepend_path("MANPATH", pythonSitePackages)

family("pytorch")
