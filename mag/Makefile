

# PROJECT_NAME ?= tt_um_cas_sensor_project

ifeq ($(TT_PROJECT_NAME),)
PROJECT_NAME ?= tt_um_cas_sensor_project
else
PROJECT_NAME := $(TT_PROJECT_NAME)
endif

MAGIC_RC := $(PDK_ROOT)/sky130A/libs.tech/magic/sky130A.magicrc
TEMPLATE_FILE := tt_analog_2x2_3v3.def

.PHONY: lvs magic info sim

info:
	@echo "Possible commands:"
	@echo "  magic       - Run Magic with the project .mag file"
	@echo "  lvs         - Run LVS checks"
	@echo "  drc         - Run DRC checks"
	@echo "  sim         - extract spice for simulation"
	@echo "  update_gds  - Update GDS and LEF files"
	@echo "  clean       - Clean up generated files"
	@echo ""

	@echo "Activated project: $(PROJECT_NAME)"

magic:
	magic -rcfile $(MAGIC_RC) $(PROJECT_NAME).mag


$(PROJECT_NAME).lvs.spice: $(PROJECT_NAME).mag
	magic -rcfile $(MAGIC_RC) -noconsole -dnull tcl/extract_for_lvs.tcl $(PROJECT_NAME)
	rm -f *.ext

antenna:
	magic -rcfile $(MAGIC_RC) -noconsole -dnull tcl/antenna.tcl $(PROJECT_NAME)
	rm -f *.ext

drc:
	magic -rcfile $(MAGIC_RC) -noconsole -dnull tcl/drc.tcl $(PROJECT_NAME)
	
$(PROJECT_NAME).sim.spice: $(PROJECT_NAME).mag
	magic -rcfile $(MAGIC_RC) -noconsole -dnull tcl/extract_for_sim.tcl $(PROJECT_NAME)
	rm -f *.ext

sim: $(PROJECT_NAME).sim.spice
	@echo "extract job done..."

lvs.report: $(PROJECT_NAME).lvs.spice ../src/project.v
	netgen -batch eval "set project $(PROJECT_NAME) ; source tcl/lvs_netgen.tcl"

lvs: lvs.report
	@propOk=1; match=0; port=1; \
    if grep -q "match uniquely" lvs.report; then \
        match=1; \
    fi; \
    if grep -q "Property errors were found" lvs.report; then \
        propOk=0; \
    fi; \
    if grep -q "failed pin matching" lvs.report; then \
        match=0; \
    fi; \
    if grep -q "Final result: Netlists do not match" lvs.report; then \
        match=0; \
    fi; \
    if grep -q "port errors" lvs.report; then \
        port=0; \
    fi; \
    if grep -q "Final result: Circuits match uniquely\." lvs.report; then \
        match=1; \
    fi; \
	if [ $$match -eq 1 ] && [ $$propOk -eq 1 ] && [ $$port -eq 1 ]; then \
        echo "LVS OK"; \
	    exit 0; \
    else \
        echo "LVS FAIL: match=$$match properties=$$propOk port=$$port"; \
	    exit 1; \
    fi

update_gds:
	mkdir -p ../gds ../lef
	magic -rcfile $(MAGIC_RC) -noconsole -dnull tcl/update_gds_lef.tcl $(PROJECT_NAME)

clean:
	rm -f lvs.report *.lvs.spice *.nodes
