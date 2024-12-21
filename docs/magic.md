# MAGIC VLSI Tool Guide

## Starting with PDK

To start MAGIC with the PDK, use the following command:

```bash
magic -rcfile $(PDK_ROOT)/sky130A/libs.tech/magic/sky130A.magicrc $(NAME).mag
```
For the Projectwork, use the `Makefile`. See [Makefile Overview](##Makefile Overview)

**Explanation of the Command**

- **`-rcfile`**: Specifies the configuration file (`.magicrc`) to be used. This file contains settings for the specific PDK, including layer definitions, DRC rules, and other parameters.
- **`$(PDK_ROOT)`**: Refers to the root directory of the installed Process Design Kit (PDK).
- **`$(NAME).mag`**: Refers to the layout file for the design you want to open in MAGIC.

## Commands and Shortcuts


This guide covers the essential commands and shortcuts for using MAGIC efficiently. For further details, refer to the [official documentation](http://opencircuitdesign.com/magic/commandref/commands.html).

| Command/Shortcut       | Description                                                                                              |
| ---------------------- | -------------------------------------------------------------------------------------------------------- |
| `b`                    | Box command                                                                                            |
| `:grid w h`            | Sets the grid. If no values are provided, the grid is disabled.<br>Example: `:grid 0.05u 0.05u`         |
| `:erase m1`            | Deletes metal1                                                                                          |
| `:snap user`           | Sets the user grid for snapping                                                                         |
| `Shift` + `z`          | Zoom out                                                                                               |
| `z`                    | Zoom in                                                                                                |
| `Ctrl` + `z`           | Zoom to box                                                                                             |
| Middle Mouse Button    | Paints the current box with the layer under the cursor                                                  |
| `m`                    | Move command                                                                                           |
| `i`                    | Selects the instance under the cursor                                                                  |
| `v`                    | Views the full layout                                                                                  |
| `r` / `R`              | Rotates the selected object                                                                             |
| `s`                    | Selects an object (can check connections)                                                              |

## Routing Commands

To adjust visibility of layers for routing:
```
see no *      # Disable all layers
see locali    # Show all local interconnects
see m1        # Show metal1 layer
```

### Routing Mode Shortcuts
- Press `Space` to activate Routing Mode.
- `Shift` + `Left Mouse Button`: Move metal up.
- `Shift` + `Right Mouse Button`: Move metal down.



## Makefile Overview

All MAGIC-related files are located in the `mag` directory, which also contains a Makefile to handle important tasks. The following commands can be executed with the Makefile:

```
Possible commands:
  magic       - Run Magic with the project .mag file
  lvs         - Run LVS checks
  drc         - Run DRC checks
  update_gds  - Update GDS and LEF files
  clean       - Clean up generated files
```

By default, the top-level design is selected. If working on a subcomponent (or an IP block), the design must be activated by setting the `TT_PROJECT_NAME` shell variable. For example, to work on the inverter design:

```
export TT_PROJECT_NAME=inverter
```

You can check which design is currently active by running:
```
make info
```

## Example Design Flow: Inverter

1. **Activate the Project for the Inverter:**

    To work on the Inverter, first it must be activated:
   ```bash
   export TT_PROJECT_NAME=inverter
   ```

2. **Verify the Active Project:**
    make shure you are in the `mag` folder and run the following command:
   ```bash
   make info
   ```

   The Output is something like that:

   ```plaintext
    Possible commands:
    magic       - Run Magic with the project .mag file
    lvs         - Run LVS checks
    drc         - Run DRC checks
    update_gds  - Update GDS and LEF files
    clean       - Clean up generated files
  
    Activated project: inverter
   ```

3. **Start MAGIC:**
   ```
   make magic
   ```

4. **Create and Save the Layout:**
   - Design the layout in MAGIC.
   - Perform live DRC checks during the process to ensure compliance.

5. **Run DRC Checks:**
   After completing the layout, execute the following command to verify that there are no DRC errors:
   ```
   make drc
   ```

6. **Perform LVS:**
   - First, create a reference SPICE file using `xschem` in the `xschem` folder. The SPICE file must be saved in:
     ```
     xschem/simulation/inverter.spice
     ```
   - Run LVS to extract the SPICE netlist from MAGIC and execute the `tcl` script `lvs_netgen` with `netgen`:
     ```
     make lvs
     ```

7. **Commit the Design to Version Control:**
   If everything is correct, add and commit the files to the Git repository:
   ```
   git add .
   git commit -m "Add completed inverter design"
   ```

---

