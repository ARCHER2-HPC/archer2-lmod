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

family("gromacs")

depends_on("cray-python/3.9.13.1")
depends_on("cray-fftw/3.3.10.3")


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
