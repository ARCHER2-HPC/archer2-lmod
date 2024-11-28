-- OpenFOAM v9 patch release 2021 Sept 3rd

help([[
OpenFOAM v9 (patch release 3rd Sept 2021) 
=========================================

This module provides the root of the OpenFOAM
installation for OpenFOAM v9

See https://openfoam.org/news/v9-patch/

Once this module has been loaded you will be
to use the environment variable FOAM_INSTALL_DIR to e.g.,
$ source ${FOAM_INSTALL_DIR}/etc/bashrc

This source command will set all the apppropriate
environment variables for OpenFOAM.

Compiled: 25 April 2023 PrgEnv-gnu gcc v11.2 (Cray PE 22.12) 
Maintained by: Kevin Stratford, EPCC
]])

-- I prefer "always_load()" here as it leaves one with a PE
-- when unloaded in interactive use (rather than none).

always_load("PrgEnv-gnu")

-- FOAM_INSTALL_DIR is required.

local pkgRoot    = os.getenv("EPCC_SOFTWARE_DIR")
local pkgNameVer = myModuleFullName()
local pkgInstall = pathJoin(pkgRoot, "apps/core", pkgNameVer)

setenv("FOAM_INSTALL_DIR", pathJoin(pkgInstall, "OpenFOAM-9"))
