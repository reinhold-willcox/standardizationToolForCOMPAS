#!/bin/bash

[[ -z "$1" ]] && { echo "Parameter 1 (gridfile) is empty" ; exit 1; }

[[ -z "$2" ]] && { echo "Parameter 2 (output dir name) is empty" ; exit 1; }

mkdir -p $2

COMPAS --logfile-def LOGFILE.txt --switch-log $(<COMPARGS) --grid $1 -c temp_dir_123
mv temp_dir_123/* $2
rmdir temp_dir_123
cp $1 $2/

