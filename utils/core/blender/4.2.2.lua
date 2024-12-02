help([[
Blender visualisation and ray traced renderer.
Version 4.2.2 LTS

Installed: 24th Sept 2024 (s.lemaire@epcc.ed.ac.uk)
]])

load("cray-python")


local pkgNameVer = myModuleFullName()
local modbase = os.getenv("EPCC_SOFTWARE_DIR")
local base = pathJoin(modbase, "utils/core", pkgNameVer)

prepend_path("PATH", base)
