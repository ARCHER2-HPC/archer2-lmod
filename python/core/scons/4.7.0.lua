help([[
SCons
=====

SCons is a modern software construction tool - a software utility for building software.

https://pypi.org/project/SCons/

Build instructions: https://github.com/hpc-uk/build-instructions/blob/main/pyenvs/scons/build_scons_4.7.0_archer2.md

  Installed by: M. Bareford, EPCC
  Date: 24 April 2024
]])

always_load("cray-python/3.9.13.1")

local pkgNameVer = myModuleFullName()
local pkgVersionBase = pathJoin("/work/y07/shared/python/core", pkgNameVer)
local pythonSitePackages = pathJoin(pkgVersionBase, "python/3.9.13.1/lib/python3.9/site-packages")

prepend_path("PATH", pathJoin(pkgVersionBase, "python/3.9.13.1/bin"))
prepend_path("PYTHONPATH", pythonSitePackages)
prepend_path("MANPATH", pythonSitePackages)

family("scons")
