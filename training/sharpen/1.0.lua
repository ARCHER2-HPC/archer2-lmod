help([[
Sharpen
=======

This module sets up your environment to access the Sharpen
program and data as used in various training courses.
Once loaded you can access the Sharpen executables using the
following names:"

  - sharpen-ser.x (Serial version)
  - sharpen-omp.x (OpenMP parallel version)
  - sharpen-mpi.x (MPI parallel version)

Input data are available in $SHARPEN_INPUT. e.g. to browse:
  cd $SHARPEN_INPUT

  Installed by: A. Turner, EPCC
  Date: 4 October 2020
]])

local pkgNameVer = myModuleFullName()
local pkgVersionBase = pathJoin("/work/y07/shared/apps/core", pkgNameVer)
 
prepend_path("PATH", pathJoin(pkgVersionBase, "bin"))
setenv("SHARPEN_INPUT", pathJoin(pkgVersionBase, "input"))

family("sharpen")
