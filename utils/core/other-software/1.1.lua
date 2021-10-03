help([[
Access externally-provided software
===================================

This module enables access to software installed on ARCHER2
by external parties. The ARCHER2 service desk does not provide
support for these software packages.

  Installed: 4 October 2021"
  Installed by: Andy Turner, EPCC"
]])

prepend_path("MODULEPATH", "/work/y07/shared/archer2-lmod/other/core")
prepend_path("MODULEPATH", "/work/c01/shared/modulefiles"))

LmodMessage([[

Warning: You have enabled access to software packages installed
by external parties on ARCHER2 or those that are not fully-supported.
The ARCHER2 CSE service does not test these packages. The service desk
will make reasonable efforts to assist with questions on the use of
these packages but some issues may not be able to be resolved by the
service and they may direct you to seek help from external parties.

]])

