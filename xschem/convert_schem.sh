#!/bin/bash

# file as agrument
if [[ $# -ne 1 ]]; then
  echo "Usage: $0 <datei>"
  exit 1
fi

FILE="$1"

if [[ ! -f "$FILE" ]]; then
  echo "file $FILE not found."
  exit 1
fi

# change the path references
sed -i \
  -e 's|/home/ttuser/pdk/sky130A/libs.tech/xschem/sky130_fd_pr/|sky130_fd_pr/|g' \
  -e 's|{ipin\.sym}|{devices/ipin.sym}|g' \
  -e 's|{iopin\.sym}|{devices/iopin.sym}|g' \
  -e 's|{lab_wire\.sym}|{devices/lab_wire.sym}|g' \
  -e 's|{opin\.sym}|{devices/opin.sym}|g' \
  -e 's|{isource\.sym}|{devices/isource.sym}|g' \
  -e 's|{gnd\.sym}|{devices/gnd.sym}|g' \
  -e 's|{vdd\.sym}|{devices/vdd.sym}|g' \
  -e 's|{capa\.sym}|{devices/capa.sym}|g' \
  -e 's|{code\.sym}|{devices/code.sym}|g' \
  -e 's|{vsource\.sym}|{devices/vsource.sym}|g' \
  -e 's|{vdd\.sym}|{devices/vdd.sym}|g' \
  "$FILE"

if [[ $? -eq 0 ]]; then
  echo "changes succesfuly."
else
  echo "error courred."
fi
