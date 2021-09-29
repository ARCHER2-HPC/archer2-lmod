help([[
Load ARCHER2 environment customisation
======================================

This helper module will load the EPCC environment module
This is included by the HPE Cray programming module collections
The module is not loaded directly because this helper module includes extra
logic in order to prevent this being loaded by root. The cannot be done
directly in the module collection definition

   Installed: 29 September 2021
   Installed by: Philip Cass, EPCC
]])

always_load("/work/y07/shared/archer2-modules/modulefiles-cse/epcc-setup-env")

