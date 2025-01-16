help([[
NAMD 3.0-gpu
============
NAMD is a parallel molecular dynamics code designed for high-performance simulation of large biomolecular systems,
see https://www.ks.uiuc.edu/Research/namd/ .

This NAMD 3.0 is intended for use on the ARCHER2 GPU Nodes (AMD MI210).
It has been built with SMP support, introducing a dedicated communication thread for every process.

This module sets up your environment to access NAMD 3.0 - the executable file is called namd3.
NAMD 3.0 was built with GCC 11.2.0; it uses Cray MICH 8.1.23, Cray FFTW 3.3.10.3,
TCL 8.6.13, Charm++ 8.0.0 and ROCm 5.2.3.

Build instructions: https://github.com/hpc-uk/build-instructions/blob/main/apps/NAMD/build_namd_3.0_archer2_gcc11_cmpich8_gpu.md

   - Installed by: M. Bareford, EPCC"
   - Date: 23 July 2024\n"
]])

always_load("PrgEnv-gnu")
load("rocm")
load("craype-accel-amd-gfx90a")
load("craype-x86-milan")
load("cray-pmi")
load("cray-fftw")
load("cray-python")

pushenv("SLURM_CPU_FREQ_REQ","2250000")

local epccSoftwareDir = os.getenv("EPCC_SOFTWARE_DIR") or "/work/y07/shared"
local pkgNameVer = myModuleFullName()
local pkgVersionBase = pathJoin(epccSoftwareDir, "apps/core", "namd/3.0-gpu")

prepend_path("PATH", pathJoin(pkgVersionBase, "bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin(epccSoftwareDir, "apps/core/namd/tcl/8.5.9/lib"))

family("namd")
