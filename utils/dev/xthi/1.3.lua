help([[
xthi
============

]])

local pkgNameVer = myModuleFullName()
local pkgVersionBase = pathJoin("/work/y07/shared/utils/core", pkgNameVer)


local pe = os.getenv("PE_ENV") or "NONE"

  if (pe == "CRAY") then
    compiler = "CRAYCLANG"

  prepend_path("PATH", pathJoin(pkgVersionBase, "/CRAYCLANG/15.0/bin"))
  prepend_path("CPATH", pathJoin(pkgVersionBase, "/CRAYCLANG/15.0/include"))
  prepend_path("LD_LIBRARY_PATH", pathJoin(pkgVersionBase, "/CRAYCLANG/15.0/lib"))
  prepend_path("LIBRARY_PATH", pathJoin(pkgVersionBase, "/CRAYCLANG/15.0/lib"))
  prepend_path("LD_RUN_PATH", pathJoin(pkgVersionBase, "/CRAYCLANG/15.0/lib"))
 
  elseif (pe == "GNU")  then
    compiler = "GNU"
  elseif (pe == "AOCC") then
    compiler = "AOCC"
  else
    error("No compiler environment available")
  end










