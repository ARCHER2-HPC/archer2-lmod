help([[
QChem 6.1
=========
This module sets up your environment to access QChem 6.1.
Once loaded, you can use the "qchem -slurm" command to
launch QChem calculations.

   - Installed by: A. Turner, EPCC"
   - Date: 16 May 2024"

]])

local pkgName = myModuleName()
local pkgNameVer = myModuleFullName()
local pkgNameBase = pathJoin("/work/y07/shared/apps/core", pkgName)
local pkgVersionBase = pathJoin("/work/y07/shared/apps/core", pkgNameVer)

-- Adapted from $QC/qcenv.sh
local qcprefix = pkgVersionBase
local qcplatform = "LINUX_Ix86_64"
local curdir = os.getenv("PWD")
setenv("QC", qcprefix)
setenv("QCPLATFORM", qcplatform)
setenv("QCSCRATCH", curdir)
setenv("QCAUX", pathJoin(qcprefix, "qcaux"))
setenv("QCMPI", "seq")
setenv("QCRSH", "ssh")
setenv("QCPROG", pathJoin(qcprefix, "exe/qcprog.exe"))
setenv("QCPROG_S", pathJoin(qcprefix, "exe/qcprog.exe_s"))

prepend_path("PATH", pathJoin(qcprefix, "bin"))
prepend_path("PATH", pathJoin(qcprefix, "exe"))

family("qchem")
