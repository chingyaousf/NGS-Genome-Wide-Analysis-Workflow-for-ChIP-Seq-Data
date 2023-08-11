# NGS Genome-Wide Analysis Workflow for ChIP-Seq Data

**Quality Check - FastQC**

**Read Mapping - Bowtie2**

**Peak Calling - MACS2**

## Project Overview:

This project revolves around a thorough analysis workflow inspired by the study titled "Genome-scale Analysis of Escherichia coli FNR Reveals Complex Features of Transcription Factor Binding." The analysis workflow encompasses essential stages, including quality check (QC), read mapping, and peak-calling. Each step is executed using open-source software and command-line interfaces by HPC (High Performance Computer).

-   **Step 1: Quality Check (QC)**

In the pursuit of reliable and accurate genomics analysis, quality control is foundational. We begin by assessing the quality of the sequencing data through the application of FastQC.

Command:

`fastqc -o output_directory input_fastq_file(s)`

-   **Step 2: Read Mapping using Bowtie2**

Accurate read mapping is critical to understanding the intricacies of transcription factor binding. Consistent with the methodology of the study, we employ Bowtie2 for its proficiency in aligning reads to the reference genome.

Command:

`bowtie2-build reference_genome.fa index_prefix`

`bowtie2 -x index_prefix -U input_fastq_file(s) -S mapped_reads.sam`

**SRR576933 mapping output:**

3603544 reads; of these:

3603544 (100.00%) were unpaired; of these:

1220111 (33.86%) aligned 0 times

2280575 (63.29%) aligned exactly 1 time

102858 (2.85%) aligned \>1 times

66.14% overall alignment rate

**SRR576933 mapping output:**

6717074 reads; of these:

6717074 (100.00%) were unpaired; of these:

68441 (1.02%) aligned 0 times

6433269 (95.77%) aligned exactly 1 time

215364 (3.21%) aligned \>1 times

98.98% overall alignment rate

-   **Step 3: Peak-Calling**

The identification of transcription factor binding peaks is pivotal to our analysis. In alignment with the study's approach, we utilize MACS2 (Model-based Analysis of ChIP-Seq) for peak-calling.

Command:

`macs2 callpeak -t mapped_reads.bam -c control_reads.bam -f BAMPE -g genome_size -n output_prefix`

## **Conclusion:**

This project is a comprehensive endeavor based on the data and research presented in the paper. By executing quality check assessments, employing Bowtie2 for read mapping as indicated, and harnessing the capabilities of MACS2 for peak-calling, we embark on a journey to uncover the intricate features of transcription factor binding. Through the utilization of open-source command-line tools and a methodical approach, we aim to contribute to the existing body of knowledge surrounding gene regulation while embracing the insights provided by the Escherichia coli FNR dataset.

## References:

Myers, K. S., Yan, H., Ong, I. M., Chung, D., Liang, K., Tran, F., Keles, S., Landick, R., & Kiley, P. J. (2013). Genome-scale Analysis of Escherichia coli FNR Reveals Complex Features of Transcription Factor Binding. *PLOS Genetics*, *9*(6), e1003565. <https://doi.org/10.1371/journal.pgen.1003565>

G. Ambrosini, I. Vorontsov, D. Penzar, R. Groux, O. Fornés, D. Nikolaeva, B. Ballester, J. Grau, I. Grosse, V. Makeev, I. Kulakovskiy and P. Bucher, Insights gained from a comprehensive all-against-all transcription factor binding motif benchmarking study, Genome Biol., 2020, 21.

J. W. K. Ho, E. Bishop, P. V. Karchenko, N. Nègre, K. P. White and P. J. Park, ChIP-chip versus ChIP-seq: Lessons for experimental design and data analysis, *BMC Genomics*, 2011, **12**, 134.

K. S. Myers, H. Yan, I. M. Ong, D. Chung, K. Liang, F. Tran, S. Keleş, R. Landick and P. J. Kiley, Genome-scale analysis of Escherichia coli FNR reveals complex features of transcription factor binding, *PLoS Genet.*, 2013, **9**, e1003565.

Park PJ. ChIP-seq: advantages and challenges of a maturing technology. *Nat Rev Genet*. 2009;10(10):669-680. <doi:10.1038/nrg2641>

## Blog:

<https://ssidmarine.wordpress.com/2023/08/09/ngs-genome-wide-analysis-workflow-for-chip-seq-data/>

## Access data:

<https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE41195>

<https://www.ncbi.nlm.nih.gov/datasets/taxonomy/562/>

<https://doi.org/10.1371/journal.pgen.1003565>

**Some output data available in the data folder**
