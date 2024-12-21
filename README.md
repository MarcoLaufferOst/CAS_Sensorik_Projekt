![](../../workflows/gds/badge.svg) ![](../../workflows/docs/badge.svg)

# Tiny Tapeout Analog Project

- [Read the documentation for project](docs/info.md)

## What is Tiny Tapeout?

Tiny Tapeout is an educational project that aims to make it easier and cheaper than ever to get your digital or analog designs manufactured on a real chip.

To learn more and get started, visit https://tinytapeout.com.

## Analog projects

For specifications and instructions, see the [analog specs page](https://tinytapeout.com/specs/analog/).

## Enable GitHub actions to build the results page

- [Enabling GitHub Pages](https://tinytapeout.com/faq/#my-github-action-is-failing-on-the-pages-part)

## Resources

- [FAQ](https://tinytapeout.com/faq/)
- [Digital design lessons](https://tinytapeout.com/digital_design/)
- [Learn how semiconductors work](https://tinytapeout.com/siliwiz/)
- [Join the community](https://tinytapeout.com/discord)

## Structure of the Project

The project has the following folder structure:

```plaintext
.
├── docs --> desc & guides
├── gds
├── lef
├── mag --> Layout files with a Makefile
│   ├── gds
│   └── lef
├── src
├── test
└── xschem 
    └── simulation --> spice netlists
```

- **docs**  
  Contains project descriptions, cheat sheets, and guides.

- **gds**  
  Contains GDSII (Graphic Data System II) files, which are binary files used to describe the layout of an integrated circuit. These files are the standard format for IC design. (created by Makefile in the `mag` folder)

- **lef**  
  Contains LEF (Library Exchange Format) files, which describe the physical design rules and abstract layouts of standard cells or macros in an integrated circuit. (created by Makefile in the `mag` folder)

- **mag**  
  Includes all layout files, typically in Magic format, used for IC layout design.

- **src**  
  Contains Verilog files that describe the hardware design.

- **test**  
  Contains Verilog testbench files for simulating and verifying the hardware design.

- **xschem**  
  Contains schematic designs of the project created using the Xschem tool.

