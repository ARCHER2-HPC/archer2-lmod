help([[
NAMD 2.14-nosmp
===============
NAMD is a parallel molecular dynamics code designed for high-performance simulation of large biomolecular systems,
see https://www.ks.uiuc.edu/Research/namd/ .

This NAMD 2.14 has been built without SMP support.

This module sets up your environment to access NAMD 2.14 - the executable file is called namd2.
NAMD 2.14 was built with GCC 11.2.0; it uses Cray MICH 8.1.23, Cray FFTW 3.3.10.3,
TCL 8.5.9 and Charm++ 6.10.2.

Build instructions: https://github.com/hpc-uk/build-instructions/blob/main/apps/NAMD/build_namd_2.14_archer2_gcc11_cmpich8.md

   - Installed by: M. Bareford, EPCC"
   - Date: 29 March 2023\n"
]])

always_load("PrgEnv-gnu")
load("cray-fftw")

pushenv("SLURM_CPU_FREQ_REQ","2250000")

local epccSoftwareDir = os.getenv("EPCC_SOFTWARE_DIR") or "/work/y07/shared"
local pkgNameVer = myModuleFullName()
local pkgVersionBase = pathJoin(epccSoftwareDir, "apps/core", "namd/2.14-nosmp")

prepend_path("PATH", pathJoin(pkgVersionBase, "bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin(epccSoftwareDir, "apps/core/namd/tcl/8.5.9/lib"))

family("namd")
