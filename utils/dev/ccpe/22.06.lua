help([[
Containerized CPE 22.06
=======================
This module allows you to build/run a third-party code using a containerized HPE Cray Programming Environment.

The containerized environment can be modified to access the host libfabric and/or host PMI libraries.
For further details, see https://github.com/mbareford/archer2-docs/blob/mbareford/ccpe/docs/user-guide/dev-environment.md .

   - Installed by: M. Bareford, EPCC"
   - Date: 2 November 2022\n"
]])


local pkgName = myModuleName()
local pkgNameVer = myModuleFullName()
local pkgNameBase = pathJoin("/work/y07/shared/utils/dev", pkgName)
--local pkgVersionBase = pathJoin("/work/y07/shared/utils/dev", pkgNameVer)
local pkgVersionBase = pathJoin("/work/z19/z19/shared", pkgNameVer)

local ccpeRelease = myModuleVersion()
local ccpeReleaseDate = "061622"
local ccpeVersion = "2.7.9"

local ccpeImageName = "cray_hpe_cpe_" .. ccpeRelease .. "-" .. ccpeReleaseDate .. ".sif"

local ccpeHostRoot = pkgVersionBase
local ccpeRoot = pathJoin("/opt/cray/pe/craype", ccpeVersion)

local ccpeHostLicenceData = pathJoin(ccpeHostRoot, "licence/data")
local ccpeAutoPassLic = pathJoin(ccpeRoot, "AutoPass/Lic")
local ccpeAutoPassData = pathJoin(ccpeRoot, "AutoPass/data")

local ccpeBindPaths = ccpeHostRoot .. ":" .. ccpeAutoPassLic .. "," ..
                      ccpeHostLicenceData .. ":" .. ccpeAutoPassData .. "," ..
                      ccpeHostRoot .. "," .. "/var/spool/slurmd/mpi_cray_shasta"

local ccpeLibPaths =  "/opt/cray/libfabric/1.11.0.4.116/lib64" .. ":/opt/cray/pe/pmi/6.0.17/lib" .. 
                     ":/opt/cray/pe/lib64"                     .. ":/opt/cray/pe/cce/14.0.1/cce/x86_64/lib" ..
                     ":/opt/cray/pe/gcc-libs"                  .. ":/usr/lib64" ..
                     ":/.singularity.d/lib"


setenv("CCPE_RELEASE", ccpeRelease)
setenv("CCPE_RELEASE_DATE", ccpeReleaseDate)
setenv("CCPE_VERSION", ccpeVersion)

setenv("CCPE_HOST_ROOT", ccpeHostRoot)
setenv("CCPE_ROOT", ccpeRoot)

setenv("CCPE_IMAGE_FILE", pathJoin(ccpeHostRoot, ccpeImageName))

setenv("CCPE_BIND_ARGS", ccpeBindPaths)
setenv("CCPE_LD_LIBRARY_PATH", ccpeLibPaths)


setenv("CCPE_SET_HOST_PATH", pathJoin(ccpeHostRoot, "ccpe_set_host_path.sh"))
setenv("CCPE_BUILDER", pathJoin(ccpeHostRoot, "ccpe_builder.sh"))


family("ccpe")
