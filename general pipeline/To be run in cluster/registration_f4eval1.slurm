#!/bin/bash

# NOTE: Lines starting with "#SBATCH" are valid SLURM commands or statements,
#       while those starting with "#" and "##SBATCH" are comments.  Uncomment
#       "##SBATCH" line means to remove one # and start with #SBATCH to be a
#       SLURM command or statement.


#SBATCH -J slurm_job #Slurm job name

# Set the maximum runtime, uncomment if you need it
#SBATCH -t 48:00:00 #Maximum runtime of 48 hours

# Enable email notificaitons when job begins and ends, uncomment if you need it
#SBATCH --mail-user=ytongah@connect.ust.hk #Update your email address
#SBATCH --mail-type=begin
#SBATCH --mail-type=end

# Choose partition (queue), for example, partition "standard"
#SBATCH -p standard

# Use 2 nodes and 48 cores
#SBATCH -N 2 -n 48

# Setup runtime environment if necessary
# For example, setup MPI environment
# source ~/.bash_profile
# or you can source ~/.bashrc or ~/.bash_profile

# Go to the job submission directory and run your application
cd /home/bkhan/evalulation_acc
sh reg_stacks_to_template_f4eval1.sh
sh reg_stacks_to_template_f4eval2.sh
