help([[
LAMMPS 23 June 2022 Update 2 version
====================================

This module defines the system paths and environment variables
needed to use the stable build of LAMMPS v. 23 June 2022 Update 2. 
Once the module is loaded the executable will be available as 'lmp'.

  Installed by: J. Sindt, EPCC
  Date: 1 February 2023
]])

load("PrgEnv-gnu")
load("cpe/21.09")
prepend_path("LD_LIBRARY_PATH", os.getenv("CRAY_LD_LIBRARY_PATH"))

pushenv("SLURM_CPU_FREQ_REQ","2250000")

local pkgNameVer = myModuleFullName()
local base = pathJoin("/work/y07/shared/apps/core", pkgNameVer)

prepend_path("PATH", pathJoin(base, "bin"))

family("lammps")
