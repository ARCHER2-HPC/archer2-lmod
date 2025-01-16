help([[

Externally-provided software
============================

This module enables access to software installed on ARCHER2
by external parties. ARCHER2 service desk does not provide support for these
software packages.

        Installed: 25 November 2021
        Installed by: Andy Turner, EPCC

]])


LmodMessage([[

Warning: You have enabled access to software packages installed
by external parties on ARCHER2 or those that are not fully-supported.
The ARCHER2 CSE service does not test these packages. The service desk
will make reasonable efforts to assist with questions on the use of
these packages but some issues may not be able to be resolved by the
service and they may direct you to seek help from external parties.

]])

local modbase = os.getenv("EPCC_SOFTWARE_DIR") or "/work/y07/shared"

-- Modules from CSE
prepend_path("MODULEPATH", pathJoin(modbase, "archer2-lmod/others/core"))
prepend_path("MODULEPATH", pathJoin(modbase, "archer2-lmod/libs/other"))

-- Modules from other sources
prepend_path("MODULEPATH", "/work/y23/shared/scalasca/modulefiles")
prepend_path("MODULEPATH", "/work/y23/shared/cpl-openfoam-lammps/modulefiles")
prepend_path("MODULEPATH", "/work/y23/shared/gcfoam/modulefiles")
