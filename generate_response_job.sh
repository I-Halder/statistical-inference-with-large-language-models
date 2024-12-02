#!/bin/bash
#
#SBATCH --job-name=gpt2-generate
#SBATCH --out="gpt2-generate-%A_%a.out"
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
python iLLM/generate/MATH.py model=gpt2 save_dir=$SAVE_DIR/math_samples temperature=1.2 num_samples=10 num_few_shot=2 num_workers=32 --list vllm_args --disable-log-requests list-- --list stop_strings Problem: list--
