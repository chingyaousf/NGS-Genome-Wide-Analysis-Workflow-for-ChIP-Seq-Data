#!/bin/bash

#SBATCH --workdir=/home/c/chingyao/chipseqanalysis
#SBATCH --job-name=PeakCalling
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=10000
#SBATCH -t 00:10:00
#SBATCH -o run.out
#SBATCH -e run.err
#SBATCH --mail-user=
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL

module purge
module add apps/miniconda/3.6.1-intel
conda activate /home/j/jobersta/.conda/envs/macs2
unset PYTHONPATH
macs2 callpeak -t SRR576933.sam -c SRR576938.sam -n MACSpeaks -q 0.05 --gsize 4639675 --keep-dup 1 --nomodel --extsize 400
