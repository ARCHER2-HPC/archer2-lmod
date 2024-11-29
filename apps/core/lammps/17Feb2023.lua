help([[
LAMMPS 23 June 2022 Update 3 version
====================================

This module defines the system paths and environment variables
needed to use the stable build of LAMMPS v. 23 June 2022 Update 3. 
Once the module is loaded the executable will be available as 'lmp'.

  Installed by: R. Apóstolo, EPCC
  Date: 27 March 2023

Use `man lmp` for more help with LAMMPS.
]])

family("lammps")

--load("cpe/22.12")
depends_on("cray-fftw/3.3.10.3")

local modbase = os.getenv("EPCC_SOFTWARE_DIR") or "/work/y07/shared"
local pkgNameVer = myModuleFullName()
local base = pathJoin(modbase, "apps/core", pkgNameVer)


prepend_path("LD_LIBRARY_PATH", os.getenv("CRAY_LD_LIBRARY_PATH"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib64"))
prepend_path("MANPATH", pathJoin(base, "share/man"))
prepend_path("PATH", pathJoin(base, "bin"))

pushenv("LAMMPS_POTENTIALS", pathJoin(base, "share/lammps/potentials"))
pushenv("SLURM_CPU_FREQ_REQ","2250000")
