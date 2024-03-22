help([[
LAMMPS 23 August 2023 Update 2 version
====================================

This module defines the system paths and environment variables
needed to use the stable build of LAMMPS v. 23 August 2023 Update 2
with python support (as a virtual environment).
Once the module is loaded the executable will be available as 'lmp',
and the python package as 'lammps'.
If you wish to use lammps' python wrappers with your own virtual
environment, you can use this module's as a starting point, or
compile lammps from scratch by following the instructions at:
https://github.com/hpc-uk/build-instructions/blob/main/apps/LAMMPS/ARCHER2_2023-09-23_cpe2212.md

  Installed by: R. Apóstolo, EPCC
  Date: 09 January 2024

Use `man lmp` after loading this module for more help with LAMMPS.
]])

family("lammpspython")
depends_on("cray-python")
depends_on("lammps/15Dec2023")

LmodMessage(myModuleName())
LmodMessage(myModuleFullName())
local pkgNameVer = myModuleFullName()
local base = pathJoin("/work/y07/shared/apps/core", pkgNameVer)

prepend_path("LD_PRELOAD", "/opt/cray/pe/lib64/libsci_cray_mp.so.5")

pushenv("SLURM_CPU_FREQ_REQ","2250000")

--changing $PS1 -- PS1 needs to be set, not inherited from /etc/bashrc or similar
--https://github.com/TACC/Lmod/issues/545
if (not os.getenv("PS1")) then
     setenv("PS1","\\[$(ppwd)\\]\\u@\\h:\\w> ")
end
local old_ps1 = os.getenv("PS1")
pushenv("PS1", "(lammps-python-15-Dec-2023) " .. old_ps1)

--only introduced in lmod 8.6:
--source_sh("bash", "/work/y07/shared/apps/core/lammps/15Dec2023/venv/bin/activate")
--instead, used: $LMOD_DIR/sh_to_modulefile --cleanEnv /work/y07/shared/apps/core/lammps/15Dec2023/venv/lammps-python-15-Dec-2023/bin/activate >> 15Dec2023+python.lua
prepend_path("PATH","/work/y07/shared/apps/core/lammps/15Dec2023/venv/lammps-python-15-Dec-2023/bin")
setenv("VIRTUAL_ENV","/work/y07/shared/apps/core/lammps/15Dec2023/venv/lammps-python-15-Dec-2023")
