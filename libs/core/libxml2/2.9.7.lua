-- libxml2 preamble
-- There's a minor niggle here that libxml2 wants to produce a
-- pkgconfig file "libxml-2.0.pc" rather than "libxml2.pc"

family("libxml2")
prereq_any("PrgEnv-cray", "PrgEnv-gnu", "PrgEnv-aocc")

-- This is introspection; may want to set explicitly.

local productName = myModuleName()
local productLevel = myModuleVersion()

-- Help section

local help1 = "libxml version " .. productLevel .. "\n"
local help2 = "Sets PATH and MANPATH for libxml2\n"
local help3 = "Sets installsation root to LIBXML2_DIR\n"
local help4 = "... and integrates with compiler wrappers cc etc\n"

help ( help1 .. help2 .. help3 .. help4)


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
-- which must correspond to   /work/y07/shared/archer2-lmod/core
-- the last two parts of which are returned by hierarchy()

function epccSharedRoot()

  local fullPath = myFileName()

  local i, j = string.find(fullPath, "/" .. "archer2-lmod", 1, true)
  local sharedRoot = pathJoin(string.sub(fullPath, 1, i-1), "libs/core")

  return sharedRoot

end

-- Begin (more-or-less) generic section
-- At this point we must have:
--   productName                e.g., "metis"
--   productLevel               e.g., "5.1.0" (a.ka. "version")

-- To which we add:
--   sharedRoot                  e.g. "/work/y07/shared/libs/core"
--   PE_PRODUCT                  e.g., "PE_METIS" as a convenience

local sharedRoot = epccSharedRoot()
local PE_PRODUCT = "PE_" .. string.upper(productName)

-- Cray integration via pkgconfig
-- Compiler environment and currently loaded compiler version

local compilerEnv = epccCompilerEnv()
local compilerVersion = epccCompilerVersion()

setenv(PE_PRODUCT .. "_MODULE_NAME",    productName)
setenv(PE_PRODUCT .. "_PKGCONFIG_LIBS", "libxml-2.0")
setenv(PE_PRODUCT .. "_FIXED_PRGENV",   compilerEnv)

prepend_path("PE_PKGCONFIG_LIBS", "libxml-2.0")
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

  -- pkgconfig location

  local pkgconfig = pathJoin(productPath, "lib/pkgconfig")
  prepend_path("PE_" .. compilerEnv .. "_FIXED_PKGCONFIG_PATH", pkgconfig)

  -- bin is required, man is available

  prepend_path("PATH",    pathJoin(productPath, "bin"))
  prepend_path("MANPATH", pathJoin(productPath, "share", "man"))

end

