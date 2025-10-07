export DESIGN_NICKNAME = riscv32i
export DESIGN_NAME = riscv
export PLATFORM    = gf180mcuD

export VERILOG_FILES = $(sort $(wildcard $(DESIGN_HOME)/src/$(DESIGN_NICKNAME)/*.v))
export SDC_FILE      = $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NICKNAME)/constraint.sdc

export CORE_UTILIZATION = 45
export PLACE_DENSITY_LB_ADDON = 0.2
export TNS_END_PERCENT = 100
export SKIP_GATE_CLONING  = 1
export PLACE_PINS_ARGS    = -min_distance 5
export IO_CONSTRAINTS     = $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NICKNAME)/io.tcl

export KLAYOUT_DRC_FILE = $(PLATFORM_DIR)/libs.tech/klayout/macros/gf180mcu_drc.lydrc

