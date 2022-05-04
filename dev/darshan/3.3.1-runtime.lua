help([[
Darshan
=======

This module provides access to the Darshan runtime. It captures IO stats for all commands/executables
run via the srun command.

Darshan is a scalable HPC I/O characterization tool. Darshan is designed to capture an accurate
picture of application I/O behavior, including properties such as patterns of access within
files, with minimum overhead.  The name is taken from a Sanskrit word for “sight” or “vision”.

  Installed by: Andy Turner, EPCC
  Date: 27 April 2022
]])


local pkgVersionBase = "/work/y07/shared/utils/core/darshan/3.3.1"
local darshanlib = pathJoin(pkgVersionBase, "lib/libdarshan.so")
prepend_path("PATH", pathJoin(pkgVersionBase, "bin"))
setenv("SRUN_EXPORT_ENV", "ALL,LD_PRELOAD=" .. darshanlib)

family("darshan")
