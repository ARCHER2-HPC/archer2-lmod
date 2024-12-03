help([[
pytorch 1.13.1-gpu
==================
A Python environment (based on cray-python/3.9.13.1) that provides PyTorch 1.13.1 (https://pytorch.org) for the ARCHER2 GPU nodes.

Horovod 0.28.1, a distributed deep learning training framework, is also installed - this package can be used for running
PyTorch across multiple GPU nodes. This can also be done by using the ROCm Collective Communications Library (RCCL) directly
via the `torch.distributed` module.

Simply run "pip list" to see the full package list.

Build instructions: https://github.com/hpc-uk/build-instructions/blob/main/pyenvs/pytorch/build_pytorch_1.13.1_archer2_gpu.md

  Installed by: Michael Bareford, EPCC
  Date: 26 February 2024
]])

load("PrgEnv-gnu")
load("craype-x86-milan")
load("craype-accel-amd-gfx90a")
load("cray-python/3.9.13.1")
load("cray-hdf5-parallel/1.12.2.1")
load("rocm/5.2.3")

local pythonVersion = "3.9.13.1"
local pythonLabel = "python3.9"

local pkgBase = os.getenv("EPCC_SOFTWARE_DIR")
local pkgNameVer = myModuleFullName()
local pkgVersionBase = pathJoin(pkgBase, "python/core", pkgNameVer)

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
