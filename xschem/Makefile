


ifeq ($(TT_PROJECT_NAME),)
PROJECT_NAME ?= tt_um_cas_sensor_project
else
PROJECT_NAME := $(TT_PROJECT_NAME)
endif

SIM_DIR := simulation
TESTSBENCHES := $(wildcard tb_$(PROJECT_NAME)_*.sch)

.PHONY: xschem clean netlist_lvs

info:
	@echo "Possible commands:"
	@echo "  xschem      - Run xschem with the project .sch file"
	@echo "  testbench   - Run xschem with all the tb_{project}_xxx files"
	@echo "  netlist_lvs - create netlist for LVS and spice import in magic"
	@echo "  sim         - runs all testbenches"
	@echo "  clean       - Clean up generated files"
	@echo ""

	@echo "Activated project: $(PROJECT_NAME)"

xschem:
	xschem $(PROJECT_NAME).sch


testbench:
	@echo "Öffne alle Testbenches..."
	xschem $(TESTSBENCHES)

$(SIM_DIR)/tb_$(PROJECT_NAME)_%.spice: tb_$(PROJECT_NAME)_%.sch
	@echo "create netlist for $<"
	xschem -q -x -b -s -n $< -o $@


netlists: $(patsubst tb_$(PROJECT_NAME)_%.sch,$(SIM_DIR)/tb_$(PROJECT_NAME)_%.spice,$(SCHEMATICS))
	@echo "Alle Netzlisten wurden erstellt."

netlist_lvs:

	@echo "create netlist for for LVS $<"
	xschem -n -s -r -x -q --tcl "set lvs_netlist 1" $(PROJECT_NAME).sch -o $(PROJECT_NAME).spice
	cp simulation/$(PROJECT_NAME).spice netlists/


clean:
	rm -f simulation/*.raw
	rm -f simulation/tb_*.spice
	rm -f simulation/*.spice
