help([[
Darshan
=======

This module provides access to the Darshan analysis utilities and pydarshan.

Darshan is a scalable HPC I/O characterization tool. Darshan is designed to capture an accurate
picture of application I/O behavior, including properties such as patterns of access within
files, with minimum overhead.  The name is taken from a Sanskrit word for “sight” or “vision”.

  Installed by: Andy Turner, EPCC
  Date: 27 April 2022
]])

always_load("cray-python")

local pkgVersionBase = "/work/y07/shared/utils/core/darshan/3.3.1-util"

prepend_path("PATH", pathJoin(pkgVersionBase, "bin"))

prepend_path("PYTHONPATH", pathJoin(pkgVersionBase, "lib/python3.8/site-packages"))

family("darshan")
