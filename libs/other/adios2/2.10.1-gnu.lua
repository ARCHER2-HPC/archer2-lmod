-- ADIOS2 preamble

family("adios2")

prereq("PrgEnv-gnu")

local location = "/work/y07/shared/libs/other/adios2/2.10.1/GNU/10.3"

-- Help section

local help1 = "ADIOS2 version 2.10.1\n"
local help2 = "For details of ADIOS2:\n"
local help3 = "https://adios2.readthedocs.io/\n"

help ( help1 .. help2 .. help3 )

prepend_path("PATH", pathJoin(location, "bin"))

pushenv("ADIOS2_ROOT", location)
