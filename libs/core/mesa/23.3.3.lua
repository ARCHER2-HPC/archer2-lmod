help([[
Mesa 23.3.3

Mesa is an open-source implementation of OpenGL, Vulkan, and other graphics API to vendor-specific hardware drivers.
See https://www.mesa3d.org for further details.

Maintained by Michael Bareford, EPCC
Date: 23 January 2024
]])

local pkgNameVer = myModuleFullName()
local base = pathJoin("/work/y07/shared/libs/core", pkgNameVer)

prepend_path("CPATH", pathJoin(base, "include"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib64"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "llvm/lib"))

family("mesa")
