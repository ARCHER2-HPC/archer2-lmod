help([[
Gromacs-CP2K QM/MM interface
=====================
This module sets up your environment to access gromacs-cp2k
interface v2021.1-plumed
Once the module is loaded the gmx_cp2k
executable will be available

  - Installed by H. Judge, EPCC
  - Date: 15 April 2021
  - Modified by S. Farr, EPCC
  - Date: 7 Dec 2021

]])


local pkgName = myModuleName()
local pkgNameVer = myModuleFullName()
local pkgNameBase = pathJoin("/work/y07/shared/apps/core", pkgName)
local pkgVersionBase = pathJoin("/work/y07/shared/apps/core", pkgNameVer)

prepend_path("PATH", pathJoin(pkgVersionBase, "/bin"))

setenv("GMXLIB", pathJoin(pkgVersionBase, "/share/top"))
setenv("CP2K_DATA_DIR", "/work/y07/shared/apps/core/cp2k/cp2k-8.1/data")

family("gromacs")
