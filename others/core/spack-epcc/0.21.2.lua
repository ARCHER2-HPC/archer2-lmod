help([[
Spack 0.21.2
==============
Spack is a package management tool for HPC.
This module enables Spack and configures for
software packages to be installed into the
central CSE software directories, and as such
is intended for use only by members of the
ARCHER2 CSE team.

- Installed by: L. Parisi, EPCC"
   - Date: 28 March 2024\n"
]])

local pkgBase = "/mnt/lustre/a2fs-nvme/work/y07/shared/apps/dev/spack/0.21.2"

setenv("SPACK_ROOT", pkgBase)

-- This is the ARCHER2 CSE module for use by EPCC staff. This means that
-- Spack will cache into a directory within the Spack installation itself.
setenv("SPACK_USER_CACHE_PATH", pathJoin(pkgBase, ".spack"))

-- Use the same directory for the user configs, though as CSE we may well not
-- ever need to use them.
setenv("SPACK_USER_CONFIG_PATH", pathJoin(pkgBase, ".spack"))

-- We want to use the ARCHER2 CSE specific configs. In order to keep the USER
-- level config available to us, in case we want to override anything, we set
-- the SYSTEM level config to a directory inside the repository holding the
-- CSE config files.
setenv("SPACK_SYSTEM_CONFIG_PATH", pathJoin(pkgBase, "etc/spack/archer2-cse"))

-- NB this command sources the Spack setup script required for shell completion
-- and also for commands such as `spack load`. Using source_sh() would be
-- preferable but this misses *something* that the script does when converting
-- it to Lmod commands, so we run execute{} instead.
execute{cmd=". ${SPACK_ROOT}/share/spack/setup-env.sh", modeA={"load"}}

family("spack")
