help([[
Darshan Runtime
==========

This module provides access to the runtime for the
Darshan IO monitoring tool.

For details of Darshan on ARCHER2 see:
https://docs.archer2.ac.uk/tools/darshan/
]])

local darshan_root = "/work/y07/shared/utils/compiler/aocc/3.0/darshan-runtime"

setenv("DARSHAN_ROOT", darshan_root)
setenv("DARSHAN_DIR", darshan_root)

setenv("SRUN_EXPORT_ENV","ALL,LD_PRELOAD=" .. darshan_root .. "/lib/libdarshan.so")

family("darshan")

