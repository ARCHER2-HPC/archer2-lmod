help([[
Sets up the paths for Intel Math Kernel Library
]])

unload("cray-libsci")

local pkgName = myModuleName()
local pkgNameVer = myModuleFullName()
local pkgNameBase = pathJoin("/work/y07/shared/libs/core", pkgName)
local pkgVersionBase = pathJoin("/work/y07/shared/libs/core", pkgNameVer)

local arch = "intel64"
local mkl_root = pathJoin(pkgVersionBase, "compilers_and_libraries/linux/mkl")

setenv("MKLROOT", mkl_root)

prepend_path("LD_LIBRARY_PATH", pathJoin(mkl_root, "lib", arch))
prepend_path("LD_LIBRARY_PATH", pathJoin(mkl_root, "lib", arch .. "_lin"))
prepend_path("LIBRARY_PATH", pathJoin(mkl_root, "lib", arch))
prepend_path("FPATH", pathJoin(mkl_root, "include"))
prepend_path("CPATH", pathJoin(mkl_root, "include"))
prepend_path("NLSPATH", pathJoin(mkl_root, "lib", arch))
prepend_path("LD_PRELOAD", pathJoin(mkl_root, "preload/libamdmkl.so"))

family("mkl")
