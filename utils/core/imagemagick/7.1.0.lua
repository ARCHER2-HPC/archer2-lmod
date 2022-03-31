help([[
ImageMagick image package 7.1.0
===============================

Use ImageMagick to create, edit, compose, or convert digital
images. It can read and write images in a variety of formats (over
200) including PNG, JPEG, GIF, WebP, HEIC, SVG, PDF, DPX, EXR and
TIFF. ImageMagick can resize, flip, mirror, rotate, distort, shear and
transform images, adjust image colors, apply various special effects,
or draw text, lines, polygons, ellipses and Bezier curves.

Installed by: D. Henty, EPCC
Date: 31 Mar 2022
]])

local pkgNameVer = myModuleFullName()
local base = pathJoin("/work/y07/shared/utils/core", pkgNameVer)

prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))
prepend_path("INCLUDE_PATH", pathJoin(base, "include"))
prepend_path("MANPATH", pathJoin(base, "share/man"))
