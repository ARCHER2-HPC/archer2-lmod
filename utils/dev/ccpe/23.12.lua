help([[
Containerized CPE 23.12
=======================
This module allows you to build/run a third-party code using a containerized HPE Cray Programming Environment.

Instructions for using the containerized CPE module can be found at "/work/z19/z19/shared/ccpe/23.12/ccpe-docs".
The files therein adhere to MkDocs Markdown form, so you'll need to do something like the following to view the
instructions on your local machine (you'll also need Docker).

scp -r <username>@login.archer2.ac.uk:/work/z19/z19/shared/ccpe/23.12/ccpe-docs ./
cd ccpe-docs
docker run --rm -it -p 8000:8000 -v ${PWD}:/docs squidfunk/mkdocs-material

Then, in your browser, go to "http://0.0.0.0:8000/".

   - Installed by: M. Bareford, EPCC"
   - Date: 10 Jan 2024\n"
]])


local pkgNameVer = myModuleFullName()
local pkgFullNameBase = pathJoin("/work/z19/z19/shared", pkgNameVer)

local ccpeRelease = myModuleVersion()
local ccpeImageName = "cpe_" .. ccpeRelease .. ".sif"

local ccpeHostRoot = pkgFullNameBase
local ccpeRoot = "/opt/cray/pe/craype/default"

local ccpeBindPaths = pkgFullNameBase .. "," ..
                      "/var/run/munge" .. "," ..
		      "/var/spool/slurmd/mpi_cray_shasta"

local ccpeLibPaths =  "/opt/cray/libfabric/1.12.1.2.46/lib64" .. ":/opt/cray/pe/pmi/default/lib" .. 
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
