help([[
VMD 1.9.3 (parallel)
====================

VMD is a molecular visualization program for displaying,
animating, and analyzing large biomolecular systems
using 3-D graphics and built-in scripting.

See https://www.ks.uiuc.edu/Research/vmd/ .

  Installed by: M. Bareford, EPCC
  Date: 23 January 2024
]])

family("vmd")

depends_on("PrgEnv-gnu/8.3.3")
depends_on("cray-hdf5/1.12.2.1")
depends_on("cray-netcdf/4.9.0.1")

local modbase = os.getenv("EPCC_SOFTWARE_DIR") or "/work/y07/shared"
local pkgNameVer = myModuleFullName()
local base = pathJoin(modbase, "apps/core", pkgNameVer)
local tcl = pathJoin(modebase, "utils/core/tcl/8.6.13/lib")
local tk = pathJoin(modebase, "utils/core/tk/8.6.13/lib")

prepend_path("LD_LIBRARY_PATH", tcl)
prepend_path("LD_LIBRARY_PATH", tk)
prepend_path("LD_LIBRARY_PATH", pathJoin(pkgVersionBase, "lib"))

prepend_path("PATH", pathJoin(base, "bin"))
