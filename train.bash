#!/bin/bash
#SBATCH --job-name=drums           # Job name
#SBATCH --gres=gpu:1
#SBATCH --nodes=1                  # Number of nodes
#SBATCH --ntasks-per-node=1        # Number of tasks per node
#SBATCH --cpus-per-task=4          # Number of CPUs per task
#SBATCH -p volta-gpu                 # Partition
#SBATCH --mem=32G                   # Memory per node
#SBATCH --time=10:00:00            # Time limit (HH:MM:SS)
#SBATCH --output=output.log        # Output file
#SBATCH --qos=gpu_access

# Load any necessary modules
module add cuda/11.3 gcc/9.1.0
source /nas/longleaf/home/zihaozou/.bashrc
micromamba activate enerf

# Your commands here
python main_nerf.py --config configs/mydata/drums.txt

# End of script