help([[
PyTorch 1.13.0a0
================
A Python environment (based on cray-python/3.9.13.1) that provides PyTorch 1.13.0a0 (https://pytorch.org).

PyTorch 1.13.0a0 was built from source in order to ensure that the "torch.distributed" module is hooked up to
the appropriate HPE MPICH libraries, allowing PyTorch jobs to be run across multiple compute nodes

Please note, PyTorch source version 1.13.0a0 corresponds to PyTorch package version 1.13.1.

The environment also includes Horovod 0.28.1. That package provides an alternative way for running PyTorch across
multiple compute nodes. Simply run "pip list" to see the full package list.

Build instructions: https://github.com/hpc-uk/build-instructions/blob/main/pyenvs/pytorch/build_pytorch_1.13.0a0_from_source_archer2_cpu.md

  Installed by: Michael Bareford, EPCC
  Date: April 2024
]])

load("PrgEnv-gnu")
load("cray-python")
load("cray-fftw")
load("mkl")

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
