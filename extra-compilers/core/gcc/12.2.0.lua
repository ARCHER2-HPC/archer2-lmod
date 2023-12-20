--[[

    file gcc module

    Certain components, files or programs contained within this package or product are
    Copyright -2021 Hewlett Packard Enterprise Development LP

]]--


-- reasons to keep module from continuing --


family("compiler")
conflict("gcc-cross-aarch64")
conflict("gcc-mixed")


-- local vars: define & assign --


-- template variables ----------------------------------------------------------
local MOD_LEVEL               = "12.2.0"
local INSTALL_ROOT            = "/opt/cray/pe/"
local GCC_INSTALL_ROOT        = "/opt/cray/pe/"
local LMOD_DIR                = "gnu"
local COMPAT_VERSION          = "8.0"
--------------------------------------------------------------------------------

local PE_DIR                  = GCC_INSTALL_ROOT .. "gcc" .. "/" .. MOD_LEVEL

local MODULEPATH              = os.getenv("MODULEPATH") or ""

local LMOD_TEST_PREFIX        = os.getenv("LMOD_TEST_PREFIX") or ""
local GCC_MOD_LIB_PATH        = LMOD_TEST_PREFIX .. INSTALL_ROOT .. "lmod/modulefiles/compiler/" .. LMOD_DIR .. "/" .. COMPAT_VERSION
local MIX_COMPILERS_MOD_PATH  = LMOD_TEST_PREFIX .. INSTALL_ROOT .. "lmod/modulefiles/mix_compilers"

local SCRIPT_NAME             = "lmodHierarchy.lua"
local SCRIPT_PATH             = LMOD_TEST_PREFIX .. INSTALL_ROOT .. "lmod_scripts/default/scripts/" .. SCRIPT_NAME
local CRAY_COM_LOAD_VALUE     = LMOD_DIR .. "/" .. COMPAT_VERSION

-- module release info variables
local REL_FILE                = PE_DIR .. "/release_info"
local rel_info                = ""
if isFile(REL_FILE) then
    local f = io.open(REL_FILE, "r")
    local data = f:read("*all")
    f:close()
    if data ~= nil then rel_info = data end
end


-- standard Lmod functions --


help ([[

]] .. rel_info .. "\n" .. [[

===================================================================
To re-display ]] .. "gcc" .. "/" .. MOD_LEVEL .. [[ release information,
type:    less ]] .. REL_FILE .. "\n" .. [[
===================================================================

]])

whatis("Defines the system paths and environment " ..
       "variables needed for the GNU Compiling Environment.")


-- local functions --


--[[

    get_lua_script
    Load a script to gain access to its content. If not able to load
    this function will prevent the module from loading via a LmodError

    param  mod
            name that the system path uses for the module. sometimes
            the name is the module's full name or a nickname.

    param  script_path
            path to the script file this function will load

    return lua code chunk: the chunk may be either a function or
            table of functions.

]]--
function get_lua_script(mod, script_path)
    local chunk, err_msg = loadfile (script_path)
    -- chunk is nil and err exists if file did not load
    if not chunk and mode() == "load" then
        LmodError("\n\nUnable to load " .. tostring(mod) ..
                  " module. Please contact your system administrator.\n" ..
                  "\n\nError Message: " .. tostring(err_msg) .. "\n")
    end
    return chunk()
end


-- environment modifications --


prepend_path (    "MODULEPATH",            GCC_MOD_LIB_PATH                )
prepend_path (    "MODULEPATH",            MIX_COMPILERS_MOD_PATH          )
prepend_path (    "PATH",                  PE_DIR .. "/bin"                )
prepend_path (    "MANPATH",               PE_DIR .. "/snos/share/man"     )
prepend_path (    "INFOPATH",              PE_DIR .. "/snos/share/info"    )
prepend_path (    "LD_LIBRARY_PATH",       PE_DIR .. "/snos/lib64"         )
prepend_path (    "PKG_CONFIG_PATH",       PE_DIR .. "/snos/lib/pkgconfig" )

setenv       (    "GCC_PATH",              PE_DIR                          )
setenv       (    "GCC_PREFIX",            PE_DIR                          )
setenv       (    "GCC_VERSION",           MOD_LEVEL                       )
setenv       (    "GNU_VERSION",           MOD_LEVEL                       )

setenv       (    "CRAY_LMOD_COMPILER",    CRAY_COM_LOAD_VALUE             )


-- add paths to Lmod hierarchy --


local lmodHierarchy = get_lua_script(myModuleName(), SCRIPT_PATH)
-- add comnet path if network module loaded.
-- note: only call handshake functions after CRAY_LMOD_COMPILER has been set
lmodHierarchy.handshake_comnet(LMOD_TEST_PREFIX .. INSTALL_ROOT)
lmodHierarchy.handshake_comcpu(LMOD_TEST_PREFIX .. INSTALL_ROOT)
lmodHierarchy.handshake_cncm(LMOD_TEST_PREFIX .. INSTALL_ROOT)
-- add user defined path if it exists
lmodHierarchy.get_user_custom_path("COMPILER", CRAY_COM_LOAD_VALUE)

-- ----------------------------------------------------------------------------
-- !! keep last !!
-- this code must be placed after any path changes
-- ----------------------------------------------------------------------------

-- Conflict with PrgEnv-* modules that do not support this compiler
-- If block logic doesn't require updating for any new PRGENV-* modules added in future
if os.getenv("LMOD_FAMILY_PRGENV") ~= nil then
    if (not isloaded("PrgEnv-gnu")) then
        load("PrgEnv-gnu")
    end
end
