#!/bin/bash

exe=$HOME/astro/compas/COMPAS_dev/src/COMPAS

names=("initial_MC_sample_ecc_thermal" "initial_MC_sample_ecc_uniform" "initial_MC_sample_fiducial" "initial_MC_sample_m2_min_05" "initial_MC_sample_porb_log_uniform" "initial_MC_sample_qmin_01")
name=${names[$1]}
echo $name

# choose one
gridfile=grid_files_small/comp_${name}.txt
#gridfile=grid_files_large/comp_${name}.txt

outdir=$HOME/astro/ultra_compact_binaries_LISA/data/IC_vars
outlog=logs/${name}.log
container=$name

mkdir -p $outdir
echo $outdir
echo $outlog

echo "$exe --logfile-def ../LOGFILE.txt $(<COMPARGS) --grid $gridfile -c $container > $outlog"
$exe --logfile-def ../LOGFILE.txt $(<COMPARGS) --grid $gridfile -c $container > $outlog
mv $container $outdir

