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

local pkgBase = "/mnt/lustre/a2fs-nvme/work/y07/shared/spack/0.21.2/spack-epcc"

setenv("SPACK_ROOT_EPCC", pkgBase)
setenv("SPACK_ROOT",pathJoin(pkgBase,"spack-0.21.2"))

-- This is the ARCHER2 CSE module for use by EPCC staff. This means that software
-- will be installed into a .spack directory located in the /work/y07/shared
-- central software directories.
setenv("SPACK_USER_CACHE_PATH", pathJoin(pkgBase, ".spack"))

-- NB this command sources the Spack setup script required for shell completion
-- and also for commands such as `spack load`. Using source_sh() would be
-- preferable but this misses *something* that the script does when converting
-- it to Lmod commands, so we run execute{} instead.
execute{cmd=". ${SPACK_ROOT}/share/spack/setup-env.sh", modeA={"load"}}

family("spack")
