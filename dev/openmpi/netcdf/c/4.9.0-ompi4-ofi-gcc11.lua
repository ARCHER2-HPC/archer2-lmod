help([[
NETCDF C 4.9.0-ompi4-ofi-gcc11
==============================
NETCDF is a parallel IO library, see https://www.unidata.ucar.edu/software/netcdf/ .

This module was built with OpenMPI 4.1.4 using OFI (libfabric/1.11.0.4.71) and GCC 11.2.0 (CPE 21.09).

   - Installed by: M. Bareford, EPCC"
   - Date: 18 October 2022\n"
]])

local pkgName = myModuleName()
local pkgNameVer = myModuleFullName()
local pkgNameBase = pathJoin("/work/y07/shared/libs/dev", pkgName)
local pkgVersionBase = pathJoin("/work/y07/shared/libs/dev", pkgNameVer)

setenv("NETCDF_C_DIR", pkgVersionBase)

prepend_path("PATH", pathJoin(pkgVersionBase, "bin"))
prepend_path("CPATH", pathJoin(pkgVersionBase, "include"))
prepend_path("MANPATH", pathJoin(pkgVersionBase, "share/man"))

prepend_path("LIBRARY_PATH", pathJoin(pkgVersionBase, "lib"))
prepend_path("LD_LIBRARY_PATH", pathJoin(pkgVersionBase, "lib"))
prepend_path("LD_RUN_PATH", pathJoin(pkgVersionBase, "lib"))

prepend_path("PKG_CONFIG_PATH", pathJoin(pkgVersionBase, "lib/pkgconfig"))
