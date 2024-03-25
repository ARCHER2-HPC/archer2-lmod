help([[
LAMMPS 07 February 2024 Update 1 version
========================================

This module defines the system paths and environment variables
needed to use the stable build of LAMMPS v. 7 February 2024 Update 1,
also known as 13Feb2024.
Once the module is loaded the executable will be available as 'lmp'.

  Installed by: R. Apóstolo, EPCC
  Date: 22 March 2024

Use `man lmp` after loading this module for more help with LAMMPS.
]])

family("lammps")

always_load("cpe/22.12")
depends_on("cray-fftw/3.3.10.3")

local pkgNameVer = myModuleFullName()
local base = pathJoin("/work/y07/shared/apps/core", pkgNameVer)

prepend_path("LD_LIBRARY_PATH", os.getenv("CRAY_LD_LIBRARY_PATH"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib64"))
prepend_path("MANPATH", pathJoin(base, "share/man"))
prepend_path("PATH", pathJoin(base, "bin"))

pushenv("LAMMPS_POTENTIALS", pathJoin(base, "share/lammps/potentials"))
pushenv("SLURM_CPU_FREQ_REQ","2250000")
