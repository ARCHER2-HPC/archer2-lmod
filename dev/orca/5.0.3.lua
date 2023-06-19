help([[
ORAC 5.0.3
==========

ORCA is an ab initio quantum chemistry program package that contains modern electronic structure methods including density functional theory, many-body perturbation, coupled cluster, multireference methods, and semi-empirical quantum chemistry methods. Its main field of application is larger molecules, transition metal complexes, and their spectroscopic properties. ORCA is developed in the research group of Frank Neese. The free version is available only for academic use at academic institutions.

   - Installed by: A. Turner, EPCC"
   - Date: 4 January 2023"
]])

local pmiLibPath = "/usr/lib64"
local ompi_dir = "/work/y07/shared/libs/dev/openmpi/4.1.4-ofi-gcc11"
local orcadir = "/work/y07/shared/apps/core/orca/5.0.3"

setenv("OPENMPI_DIR", ompi_dir)

prepend_path("PATH", pathJoin(ompi_dir, "bin"))

append_path("LIBRARY_PATH", pmiLibPath)
append_path("LD_LIBRARY_PATH", pmiLibPath)
append_path("LD_RUN_PATH", pmiLibPath)

prepend_path("LIBRARY_PATH", pathJoin(ompi_dir, "lib"))
prepend_path("LD_LIBRARY_PATH", pathJoin(ompi_dir, "lib"))
prepend_path("LD_RUN_PATH", pathJoin(ompi_dir, "lib"))

setenv("ORCADIR", orcadir)

prepend_path("PATH", orcadir)
prepend_path("LD_LIBRARY_PATH", orcadir)

family("orca")
