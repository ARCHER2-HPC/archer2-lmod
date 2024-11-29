help([[
cp2k-2024.1
===========
This module sets up your environment to access a central install of CP2K 2024.1
built with the following libraries:

mkl
libint
fftw3
libxc
libgrpp
elpa
cosma
libxsmm
plumed2
spglib
sirius
libvori
libbqb
libvdwxc
hdf5

All libraries were built using the CP2K toolchain as follows:

module load PrgEnv-gnu
module load mkl
module load cray-fftw

install_cp2k_toolchain.sh --enable-cray --with-mkl=system --with-plumed

The local.psmp arch file thus generated by the CP2K toolchain was used
without further alteration and with the same modules loaded to compile CP2K.

WARNING: loading this module automatically sources an environment setup script generated by CP2K's installation toolchain.
Changes to your environment from this setup script will persist after you unload the module. 

The following is a complete list of the exact environment modules loaded
during the build for this install:

craype-x86-rome
libfabric/1.12.1.2.2.0.0
craype-network-ofi
perftools-base/22.12.0
xpmem/2.5.2-2.4_3.30__gd0f7936.shasta
bolt/0.8
epcc-setup-env
load-epcc-module
gcc/11.2.0
craype/2.7.19
cray-dsmml/0.2.2
cray-mpich/8.1.23
PrgEnv-gnu/8.3.3
mkl/2023.0.0
cray-fftw/3.3.10.3

   - Installed by: A. Proeme, EPCC"
   - Date: 5 September 2024\n"
]])

load("PrgEnv-gnu/8.3.3")
load("mkl/2023.0.0")
load("cray-fftw/3.3.10.3")

local modbase = os.getenv("EPCC_SOFTWARE_DIR") or "/work/y07/shared"

local pkgNameVer = myModuleFullName()
local buildVariant = "toolchain_cray_default+mkl+plumed"
local pkgVersionBase = pathJoin(modbase, "apps/core", pkgNameVer, buildVariant)

setenv("CP2K_DIR", pkgVersionBase)

prepend_path("PATH", pathJoin(pkgVersionBase,  "/exe/local"))

family("cp2k")

--
-- Sourcing the CP2K toolchain install setup script 
-- ------------------------------------------------
-- The setup script was sourced before compiling CP2K and should be
-- sourced before running. Using source_sh() or $LMOD_DIR/sh_to_modulefile
-- didn't work so using execute{} instead. Unfortunately this means that
-- unload this module doesn't revert a user's environment back to what it
-- was before: definitions of environment variables 
--

if (mode() == "load") then
  print("echo 'Sourcing '" .. pathJoin(pkgVersionBase, "/tools/toolchain/install/setup"))
  print("echo \n")
  print("echo 'Note: modifications to your environment from the CP2K toolchain setup script will persist after you unload this module'") 
  print("source " .. pathJoin(pkgVersionBase, "/tools/toolchain/install/setup"))
  print("echo \n")
end

