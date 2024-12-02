#!/bin/bash
#
#SBATCH --job-name=gpt2-eval
#SBATCH --out="gpt2-eval-%A_%a.out"
#SBATCH --cpus-per-task=32
#SBATCH --mem=32G
#SBATCH --nodes=1
#SBATCH --time=1:00:00
#SBATCH --array=0
#SBATCH --gres=gpu:1
#SBATCH --partition=kempner_h100
#SBATCH --account=kempner_pehlevan_lab

export SAVE_DIR=samples/gpt2_samples1000_temp1-2_shot2

module load python/3.10.12-fasrc01 # update 
source activate /n/netscratch/pehlevan_lab/Everyone/indranilhalder/env/env_vLLM # update the location of env
python iLLM/evaluate/math_datasets.py samples_dir=$SAVE_DIR/math_samples save_dir=$SAVE_DIR/math_eval dset=math
