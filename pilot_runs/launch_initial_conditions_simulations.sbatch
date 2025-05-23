#!/bin/bash
#SBATCH --job-name=ucb_pilots
#SBATCH --output=logs/ucb_pilots_run_%j.txt
#SBATCH --error=logs/ucb_pilots_stderr.%A.%a.log
#SBATCH --mem-per-cpu=1024
#SBATCH --output=slurm_output.out
#SBATCH --time=0-4:00:0

srun ./run_compas.sh #$SLURM_ARRAY_TASK_ID

### DON'T DO#SBATCH --array=0-2
