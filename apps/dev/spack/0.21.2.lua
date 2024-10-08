help([[
Spack 0.21.2
==============
Spack is a package management tool for HPC.
This module enables Spack and configures for
software packages to be installed into the
user's directories at
/work/group/group/username/.spack.

- Installed by: L. Parisi, EPCC"
   - Date: 28 March 2024\n"
]])

local pkgBase = "/mnt/lustre/a2fs-nvme/work/y07/shared/spack/0.21.2/spack"

setenv("SPACK_ROOT_EPCC", pkgBase)
setenv("SPACK_ROOT",pathJoin(pkgBase,"spack-0.21.2"))

-- This is the user level package which will install packages to a directory
-- called .spack located in the user's /work directory.
local user = subprocess("id -un")
local group = subprocess("id -gn")
setenv("SPACK_USER_CACHE_PATH", pathJoin("/work", group, group, user, ".spack"))

-- NB this command sources the Spack setup script required for shell completion
-- and also for commands such as `spack load`. Using source_sh() would be
-- preferable but this misses *something* that the script does when converting
-- it to Lmod commands, so we run execute{} instead.
execute{cmd=". ${SPACK_ROOT}/share/spack/setup-env.sh", modeA={"load"}}

family("spack")
