help([[
This module loads a tool that that will wrap Python conda and pip installs with a Singularity container
to allow using ARCHER2 for these types of applications without heavily stressing the filesystem
or incurring performance overheads when loading pPython libraries on large numbers of processes.
Once you have built a container you should just be able to use Python as normal, except you will
pickup the Python executable from the path that the container wrapper builds for you. This will
automatically run the Singularity container for you.

This program is based on the CSC container wrapper (https://github.com/CSCfi/hpc-container-wrapper)
with some tweaks to make it work on ARCHER2 (latest version of the source code is at
https://github.com/adrianjhpc/hpc-container-wrapper)

Adrian Jackson (a.jackson@epcc.ed.ac.uk), April 2024
]])

local pkgNameVer = myModuleFullName()
local base = "/work/y07/shared/utils/core/python-wrapper/hpc-container-wrapper"

prepend_path("PATH", pathJoin(base, "bin"))

family("python-wrapper")

