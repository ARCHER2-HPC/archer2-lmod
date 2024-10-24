help([[
Containerized CPE 24.07
=======================
This module allows you to build/run a third-party code using a containerized HPE Cray Programming Environment.

The 24.07 release fixes two issues that were encountered by ARCHER2 users.

1. The PrgEnv-gnu-amd programming environment can now create shared libraries.
2. The Cray Fortran compiler can now compare class pointers.

Instructions for using the containerized CPE module can be found via the link below.

https://docs.archer2.ac.uk/user-guide/containers/#using-containerised-hpe-cray-programming-environments

   - Installed by: M. Bareford, EPCC"
   - Date: 04 Oct 2024\n"
]])


local pkgNameVer = myModuleFullName()
local pkgFullNameBase = pathJoin("/work/y07/shared/utils/dev", pkgNameVer)

local ccpeRelease = myModuleVersion()
local ccpeImageName = "cpe_" .. ccpeRelease .. ".sif"

local ccpeHostRoot = pkgFullNameBase
local ccpeRoot = "/opt/cray/pe/craype/default"

local ccpeBindPaths = pkgFullNameBase .. "," ..
                      "/var/run/munge" .. "," ..
		      "/var/spool/slurmd/mpi_cray_shasta"

local ccpeLibPaths =  "/opt/cray/lib64"                       .. ":/opt/cray/pe/pmi/default/lib" .. 
                     ":/opt/cray/pe/lib64"                    .. ":/opt/cray/pe/cce/default/cce/x86_64/lib" ..
                     ":/opt/cray/pe/gcc-libs"                 .. ":/usr/lib64" ..
                     ":/.singularity.d/lib"


setenv("CCPE_RELEASE", ccpeRelease)

setenv("CCPE_HOST_ROOT", ccpeHostRoot)
setenv("CCPE_ROOT", ccpeRoot)

setenv("CCPE_IMAGE_FILE", pathJoin(ccpeHostRoot, ccpeImageName))

setenv("CCPE_BIND_ARGS", ccpeBindPaths)
setenv("CCPE_LD_LIBRARY_PATH", ccpeLibPaths)


setenv("CCPE_SET_HOST_PATH", pathJoin(ccpeHostRoot, "ccpe_set_host_path.sh"))
setenv("CCPE_BUILDER", pathJoin(ccpeHostRoot, "ccpe_builder.sh"))


family("ccpe")
