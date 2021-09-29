help([[
bolt"
====\n"
This module sets up your environment to access 
the 'bolt' job submission script generation tool.
Once loaded, use the command 'bolt -h' to list
the options.

  * Installed by: A. Turner, EPCC"
  * Date: 29 Septemeber 2021\n"
]])

local base = "/work/y07/shared/bolt/0.7"

setenv("BOLT_DIR", base)
prepend_path("PYTHONPATH", pathJoin(base, "modules")
prepend_path("PATH", pathJoin(base, "bin")

