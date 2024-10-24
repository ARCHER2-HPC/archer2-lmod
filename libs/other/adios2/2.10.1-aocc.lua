-- ADIOS2 preamble

family("adios2")

prereq("PrgEnv-aocc")

local location = "/work/y07/shared/libs/other/adios2/2.10.1/AOCC/4.0"

-- Help section

local help1 = "ADIOS2 version 2.10.1\n"
local help2 = "For details of ADIOS2:\n"
local help3 = "https://adios2.readthedocs.io/\n"

help ( help1 .. help2 .. help3 )

prepend_path("PATH", pathJoin(location, "bin"))

pushenv("ADIOS2_ROOT", location)
