help([[
XIOS 2.5.r2254-ompi4-ofi-gcc11
==============================
XIOS is an XML IO Server dedicated to IO management of climate code,
see https://forge.ipsl.jussieu.fr/ioserver .

This module was built with HDF5 1.12.0, NetCDF C 4.9.0, NetCDF Fortran 4.6.0,
libXML 2.9.7, OpenMPI 4.1.4 using OFI (libfabric/1.11.0.4.71) and GCC 11.2.0 (CPE 21.09).

   - Installed by: M. Bareford, EPCC"
   - Date: 18 October 2022\n"
]])

local pkgName = myModuleName()
local pkgNameVer = myModuleFullName()
local pkgNameBase = pathJoin("/work/y07/shared/libs/dev", pkgName)
local pkgVersionBase = pathJoin("/work/y07/shared/libs/dev", pkgNameVer)

always_load("PrgEnv-gnu")

load("cpe/21.09")

unload("cray-mpich")
unload("cray-libsci")

load("openmpi/4.1.4-ofi-gcc11")
load("hdf5/1.12.0-ompi4-ofi-gcc11")
load("netcdf/fortran/4.6.0-ompi4-ofi-gcc11")
load("netcdf/c/4.9.0-ompi4-ofi-gcc11")
load("libxml2/2.9.7")

setenv("XIOS_DIR", pkgVersionBase)

prepend_path("PATH", pathJoin(pkgVersionBase, "bin"))
prepend_path("CPATH", pathJoin(pkgVersionBase, "include"))

prepend_path("LIBRARY_PATH", pathJoin(pkgVersionBase, "lib"))
prepend_path("LD_LIBRARY_PATH", pathJoin(pkgVersionBase, "lib"))
prepend_path("LD_RUN_PATH", pathJoin(pkgVersionBase, "lib"))

family("xios")
