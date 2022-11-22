help([[
MPICH 4.0.2
===========
The MPICH Project is an open source Message Passing Interface implementation that is developed and maintained by a consortium
of academic, research, and industry partners, see https://www.mpich.org/ .

Please note, this module should not be loaded at the same time as cray-mpich or any module linked to cray-mpich such as cray-libsci,
cray-hdf5-parallel, cray-netcdf-hdf5parallel, etc.

The MPICH 4.0.2 libraries were been built using GCC 11.2.0 (CPE 21.09) and OFI (libfabric/1.11.0.4.71). 
Build instructions: https://github.com/hpc-uk/build-instructions/blob/main/libs/mpich/build_mpich_4.0.2_archer2_gcc11.md

   - Installed by: M. Bareford, EPCC"
   - Date: 4 November 2022\n"
]])

local pkgName = myModuleName()
local pkgNameVer = myModuleFullName()
local pkgNameBase = pathJoin("/work/y07/shared/libs/dev", pkgName)
local pkgVersionBase = pathJoin("/work/y07/shared/libs/dev", pkgNameVer)

local pmiLibPath = "/opt/cray/pe/pmi/6.0.13/lib"

setenv("MPICH_DIR", pkgVersionBase)

prepend_path("PATH", pathJoin(pkgVersionBase, "bin"))
prepend_path("CPATH", pathJoin(pkgVersionBase, "include"))
prepend_path("MANPATH", pathJoin(pkgVersionBase, "share/man"))

prepend_path("LIBRARY_PATH", pmiLibPath)
prepend_path("LD_LIBRARY_PATH", pmiLibPath)
prepend_path("LD_RUN_PATH", pmiLibPath)

prepend_path("LIBRARY_PATH", pathJoin(pkgVersionBase, "lib"))
prepend_path("LD_LIBRARY_PATH", pathJoin(pkgVersionBase, "lib"))
prepend_path("LD_RUN_PATH", pathJoin(pkgVersionBase, "lib"))

prepend_path("PKG_CONFIG_PATH", pathJoin(pkgVersionBase, "lib/pkgconfig"))

family("mpich")
