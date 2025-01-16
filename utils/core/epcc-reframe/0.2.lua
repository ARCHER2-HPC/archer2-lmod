prereq("reframe")


local modbase = os.getenv("EPCC_SOFTWARE_DIR") or "/work/y07/shared"

local base = pathJoin(modbase, "utils/core/epcc-reframe")

prepend_path("PATH", pathJoin(base, "bin"))
setenv("EPCC_REFRAME_CONFIG", pathJoin(base, "configuration/archer2.py"))
setenv("EPCC_REFRAME_TEST_DIR", pathJoin(base, "tests"))

family("epcc_reframe")
