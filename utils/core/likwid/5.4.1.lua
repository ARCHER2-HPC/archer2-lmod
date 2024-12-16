help([[
LIKWID
======

LIKWID Performance Tools version 5.4.1

Compared to version 5.3.0, this release adds the following features that may be of use to ARCHER2 users:

o Add AMD Zen1 to Zen3 to sysfeatures
o Fix sysfeatures with ACCESSMODE=perf_event
o likwid-mpirun: SLURM pinning with cpu_mask feature (from v5.4.0)

see also https://github.com/RRZE-HPC/likwid/wiki

Note: the ARCHER2 CSE team is currently trialling usage of LIKWID and will provide guidance on the ARCHER2 website in due course

  Installed by: A. Proeme, EPCC
  Date: 16 Dec. 2024
]])


local modbase = os.getenv("EPCC_SOFTWARE_DIR") or "/work/y07/shared"

local pkgName = myModuleName()
local pkgNameVer = myModuleFullName()
local pkgVersionBase = pathJoin(modbase, "utils/core", pkgNameVer)
local binDir = pathJoin(pkgVersionBase, "bin")

setenv("LIKWID_DIR", pkgVersionBase)
prepend_path("PATH", binDir)


family("likwid")
