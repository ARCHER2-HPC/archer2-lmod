help([[
LAMMPS 23 June 2022 Update 3 version
====================================

This module defines the system paths and environment variables
needed to use the stable build of LAMMPS v. 23 June 2022 Update 2. 
Once the module is loaded the executable will be available as 'lmp'.

  Installed by: R. Apóstolo EPCC
  Date: 9 March 2023
]])

pushenv("SLURM_CPU_FREQ_REQ","2250000")

local pkgNameVer = myModuleFullName()
local base = pathJoin("/work/y07/shared/apps/core", pkgNameVer)

prepend_path("PATH", pathJoin(base, "bin"))

family("lammps")
