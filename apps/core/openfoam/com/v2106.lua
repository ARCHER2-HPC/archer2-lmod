-- OpenFOAM v2106

help([[
OpenFOAM v2106
==============

This module provides the root of the OpenFOAM
installation for OpenFOAM v2106

See https://www.openfoam.com/news/main-news/openfoam-v2106

Once this module has been loaded you will be
to use the environment variable FOAM_INSTALL_DIR to e.g.,
$ source ${FOAM_INSTALL_DIR}/etc/bashrc

This source command will set all the apppropriate
environment variables for OpenFOAM.

Note gcc/10 is used; gcc/11.x shows compilation errors for
the main package.

Compiled: 25 April 2023 PrgEnv-gnu gcc v10.3 (Cray PE 22.12) 
Maintained by: Kevin Stratford, EPCC
]])

-- I prefer "always_load()" here as it leaves one with a PE
-- when unloaded in interactive use (rather than none).

always_load("PrgEnv-gnu")

-- FOAM_INSTALL_DIR is required.

local pkgRoot    = os.getenv("EPCC_SOFTWARE_DIR")
local pkgNameVer = myModuleFullName()
local pkgInstall = pathJoin(pkgRoot, "apps/core", pkgNameVer)

setenv("FOAM_INSTALL_DIR", pathJoin(pkgInstall, "OpenFOAM-v2106"))
