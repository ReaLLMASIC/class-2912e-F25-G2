# Read standard cells and (optionally) macros as blackbox inputs
# Use ABC_LIB_FILES if provided to avoid pulling in macro timing models
# during technology mapping. Otherwise read LIB_FILES.
set lib_list $::env(LIB_FILES)
if { [env_var_exists_and_non_empty ABC_LIB_FILES] } {
  set lib_list $::env(ABC_LIB_FILES)
}

read_liberty -overwrite -setattr liberty_cell -lib {*}$lib_list
read_liberty -overwrite -setattr liberty_cell \
  -unit_delay -wb -ignore_miss_func -ignore_buses {*}$lib_list
