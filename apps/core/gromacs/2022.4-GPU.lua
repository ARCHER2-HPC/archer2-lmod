help([[
Gromacs 2022.4 (AMD GPU version)
================================

This module sets up your environment to access Gromacs 2022.4.
Once loaded you can access Gromacs single-precision,
MPI executables using the 'gmx_mpi' command.

   - Installed by: A. Turner,  EPCC"
   - Date: 4 July 2024"

]])

family("gromacs")

local modbase = os.getenv("EPCC_SOFTWARE_DIR") or "/work/y07/shared"
local pkgNameVer = myModuleFullName()
local base = pathJoin(modbase, "apps/core", pkgNameVer)

prepend_path("LD_LIBRARY_PATH", os.getenv("CRAY_LD_LIBRARY_PATH"))
-- Adapted from $GMXPREFIX/bin/GMXRC.bash
local GMXPREFIX = base
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

pushenv("SLURM_CPU_FREQ_REQ","2250000")
pushenv("MPICH_GPU_SUPPORT_ENABLED","1")
pushenv("GMX_GPU_DD_COMMS","1")
pushenv("GMX_GPU_PME_PP_COMMS","1")
pushenv("GMX_FORCE_UPDATE_DEFAULT_GPU","1")
pushenv("ROC_ACTIVE_WAIT_TIMEOUT","0")
pushenv("AMD_DIRECT_DISPATCH","1")
