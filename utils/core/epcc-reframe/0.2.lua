prereq("reframe")

local base="/work/y07/shared/utils/core/epcc-reframe"

prepend_path("PATH", pathJoin(base, "bin"))
setenv("EPCC_REFRAME_CONFIG", pathJoin(base, "configuration/archer2-tds_settings.py"))
setenv("EPCC_REFRAME_TEST_DIR", pathJoin(base, "tests"))

family("epcc_reframe")
