help([[
LAMMPS 29 September 2021 Stable
===============================

This module defines the system paths and environment variables
needed to use the 29 September 2021 stable build of LAMMPS. Once the
module is loaded the executable will be available as 'lmp'.

  Installed by: W. Lucas, EPCC
  Date: 6 October 2021
  Modified by: J. Sindt, EPCC
  Date: 26 Nov 2021
]])

load("cpe/21.09")
load("PrgEnv-gnu")
load("gcc/11.2.0")

local pkgNameVer = myModuleFullName()
local base = pathJoin("/work/y07/shared/apps/core", pkgNameVer)

prepend_path("PATH", pathJoin(base, "bin"))

family("lammps")
