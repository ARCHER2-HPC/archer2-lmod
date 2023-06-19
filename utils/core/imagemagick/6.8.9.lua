help([[
ImageMagick image package 6.8.9
===============================

Use ImageMagick to create, edit, compose, or convert digital
images. It can read and write images in a variety of formats (over
200) including PNG, JPEG, GIF, WebP, HEIC, SVG, PDF, DPX, EXR and
TIFF. ImageMagick can resize, flip, mirror, rotate, distort, shear and
transform images, adjust image colors, apply various special effects,
or draw text, lines, polygons, ellipses and Bezier curves.

Note that this version is run via a Singularity container, although
this should be invisible to the user.

Installed by: D. Henty, EPCC
Date: 03 May 2023
]])

local pkgNameVer = myModuleFullName()
local base = pathJoin("/work/y07/shared/utils/core", pkgNameVer)

prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))
prepend_path("INCLUDE_PATH", pathJoin(base, "include"))
prepend_path("MANPATH", pathJoin(base, "share/man"))
