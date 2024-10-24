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

local pkgBase = "/mnt/lustre/a2fs-nvme/work/y07/shared/apps/dev/spack/0.21.2"

setenv("SPACK_ROOT", pkgBase)

-- This is the user level package which will cache to a directory called .spack
-- located in the user's /work directory. This location is also used as the
-- default software install root.
local user = subprocess("id -un")
local group = subprocess("id -gn")
setenv("SPACK_USER_CACHE_PATH", pathJoin("/work", group, group, user, ".spack"))

-- Use the same directory for the user scope configs. Individual users may wish
-- to override this, but as a default we should make sure they stay on /work 
-- rather than /home, otherwise Spack will probably break in jobs.
setenv("SPACK_USER_CONFIG_PATH", pathJoin("/work", group, group, user, ".spack"))

-- We want to use the ARCHER2 user specific configs which, among other things,
-- is configured to use the CSE installation as an upstream package source. In
-- order to keep the USER scope config available, in case the user wants to
-- override anything themselves, we set the SYSTEM level config to a directory
-- inside the repository holding the user config files.
setenv("SPACK_SYSTEM_CONFIG_PATH", pathJoin(pkgBase, "etc/spack/archer2-user"))

-- NB this command sources the Spack setup script required for shell completion
-- and also for commands such as `spack load`. Using source_sh() would be
-- preferable but this misses *something* that the script does when converting
-- it to Lmod commands, so we run execute{} instead.
execute{cmd=". ${SPACK_ROOT}/share/spack/setup-env.sh", modeA={"load"}}

family("spack")
