help([[
pytorch 2.0.0
=============
A Python environment (based on cray-python/3.9.13.1) that provides PyTorch 2.0.0 (https://pytorch.org).
The environment also includes Horovod 0.28.1, which may be required for running PyTorch across multiple compute nodes.
Simply run "pip list" to see the full package list.

Build instructions: https://github.com/hpc-uk/build-instructions/blob/main/pyenvs/pytorch/build_pytorch_2.0.0_archer2.md

  Installed by: Michael Bareford, EPCC
  Date: 09 June 2023
]])

load("cray-python")

local pythonVersion = "3.9.13.1"
local pythonLabel = "python3.9"

local pkgNameVer = myModuleFullName()
local pkgVersionBase = pathJoin("/work/y07/shared/python/core", pkgNameVer)

local pythonBin = pathJoin(pkgVersionBase, "python", pythonVersion, "bin")
local pythonLib = pathJoin(pkgVersionBase, "python", pythonVersion, "lib")
local pythonSitePackages = pathJoin(pythonLib, pythonLabel, "site-packages")
local pythonManPath = pathJoin(pkgVersionBase, "python", pythonVersion, "share/man")

prepend_path("PATH", pythonBin)
prepend_path("LD_LIBRARY_PATH", pythonLib)
prepend_path("PYTHONPATH", pythonSitePackages)
prepend_path("PYTHON_PATH", pythonSitePackages)
prepend_path("MANPATH", pythonManPath)

family("pytorch")
