#!/bin/bash

[[ -z "$1" ]] && { echo "Parameter 1 (gridfile) is empty" ; exit 1; }

[[ -z "$2" ]] && { echo "Parameter 2 (output dir name) is empty" ; exit 1; }

[[ -z "$3" ]] && { echo "Parameter 3 (output container) is empty" ; exit 1; }

outdir=/home/reinhold/astro/ultra_compact_binaries_LISA/data/$2/
echo "$outdir"
mkdir -p $outdir
#echo "COMPAS --logfile-def LOGFILE.txt --switch-log $(<COMPARGS) --grid $1 --output-path $outdir -c $3"
COMPAS --logfile-def LOGFILE.txt --switch-log $(<COMPARGS) --grid $1 -c $3
mv $3 $outdir
