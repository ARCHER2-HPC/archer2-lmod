help([[
LIKWID
======

LIKWID Performance Tools version 5.3.0

see also https://github.com/RRZE-HPC/likwid/wiki

Note: the ARCHER2 CSE team is currently trialling usage of LIKWID and will provide guidance on the ARCHER2 website in due course

  Installed by: A. Proeme, EPCC
  Date: 17 Sep. 2024
]])

local pkgName = myModuleName()
local pkgNameVer = myModuleFullName()
local pkgNameBase = pathJoin("/work/y07/shared/utils/core", pkgName)
local pkgVersionBase = pathJoin("/work/y07/shared/utils/core", pkgNameVer)

prepend_path("PATH", pathJoin(pkgVersionBase, "bin"))

family("likwid")
