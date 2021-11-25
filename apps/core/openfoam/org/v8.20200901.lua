-- OpenFOAM v8 patch release 2020 Sept 1st

help([[
OpenFOAM v8 (patch release 1st Sept 2020) 
=========================================

This module provides the root of the OpenFOAM
installation for OpenFOAM v8

See https://openfoam.org/news/v8-patch/

Once this module has been loaded you will be
to use the environment variable FOAM_INST_DIR to e.g.,
$ source ${FOAM_INSTALL_DIR}/etc/bashrc

This source command will set all the apppropriate
environment variables for OpenFOAM.

Compiled: 7 October 2021 PrgEnv-gnu gcc v11.2 (Cray PE 21.09) 
Maintained by: Kevin Stratford, EPCC
]])

-- I prefer "always_load()" here as it leaves one with a PE
-- when unloaded in interactive use (rather than none).

always_load("PrgEnv-gnu")

-- FOAM_INSTALL_DIR is required.

local pkgNameVer = myModuleFullName()
local pkgInstall = pathJoin("/work/y07/shared/apps/core", pkgNameVer)

setenv("FOAM_INSTALL_DIR", pathJoin(pkgInstall, "OpenFOAM-8"))
