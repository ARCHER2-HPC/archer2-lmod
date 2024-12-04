help([[
Quantum Esspresso 7.3.1
=======================

This module sets up your environment to access Quantum Esspresso
7.3.1. Once loaded you can access MPI-enabled Quantum Esspresso
executables using the usual commands.

   Installed by: E. Broadway, EPCC
   Installation date: 26th June 2024
]])

local modbase = os.getenv("EPCC_SOFTWARE_DIR") or "/work/y07/shared"
local base = pathJoin(modbase, "apps/core")

local pkgName = myModuleName()
local pkgNameVer = myModuleFullName()
local pkgNameBase = pathJoin(base, pkgName)
local pkgVersionBase = pathJoin(base, pkgNameVer)

load("PrgEnv-gnu")
load("cray-fftw")
load("cray-hdf5-parallel") 

prepend_path("PATH", pathJoin(pkgVersionBase, "bin"))
family("quantum_espresso")
