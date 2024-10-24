help([[
Gromacs 2023.4
==============
This module sets up your environment to access Gromacs 2023.4.
Once loaded you can access Gromacs single- and double-precision
MPI executables using the 'gmx_mpi' command and the `gmx_mpi_d` command
respectively. You can also use a serial version on the login node
by using the 'gmx' command.

   - Installed by: R. Apóstolo, EPCC"
   - Date: 22 April 2024"

]])
-- load("cpe/22.12")
load("cray-python/3.9.13.1")
load("cray-fftw/3.3.10.3")

pushenv("SLURM_CPU_FREQ_REQ","2250000")

local pkgName = myModuleName()
local pkgNameVer = myModuleFullName()
local pkgNameBase = pathJoin("/work/y07/shared/apps/core", pkgName)
local pkgVersionBase = pathJoin("/work/y07/shared/apps/core", pkgNameVer)

prepend_path("LD_LIBRARY_PATH", os.getenv("CRAY_LD_LIBRARY_PATH"))

-- Adapted from $GMXPREFIX/bin/GMXRC.bash
local GMXPREFIX = pkgVersionBase
setenv("GMX_DIR", GMXPREFIX)
setenv("GROMACS_DIR", GMXPREFIX)
local GMXBIN = pathJoin(GMXPREFIX, "bin")
setenv("GMXBIN", GMXBIN)
local GMXLDLIB = pathJoin(GMXPREFIX, "lib64")
setenv("GMXLDLIB", GMXLDLIB)
local GMXMAN = pathJoin(GMXPREFIX, "share/man")
setenv("GMXMAN", GMXMAN)
local GMXDATA = pathJoin(GMXPREFIX, "share/gromacs")
setenv("GMXDATA", GMXDATA)
local GMXTOOLCHAINDIR = pathJoin(GMXPREFIX, "share/cmake")
setenv("GMXTOOLCHAINDIR", GMXTOOLCHAINDIR)
setenv("GMX_INCLUDE_OPTS", pathJoin(pkgVersionBase, "include"))

append_path("LD_LIBRARY_PATH", GMXLDLIB)
prepend_path("PATH", GMXBIN)
prepend_path("MANPATH", GMXMAN)
setenv("GMXLIB", pathJoin(GMXPREFIX, "share/gromacs/top"))


family("gromacs")
