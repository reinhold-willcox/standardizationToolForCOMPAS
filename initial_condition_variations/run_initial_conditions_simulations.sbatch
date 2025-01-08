#!/bin/bash
#SBATCH --job-name=ucb_initial_conditions
#SBATCH --output=logs/ucb_initial_conditions_run_%j.txt
#SBATCH --error=logs/ucb_initial_coditions_stderr.%A.%a.log
#
#SBATCH --mem-per-cpu=1024
#SBATCH --output=slurm_output.out
#SBATCH --time=0-2:00:0
#SBATCH --array=0-5%6



names=("initial_MC_sample_ecc_thermal" "initial_MC_sample_ecc_uniform" "initial_MC_sample_fiducial" "initial_MC_sample_m2_min_05" "initial_MC_sample_porb_log_uniform" "initial_MC_sample_qmin_01")

echo $SLURM_ARRAY_TASK_ID
name=${names[$SLURM_ARRAY_TASK_ID]}
echo $name
echo "comp_${name}"

# Choose small or large depending on needs
srun ./run_compas.sh small_grid_files/comp_${name}.txt IC_vars ${name}_small > logs/${name}.log
#srun ./run_compas.sh large_grid_files/comp_${name}.txt IC_vars ${name} > logs/${name}.log
