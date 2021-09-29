help([[
EPCC ARCHER2 Environment"
========================\n"

Environment setup for ARCHER2:\n"
  * Adds to the the default MODULEPATH to make software modules available"
  * Sets SBATCH_EXPORT=none to avoid login shell modules being exported to batch jobs\n"

  Installed: 29 September 2021"
  Installed by: Andy Turner, EPCC"
]])


prepend_path("MODULEPATH", "/work/y07/shared/archer2-lmod/apps/core")
prepend_path("MODULEPATH", "/work/y07/shared/archer2-lmod/libs/core")
prepend_path("MODULEPATH", "/work/y07/shared/archer2-lmod/utils/core")
prepend_path("MODULEPATH", "/work/y07/shared/archer2-lmod/python/core")
prepend_path("MODULEPATH", "/work/y07/shared/archer2-lmod/python/pyenvs")

prepend_path("PATH", "/work/y07/shared/utils/bin")

setenv("OMP_NUM_THREADS", "1")
setenv("SBATCH_EXPORT", "MODULEPATH,SBATCH_EXPORT")
setenv("SLURM_EXPORT_ENV", "all")
setenv("EPCC_SINGULARITY_DIR", "/work/y07/shared/singularity-images")

# Default modules
always_load("bolt")

