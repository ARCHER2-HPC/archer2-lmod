help([[
MESA 21.0.1

MESA is an open-source implementation of OpenGL, Vulkan, and other graphics API to vendor-specific hardware drivers.

Once this module has been loaded, you can include the header files located in /work/y07/shared/libs/core/mesa/21.0.1 in your programs.

Maintained by Rui Apóstolo, EPCC
Date: 14 June 2023
]])

local pkgNameVer = myModuleFullName()
local base = pathJoin("/work/y07/shared/libs/core", pkgNameVer)

prepend_path("CPATH", pathJoin(base, "include"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib64"))

family("mesa")
