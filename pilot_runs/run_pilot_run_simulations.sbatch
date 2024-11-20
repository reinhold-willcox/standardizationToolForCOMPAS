#!/bin/bash
#SBATCH --job-name=ucb_pilots
#SBATCH --output=logs/ucb_pilots_run_%j.txt
#SBATCH --error=logs/ucb_pilots_stderr.%A.%a.log
#SBATCH --mem-per-cpu=1024
#SBATCH --output=slurm_output.out
#SBATCH --time=0-2:00:0
#SBATCH --array=0-2


mods=("basic" "basic1b" "intermediate")

echo $SLURM_ARRAY_TASK_ID
mod=${mods[$SLURM_ARRAY_TASK_ID]}
COMPARGS=COMPARGS_$mod
GRIDFILE=small_grid_files/comp_grid_pilot_run_large.txt
FOUT=../data/T0_format_pilot/COMPAS/
echo $mod
echo $COMPASARGS
echo $FOUT

srun COMPAS --logfile-def ../LOGFILE.txt $(<$COMPARGS) --grid $GRIDFILE -c $mod  > logs/${mod}.log 
mv $mod $FOUT
