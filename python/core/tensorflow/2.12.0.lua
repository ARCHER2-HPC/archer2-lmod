help([[
tensorflow 2.12.0
=================
A Python environment (based on cray-python/3.9.13.1) that provides TensorFlow 2.12.0 (https://www.tensorflow.org).
The environment also includes Horovod 0.28.1, which may be required for running TensorFlow across multiple compute nodes.
Simply run "pip list" to see the full package list.

Build instructions: https://github.com/hpc-uk/build-instructions/blob/main/pyenvs/tensorflow/build_tensorflow_2.12.0_archer2.md

  Installed by: Michael Bareford, EPCC
  Date: 02 December 2024
]])

load("cray-python/3.9.13.1")

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
