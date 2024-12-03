help([[
VisiData
========

VisiData is an interactive multitool for tabular data.
It combines the clarity of a spreadsheet, the efficiency
of the terminal, and the power of Python, into a
lightweight utility which can handle millions of rows with ease.

  Installed by: Andy Turner, EPCC
  Date: 4 October 2020
]])

always_load("cray-python")

local modbase = os.getenv("EPCC_SOFTWARE_DIR") or "/work/y07/shared"

local pkgNameVer = myModuleFullName()
local pkgVersionBase = pathJoin(modbase, "utils/core", pkgNameVer)

prepend_path("PATH", pathJoin(pkgVersionBase, "bin"))
prepend_path("PYTHONPATH", pathJoin(pkgVersionBase, "lib/python3.8/site-packages"))
prepend_path("MANPATH", pathJoin(pkgVersionBase, "lib/python3.8/site-packages"))

family("visidata")
