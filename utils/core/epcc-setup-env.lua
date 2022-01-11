help([[
EPCC ARCHER2 Environment
========================

Environment setup for ARCHER2:
  * Adds to the the default MODULEPATH to make software modules available
  * Sets SBATCH_EXPORT=none to avoid login shell modules being exported to batch jobs

  Installed: 29 September 2021
  Installed by: Andy Turner, EPCC
]])


-- Set default module locations (utils/core already specified in startup scripts)
prepend_path("MODULEPATH", "/work/y07/shared/archer2-lmod/apps/core")
prepend_path("MODULEPATH", "/work/y07/shared/archer2-lmod/libs/core")
prepend_path("MODULEPATH", "/work/y07/shared/archer2-lmod/python/core")
prepend_path("MODULEPATH", "/work/y07/shared/archer2-lmod/python/pyenvs")
prepend_path("MODULEPATH", "/work/y07/shared/archer2-lmod/training/core")

-- Make default binaries/scripts available
prepend_path("PATH", "/work/y07/shared/utils/core/bin")

-- Set any env vars
--setenv("SBATCH_EXPORT", "MODULEPATH,SBATCH_EXPORT")
setenv("SBATCH_EXPORT", "SBATCH_EXPORT")
setenv("SLURM_EXPORT_ENV", "all")
setenv("EPCC_SINGULARITY_DIR", "/work/y07/shared/singularity-images")

-- Load any default modules
always_load("bolt")

