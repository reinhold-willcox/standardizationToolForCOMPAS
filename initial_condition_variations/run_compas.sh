#!/bin/bash

names=("initial_MC_sample_ecc_thermal" "initial_MC_sample_ecc_uniform" "initial_MC_sample_fiducial" "initial_MC_sample_m2_min_05" "initial_MC_sample_porb_log_uniform" "initial_MC_sample_qmin_01")
name=${names[$1]}
echo $name

# choose one
gridfile=small_grid_files/comp_${name}.txt
#gridfile=large_grid_files/comp_${name}.txt

outdir=/home/reinhold/astro/ultra_compact_binaries_LISA/data/initial_conditions_variations
outlog=logs/${name}.log
echo $outdir
echo $outlog
mkdir -p $outdir

echo "/home/reinhold/astro/compas/COMPAS_UCBs/src/COMPAS --logfile-def ../LOGFILE.txt $(<COMPARGS) --grid $gridfile -c $name > $outlog"
#/home/reinhold/astro/compas/COMPAS_UCBs/src/COMPAS --logfile-def ../LOGFILE.txt $(<COMPARGS) --grid $gridfile -c $name > $outlog
#mv $3 $outdir




# Delete later
#echo "comp_${name}"
#../data//
# Choose small or large depending on needs
#srun ./run_compas.sh small_grid_files/comp_${name}.txt initial_conditions_variations ${name}_small > logs/${name}.log
#srun ./run_compas.sh large_grid_files/comp_${name}.txt initial_conditions_variations ${name} > logs/${name}.log
#echo "COMPAS --logfile-def LOGFILE.txt $(<COMPARGS) --grid $1 --output-path $outdir -c $3"
#[[ -z "$1" ]] && { echo "Parameter 1 (gridfile) is empty" ; exit 1; }
#
#[[ -z "$2" ]] && { echo "Parameter 2 (output dir name) is empty" ; exit 1; }
#
#[[ -z "$3" ]] && { echo "Parameter 3 (output container) is empty" ; exit 1; }
#srun ./run_compas.sh large_grid_files/comp_${name}.txt initial_conditions_variations ${name} > logs/${name}.log
