#!/bin/bash

[[ -z "$1" ]] && { echo "Parameter 1 (gridfile) is empty" ; exit 1; }

[[ -z "$2" ]] && { echo "Parameter 2 (output dir name) is empty" ; exit 1; }

mkdir -p $2

COMPAS --logfile-def LOGFILE.txt --switch-log $(<COMPARGS) --grid $1 -o /STER/reinhold/ultra_compact_binaries_LISA/$2
