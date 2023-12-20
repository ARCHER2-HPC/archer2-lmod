help([[

Extra compilers
===============

This module enables access to additional compilers installed on ARCHER2.
These compilers may be experimental and could have known bugs. Users 
are advised to use them with care and carefully check output from software
compiled using these compilers to ensure that is is correct.

        Installed: 23 November 2023
        Installed by: Andy Turner, EPCC

]])


LmodMessage([[

Warning: You have enabled access to additional compilers installed on
ARCHER2. These compilers may be experimental and could have known bugs. Users 
are advised to use them with care and carefully check output from software
compiled using these compilers to ensure that is is correct.

]])

prepend_path("MODULEPATH", "/work/y07/shared/archer2-lmod/extra-compilers/core")
 
