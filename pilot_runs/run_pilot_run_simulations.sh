#!/bin/bash
#SBATCH --job-name=ucb_initial_conditions
#SBATCH --output=logs/ucb_initial_conditions_run_%j.txt
#SBATCH --error=logs/ucb_initial_coditions_stderr.%A.%a.log
#
#SBATCH --mem-per-cpu=1024
#SBATCH --output=slurm_output.out
#SBATCH --time=0-2:00:0
#SBATCH --array=0-3%3


mods=("basic" "basic1b" "intermediate")

echo $SLURM_ARRAY_TASK_ID
mod=${mods[$SLURM_ARRAY_TASK_ID]}
COMPARGS=COMPARGS_$mod
echo $mod
echo $COMPASARGS

srun COMPAS --logfile-def ../LOGFILE.txt $(<$COMPARGS) --grid small_grid_files/comp_grid_pilot_run_large.txt -c $mod -o  ../data/T0_format_pilot/COMPAS/ > logs/${mod}.log 
