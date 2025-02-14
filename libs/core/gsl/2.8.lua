-- GSL preamble

family("gsl")

prereq_any("PrgEnv-cray", "PrgEnv-gnu", "PrgEnv-aocc")

-- This is introspection; may want to set explicitly.

local productName = myModuleName()
local productLevel = myModuleVersion()

-- Help section

local help1 = "GSL version " .. productLevel .. "\n"
local help2 = "For details of GSL see:  \n"
local help3 = "https://www.gnu.org/software/gsl/\n\n"
local help4 = "Build instructions: https://github.com/hpc-uk/build-instructions/blob/main/libs/gsl/build_gsl_2.8_archer2.md "
help ( help1 .. help2 .. help3 .. help4 )


-- EPCC FUNCTIONS

-- Return currently loaded compiler environment (CRAYCLANG, GNU, or AOCC)

function epccCompilerEnv()

  local compiler = "NONE"
  local pe = os.getenv("PE_ENV") or "NONE"

  if (pe == "CRAY") then
    compiler = "CRAYCLANG"
  elseif (pe == "GNU")  then
    compiler = "GNU"
  elseif (pe == "AOCC") then
    compiler = "AOCC"
  else
    error("No compiler environment available")
  end

  return compiler

end

-- Return currently loaded compiler version major.minor

function epccCompilerVersion()

  local version = nil
  local pe = epccCompilerEnv()

  if (pe == "CRAYCLANG") then
    version = os.getenv("CRAY_CC_VERSION") or nil
  elseif (pe == "GNU") then
    version = os.getenv("GNU_VERSION") or nil
  elseif (pe == "AOCC") then
    version = os.getenv("CRAY_AOCC_VERSION") or nil
  end

  local _, _, major, minor, patch = string.find(version, "(%d+)%.(%d+)%.(%d+)")

  return major .. "." .. minor

end

-- For relevant product, return a list of available compiler versions
-- A sorted list of numbers is returned (may be empty), e.g.,
-- "9.3 10.2"

function epccProductAvailableVersions(productRoot)

  require("lfs")

  local pe = epccCompilerEnv()
  local vlist = {}

  for file in lfs.dir(productRoot) do
    if (lfs.attributes(productRoot .. "/" .. file, "mode") == "directory") then
      local _, _, version = string.find(file, "(%d+%.%d+)")
      if (version ~= nil) then
        table.insert(vlist, tonumber(version))
      end
    end
  end

  table.sort(vlist)

  return vlist

end

-- Find sharedRoot; typically /work/y07/shared
-- which must correspond to   /work/y07/shared/archer2-lmod/libs/core
-- the last two parts of which are returned by hierarchy()

function epccSharedRoot()

  local fullPath = myFileName()

  local i, j = string.find(fullPath, "/" .. "archer2-lmod", 1, true)
  local sharedRoot = pathJoin(string.sub(fullPath, 1, i-1), "libs/core")

  return sharedRoot

end

-- Begin (more-or-less) generic section
-- At this point we must have:
--   productName                e.g., "gsl"
--   productLevel               e.g., "2.7" (a.ka. "version")

-- To which we add:
--   sharedRoot                  e.g. "/work/y07/shared/libs/core"
--   PE_PRODUCT                  e.g., "PE_GSL" as a convenience

local sharedRoot = epccSharedRoot()
local PE_PRODUCT = "PE_" .. string.upper(productName)

-- Cray integration via pkgconfig
-- Compiler environment and currently loaded compiler version

local compilerEnv = epccCompilerEnv()
local compilerVersion = epccCompilerVersion()

setenv(PE_PRODUCT .. "_MODULE_NAME",        productName)
setenv(PE_PRODUCT .. "_CXX_PKGCONFIG_LIBS", productName)
setenv(PE_PRODUCT .. "_FIXED_PRGENV",       compilerEnv)

prepend_path("PE_CXX_PKGCONFIG_LIBS", productName)
prepend_path("PE_PKGCONFIG_PRODUCTS", PE_PRODUCT)


-- If the currently loaded compiler version is not available,
-- look for the most recent previous version...

local productRoot = pathJoin(sharedRoot, productName, productLevel)
local productRootEnv = pathJoin(productRoot, compilerEnv)

local vlist = {}
local genCompiler = nil

vlist = epccProductAvailableVersions(productRootEnv)

if (#vlist == 0) then

  -- Fail
  error("No installations available for " .. compilerEnv)

else

  -- What's the most recent version in the list <= loaded compiler

  for _, candidate in pairs(vlist) do
    if (candidate <= tonumber(compilerVersion)) then
      genCompiler = tostring(candidate)
    end
  end

end

-- Set compiler-dependent information

if (genCompiler == nil) then
  error("Package not supported in the loaded compiler version")
else
  -- OK, can now set up

  local productPath = pathJoin(productRootEnv, genCompiler)

  -- Set variables for root of installation (both "_DIR" and "_ROOT"
  -- are made available)

  prepend_path(string.upper(productName) .. "_DIR",  productPath)
  prepend_path(string.upper(productName) .. "_ROOT", productPath)

  prepend_path("LD_LIBRARY_PATH", pathJoin(productPath, "lib"))
  prepend_path("LIBRARY_PATH", pathJoin(productPath, "lib"))
  prepend_path("CPATH", pathJoin(productPath, "include"))

  -- pkgconfig location

  local pkgconfig = pathJoin(productPath, "lib/pkgconfig")
  prepend_path("PE_" .. compilerEnv .. "_FIXED_PKGCONFIG_PATH", pkgconfig)

end

