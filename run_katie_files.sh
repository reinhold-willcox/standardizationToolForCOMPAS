#!/bin/bash
#
#SBATCH --job-name=ucb_initial_conditions
#SBATCH --output=ucb_initial_conditions_run_%j.txt
#
#SBATCH --mem-per-cpu=1024
#SBATCH --output=slurm_output.out
#SBATCH --time=0-2:00:0

#for ii in initial_MC_sample_ecc_thermal initial_MC_sample_ecc_uniform initial_MC_sample_fiducial initial_MC_sample_m2_min_05 initial_MC_sample_porb_log_uniform initial_MC_sample_qmin_01 ; 
for ii in $(< names.txt); 
do 
    ./run_compas.sh grid_files_from_katie/initial_condition_variations/comp_$ii.txt data/initial_condition_variations/$ii &
done
