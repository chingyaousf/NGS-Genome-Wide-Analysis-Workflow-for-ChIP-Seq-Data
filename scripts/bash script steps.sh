#Building the folder with name 'ChipSeqAnalysis', by typing 'mkdir ChipSeqAnalysis'
mkdir ChipSeqAnalysis

#In terminal, building a new folder for reference genome file by typing 'mkdir ~/ChipSeqAnalysis/refGenome'
mkdir ~/ChipSeqAnalysis/refGenome

# Prepare the index file, In terminalloading the mapping software by typing 'module purge', then, 'module add apps/bowtie/2.3.5.1'
module purge
module add apps/bowtie/2.3.5.1

#Building the index for bowtie by typing'bowtie2-build ~/ChipSeqAnalysis/refGenome/GCF_000005845.2_ASM584v2_genomic.fna ~/ChipSeqAnalysis/refGenome/GCF_000005845.2_ASM584v2_genomic'
bowtie2-build ~/ChipSeqAnalysis/refGenome/GCF_000005845.2_ASM584v2_genomic.fna ~/ChipSeqAnalysis/refGenome/GCF_000005845.2_ASM584v2_genomic

#Quality control of the reads
#In terminal loading the quality control software by typing 'module purge', then, 'module add apps/fastqc/0.11.5'
module purge
module add apps/fastqc/0.11.5

# Launch the FASTQC program on the experiment file (SRR576933.fastq), by typing'fastqc ~/ChipSeqAnalysis/SRR576933.fastq'
fastqc ~/ChipSeqAnalysis/SRR576933.fastq

# Similarly, performing quality control for control file (SRR576938.fastq)
fastqc ~/ChipSeqAnalysis/SRR576938.fastq

# Mapping the reads with Bowtie
sbatch mapping.sh

# Peak calling with MACS2
sbatch peakCalling.sh
