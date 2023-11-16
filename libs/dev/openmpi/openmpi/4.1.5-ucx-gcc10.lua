help([[
OpenMPI 4.1.5
=============
The Open MPI Project is an open source Message Passing Interface implementation that is developed and maintained by a consortium
of academic, research, and industry partners, see https://www.open-mpi.org/ .

Please note, this module should not be loaded at the same time as cray-mpich; in fact, loading this module will automatically
unload cray-mpich. Nevertheless, you must ensure that any modules linked to cray-mpich (e.g., cray-libsci, cray-hdf5-parallel
and cray-netcdf-hdf5parallel) are also unloaded.

This module sets "export OMPI_MCA_btl='^openib'" so as to disable the OpenIB byte transfer layer.
Having this setting allows an OpenMPI-linked code to be launched via srun/mpirun.

The OpenMPI 4.1.5 libraries were been built using GCC 10.3.0 (CPE 22.12) and UCX (cray-ucx/2.7.0-1). 

   - Installed by: M. Bareford, EPCC"
   - Date: 08 August 2023\n"
]])

unload("cray-mpich")

local pkgName = myModuleName()
local pkgNameVer = myModuleFullName()
local pkgNameBase = pathJoin("/work/y07/shared/libs/dev", pkgName)
local pkgVersionBase = pathJoin("/work/y07/shared/libs/dev", pkgNameVer)

local pmiLibPath = "/usr/lib64"

setenv("OPENMPI_DIR", pkgVersionBase)

prepend_path("PATH", pathJoin(pkgVersionBase, "bin"))
prepend_path("CPATH", pathJoin(pkgVersionBase, "include"))
prepend_path("MANPATH", pathJoin(pkgVersionBase, "share/man"))

append_path("LIBRARY_PATH", pmiLibPath)
append_path("LD_LIBRARY_PATH", pmiLibPath)
append_path("LD_RUN_PATH", pmiLibPath)

prepend_path("LIBRARY_PATH", pathJoin(pkgVersionBase, "lib"))
prepend_path("LD_LIBRARY_PATH", pathJoin(pkgVersionBase, "lib"))
prepend_path("LD_RUN_PATH", pathJoin(pkgVersionBase, "lib"))

prepend_path("PKG_CONFIG_PATH", pathJoin(pkgVersionBase, "lib/pkgconfig"))

setenv("OMPI_MCA_btl","^openib")

family("openmpi")
