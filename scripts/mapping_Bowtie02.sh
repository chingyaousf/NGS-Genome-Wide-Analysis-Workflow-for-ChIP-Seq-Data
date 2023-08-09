#!/bin/bash

#SBATCH --workdir=/home/c/chingyao/chipseqanalysis
#SBATCH --job-name=ChIPseqMapping
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
module add apps/bowtie/2.3.2
module add apps/samtools/1.3.1
bowtie2 -x refgenome/GCF_000005845.2_ASM584v2_genomic -3 1 -q SRR576933/SRR576933.fastq.gz -S SRR576933.sam 2> SRR576933.out
bowtie2 -x refgenome/GCF_000005845.2_ASM584v2_genomic -3 1 -q SRR576938/SRR576938.fastq.gz -S SRR576938.sam 2> SRR576938.out
samtools view -u SRR576933.sam | samtools sort -o SRR576933.bam 
samtools view -u SRR576938.sam | samtools sort -o SRR576938.bam 
samtools index SRR576933.bam
samtools index SRR576938.bam
