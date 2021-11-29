help([[
GCT (Globus Grid Community Toolkit) 6.2
============
This toolkit provides community-based support
for critical software packages for grid computing.
Documentation for GridFTP (covering the globus-url-copy command)
can be found via https://gridcf.org/gct-docs/6.2/gridftp/user/index.html .

Installed by: S. Booth, EPCC
Date:  29 November 2021

]])

local pkgNameVer = myModuleFullName()
local pkgVersionBase = pathJoin("/work/y07/shared/utils/core", pkgNameVer)

setenv("GCT_ROOT", pkgVersionBase)
setenv("GLOBUS_TCP_PORT_RANGE","50000:51000")

prepend_path("PATH", pathJoin(pkgVersionBase, "bin"))
prepend_path("MANPATH", pathJoin(pkgVersionBase, "share/man"))

