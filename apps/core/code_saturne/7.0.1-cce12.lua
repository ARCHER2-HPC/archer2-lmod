help([[
Code_Saturne 7.0.1
==================

This module defines the system paths and environment variables
needed to use the Code_Saturne 7.0.1 CCE 12.0.3 build. Once the
module is loaded the executable will be available as 'code_saturne'.

  Installed by: W. Lucas, EPCC
  Date: 7 October 2021
]])

local pkgNameVer = myModuleFullName()
local base = pathJoin("/work/y07/shared/apps/core", pkgNameVer)

prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("PYTHONPATH", pathJoin(base, "lib/python3.9/site-packages"))
prepend_path("PYTHONPATH", pathJoin(base, "lib/python3.9/site-packages/code_saturne"))
prepend_path("MANPATH", pathJoin(base, "share/man"))

setenv("CODE_SATURNE_DIR", base)
setenv("CODE_SATURNE_INC", pathJoin(base, "inc"))
setenv("CODE_SATURNE_LIB", pathJoin(base, "lib"))

family("code_saturne")
