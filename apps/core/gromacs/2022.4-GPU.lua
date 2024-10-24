help([[
Gromacs 2022.4 (AMD GPU version)
================================

This module sets up your environment to access Gromacs 2022.4.
Once loaded you can access Gromacs single-precision,
MPI executables using the 'gmx_mpi' command.

   - Installed by: A. Turner,  EPCC"
   - Date: 4 July 2024"

]])

pushenv("SLURM_CPU_FREQ_REQ","2800000")
pushenv("MPICH_GPU_SUPPORT_ENABLED","1")
pushenv("GMX_GPU_DD_COMMS","1")
pushenv("GMX_GPU_PME_PP_COMMS","1")
pushenv("GMX_FORCE_UPDATE_DEFAULT_GPU","1")
pushenv("ROC_ACTIVE_WAIT_TIMEOUT","0")
pushenv("AMD_DIRECT_DISPATCH","1")

local pkgName = myModuleName()
local pkgNameVer = myModuleFullName()
local pkgNameBase = pathJoin("/work/y07/shared/apps/core", pkgName)
local pkgVersionBase = pathJoin("/work/y07/shared/apps/core", pkgNameVer)

prepend_path("PATH", pathJoin(pkgVersionBase, "bin"))

family("gromacs")

