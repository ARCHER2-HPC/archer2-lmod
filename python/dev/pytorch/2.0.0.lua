help([[
pytorch
=======
https://pytorch.org/

  Installed by: Michael Bareford, EPCC
  Date: 27 April 2023
]])

load("cray-python/3.9.13.1")

local pkgNameVer = myModuleFullName()
local pkgVersionBase = pathJoin("/work/y07/shared/python/core", pkgNameVer)

local pythonBin = pathJoin(pkgVersionBase, "python", os.getenv("CRAY_PYTHON_LEVEL"), "bin")
local pythonSitePackages = pathJoin(pkgVersionBase, "python", os.getenv("CRAY_PYTHON_LEVEL"), "lib/python3.9/site-packages")
local pythonManPath = pathJoin(pkgVersionBase, "python", os.getenv("CRAY_PYTHON_LEVEL"), "share/man")

prepend_path("PATH", pythonBin)
prepend_path("PYTHONPATH", pythonSitePackages)
prepend_path("MANPATH", pythonManPath)

family("pytorch")
