help([[
HDF5 1.12.0-ompi4-ofi-gcc11
===========================
HDF5 is a parallel IO library, see https://www.hdfgroup.org/ .

This module was built with OpenMPI 4.1.4 using OFI (libfabric/1.11.0.4.71) and GCC 11.2.0 (CPE 21.09).

   - Installed by: M. Bareford, EPCC"
   - Date: 18 October 2022\n"
]])

local pkgName = myModuleName()
local pkgNameVer = myModuleFullName()
local pkgNameBase = pathJoin("/work/y07/shared/libs/dev", pkgName)
local pkgVersionBase = pathJoin("/work/y07/shared/libs/dev", pkgNameVer)

setenv("HDF5_DIR", pkgVersionBase)

prepend_path("PATH", pathJoin(pkgVersionBase, "bin"))
prepend_path("CPATH", pathJoin(pkgVersionBase, "include"))

prepend_path("LIBRARY_PATH", pathJoin(pkgVersionBase, "lib"))
prepend_path("LD_LIBRARY_PATH", pathJoin(pkgVersionBase, "lib"))
prepend_path("LD_RUN_PATH", pathJoin(pkgVersionBase, "lib"))

family("hdf5")
