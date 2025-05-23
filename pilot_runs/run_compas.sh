#!/bin/bash

#names=("basic" "basic1b" "intermediate")
#name=${names[$SLURM_ARRAY_TASK_ID]}
name=("basic") 

# choose one
gridfile=grid_files_small/comp_grid_pilot_run_large.txt
#gridfile=grid_files_large/comp_grid_pilot_run_large.txt

COMPARGS=COMPARGS_$name
outdir=$HOME/astro/ultra_compact_binaries_LISA/data/T0_format_pilot/COMPAS/
outlog=logs/${name}.log
container=$name

mkdir -p $outdir
echo $outdir
echo $outlog
echo $COMPASARGS

echo "$exe --logfile-def ../LOGFILE.txt $(<COMPARGS) --grid $gridfile -c $container > $outlog"
$exe --logfile-def ../LOGFILE.txt $(<COMPARGS) --grid $gridfile -c $container > $outlog
mv $container $outdir
