help([[
tensorflow 2.9.3
================
A Python environment (based on cray-python/3.9.13.1) that provides TensorFlow 2.9.3 (https://www.tensorflow.org).

This version of TensorFlow is compatible with the Cray PE DL Plugin 22.12.1. The plugin provides a highly tuned communication layer
that can be easily added to any deep learning framework.

Horovod 0.28.1, a distributed deep learning training framework, is also provided - this package provides an alternative method
for running TensorFlow across multiple compute nodes.

Simply run "pip list" to see the full package list.

Build instructions: https://github.com/hpc-uk/build-instructions/blob/main/pyenvs/tensorflow/build_tensorflow_2.9.3_archer2.md

  Installed by: Michael Bareford, EPCC
  Date: 21 August 2023
]])

load("PrgEnv-gnu")
load("cray-python/3.9.13.1")
load("craype-dl-plugin-py3/22.12.1")

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


family("tensorflow")
