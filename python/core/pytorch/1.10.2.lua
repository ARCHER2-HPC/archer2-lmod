help([[
pytorch 1.10.2
==============
A Python environment (based on cray-python/3.9.13.1) that provides PyTorch 1.10.2 (https://pytorch.org).

This version of PyTorch is compatible with the Cray PE DL Plugin 22.12.1. The plugin provides a highly tuned communication layer
that can be easily added to any deep learning framework.

Horovod 0.28.1, a distributed deep learning training framework, is also provided - this package provides an alternative method
for running PyTorch across multiple compute nodes.

Simply run "pip list" to see the full package list.

Build instructions: https://github.com/hpc-uk/build-instructions/blob/main/pyenvs/pytorch/build_pytorch_1.10.2_archer2_cpu.md

  Installed by: Michael Bareford, EPCC
  Date: 21 August 2023
]])

load("PrgEnv-gnu")
load("cray-python/3.9.13.1")
load("craype-dl-plugin-py3/22.12.1")

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
