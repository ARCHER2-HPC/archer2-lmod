help([[
EPCC ARCHER2 Environment
========================

Environment setup for ARCHER2:
  * Adds to the the default MODULEPATH to make software modules available
  * Sets SBATCH_EXPORT=none to avoid login shell modules being setenv(ed to batch jobs

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
setenv("SLURM_CPU_FREQ_REQ","2000000")
setenv("SBATCH_EXPORT", "SLURM_CPU_FREQ_REQ,SBATCH_EXPORT")
setenv("SLURM_EXPORT_ENV", "all")
setenv("EPCC_SINGULARITY_DIR", "/work/y07/shared/singularity-images")

-- Load any default modules
always_load("bolt")

-- Make dynamic paths available
if os.getenv("PE_ENV") == "GNU" then
  prepend_path("MODULEPATH", "/work/y07/shared/archer2-lmod/utils/compiler/gnu/8.0")
elseif os.getenv("PE_ENV") == "CRAY" then
  prepend_path("MODULEPATH", "/work/y07/shared/archer2-lmod/utils/compiler/crayclang/10.0")
elseif os.getenv("PE_ENV") == "AOCC" then
  prepend_path("MODULEPATH", "/work/y07/shared/archer2-lmod/utils/compiler/aocc/3.0")
end
setenv("LMOD_CUSTOM_COMPILER_GNU_PREFIX", "/work/y07/shared/archer2-lmod/utils/compiler/gnu/8.0")
setenv("LMOD_CUSTOM_COMPILER_GNU_8_0_PREFIX", "/work/y07/shared/archer2-lmod/utils/compiler/gnu/8.0")
setenv("LMOD_CUSTOM_COMPILER_CRAYCLANG_PREFIX", "/work/y07/shared/archer2-lmod/utils/compiler/crayclang/10.0")
setenv("LMOD_CUSTOM_COMPILER_CRAYCLANG_10_0_PREFIX", "/work/y07/shared/archer2-lmod/utils/compiler/crayclang/10.0")
setenv("LMOD_CUSTOM_COMPILER_AOCC_PREFIX", "/work/y07/shared/archer2-lmod/utils/compiler/aocc/3.0")
setenv("LMOD_CUSTOM_COMPILER_AOCC_3_0_PREFIX", "/work/y07/shared/archer2-lmod/utils/compiler/aocc/3.0")

