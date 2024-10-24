help([[
Introduction to Data Science and Machine Learning (ta160)
=========================================================

A Python environment (based on cray-python/3.9.13.1) that provides PyTorch 2.3.1 (https://pytorch.org).
This environment is required for the practical exercises that are undertaken during the ta160 training course, Introduction to Data Science and Machine Learning.

  Installed by: Michael Bareford, EPCC
  Date: 10 June 2024
]])

load("PrgEnv-gnu")
load("cray-python/3.9.13.1")
load("matplotlib")
load("seaborn")

local pythonVersion = "3.9.13.1"
local pythonLabel = "python3.9"

local pkgNameVer = myModuleFullName()
local pkgVersionBase = pathJoin("/work/y07/shared/python/training", pkgNameVer)

local pythonBin = pathJoin(pkgVersionBase, "python", pythonVersion, "bin")
local pythonLib = pathJoin(pkgVersionBase, "python", pythonVersion, "lib")
local pythonSitePackages = pathJoin(pythonLib, pythonLabel, "site-packages")
local pythonManPath = pathJoin(pkgVersionBase, "python", pythonVersion, "share/man")

prepend_path("PATH", pythonBin)
prepend_path("LD_LIBRARY_PATH", pythonLib)
prepend_path("PYTHONPATH", pythonSitePackages)
prepend_path("PYTHON_PATH", pythonSitePackages)
prepend_path("MANPATH", pythonManPath)

family("ta160")
