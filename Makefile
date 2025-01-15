PROJECT_NAME := r2r_dac_control


# x windows stuff for interactive
XSOCK :=/tmp/.X11-unix
XAUTH :=/tmp/.docker.xauth

# OPENLANE_SRC_WORKDIR -- the project dir is mapped into openlane docker at
# this location 
OPENLANE_SRC_WORKDIR ?= /work

# WORKDIR parent dir with src etc, defaults to pwd
WORKDIR ?= $(shell pwd)

# FLOW_RUNNER_COMMAND -- the actual call to flow.tcl, inside openlane docker
# FLOW_RUNNER_COMMAND := ./flow.tcl -overwrite -design $(OPENLANE_SRC_WORKDIR)/src -run_path $(OPENLANE_SRC_WORKDIR)/runs -tag $(FLOW_RUN_TAG)
FLOW_RUNNER_COMMAND := ./flow.tcl -overwrite -design /work/openlane/$(PROJECT_NAME) -run_path /work/openlane/$(PROJECT_NAME)/runs -tag $(PROJECT_NAME)
CURRENTRUN_OUTPUT_DIR := runs/$(PROJECT_NAME)

OPENLANE_DOCKER_ARGS := -v $(OPENLANE_ROOT):/openlane \
		-v $(PDK_ROOT):$(PDK_ROOT) -v $(WORKDIR):$(OPENLANE_SRC_WORKDIR) \
		-e PDK_ROOT=$(PDK_ROOT)  -e PDK=$(PDK) \
		-u $(shell id -u $(USER)):$(shell id -g $(USER)) \
		--net=host --env="DISPLAY"  \
		-v $(XSOCK) -v $(XAUTH) -e XAUTHORITY=$(XAUTH) \
		-e FLOWRUNNER="$(FLOW_RUNNER_COMMAND)" \
		$(OPENLANE_IMAGE_NAME)



# needs PDK_ROOT and OPENLANE_ROOT, OPENLANE_IMAGE_NAME set from your environment
harden:
	docker run --rm \
	-v $(OPENLANE_ROOT):/openlane \
	-v $(PDK_ROOT):$(PDK_ROOT) \
	-v $(CURDIR):/work \
	-e PDK_ROOT=$(PDK_ROOT) \
	-e PDK=$(PDK) \
	-u $(shell id -u $(USER)):$(shell id -g $(USER)) \
	$(OPENLANE_IMAGE_NAME) \
	/bin/sh -c "./flow.tcl -overwrite -design /work/openlane/$(PROJECT_NAME) -run_path /work/openlane/$(PROJECT_NAME)/runs -tag $(PROJECT_NAME)"



SIM_DIR := verilog/sim
RTL_FILE := ./../rtl/r2r_dac_control.v


cosim:
	cd $(SIM_DIR) && ngspice vlnggen $(RTL_FILE)


.PHONY: interactive remove_synth
interactive:
	xauth nlist $(DISPLAY) | sed -e 's/^..../ffff/' | xauth -f $(XAUTH) nmerge -
	chmod 755 $(XAUTH)
	docker run -it  $(OPENLANE_DOCKER_ARGS)

remove_synth:
	rm -r openlane/r2r_dac_control/runs


update_files:
	cp openlane/$(PROJECT_NAME)/runs/$(PROJECT_NAME)/results/final/gds/$(PROJECT_NAME).gds gds
	cp openlane/$(PROJECT_NAME)/runs/$(PROJECT_NAME)/results/final/verilog/gl/$(PROJECT_NAME).v verilog/gl/
	cp openlane/$(PROJECT_NAME)/runs/$(PROJECT_NAME)/results/final/mag/$(PROJECT_NAME).mag mag
