help([[
LAMMPS 02 August 2024 Update 3 AMD GPU version
========================================

This module defines the system paths and environment variables
needed to use the stable build of LAMMPS v. 2 Aug 2024 Update 3
compipled for AMD GPU.

Once the module is loaded the executable will be available as 'lmp'.

  Installed by: A. Turner, EPCC
  Date: 1 Jul 2024

Use `man lmp` after loading this module for more help with LAMMPS.
]])

family("lammps")


local pkgNameVer = myModuleFullName()
local base = pathJoin("/work/y07/shared/apps/core", pkgNameVer)

prepend_path("LD_LIBRARY_PATH", os.getenv("CRAY_LD_LIBRARY_PATH"))
prepend_path("MANPATH", pathJoin(base, "share/man"))
prepend_path("PATH", pathJoin(base, "bin"))

pushenv("LAMMPS_POTENTIALS", pathJoin(base, "share/lammps/potentials"))
pushenv("SLURM_CPU_FREQ_REQ","2800000")
