# Correspondence table construction: ATCC 17978 vs. 17961
For use with Palethorpe et al bfmRS data and connection to 17978-mff genome file NZ_CP012004

17961 Genbank file downloaded from: https://www.ncbi.nlm.nih.gov/nuccore/CP065432

- Parse CP065432 genbank file (17961) with Biopython -> get locus tags and protein sequences
- Make 17978-mff BLAST database
- BLAST protein sequences from 17961 vs. 17978-mff to get best hits; grab those locus tags
- Associate locus tags together

*NOTE: I'm using scripts and strategies I originally designed for use with liftoff.*

## Setup

```bash
srun --partition=express --nodes=1 --cpus-per-task=2 --pty --time=00:60:00 /bin/bash
module load anaconda3
conda create --prefix /work/geisingerlab/conda_env/blast_corr python=3.9
conda activate /work/geisingerlab/conda_env/blast_corr
conda install -p /work/geisingerlab/conda_env/blast_corr entrez-direct
conda install -p /work/geisingerlab/conda_env/blast_corr gffread
conda install -p /work/geisingerlab/conda_env/blast_corr samtools
conda install -p /work/geisingerlab/conda_env/blast_corr blast
conda install -p /work/geisingerlab/conda_env/blast_corr ncbi-datasets-cli
conda install -p /work/geisingerlab/conda_env/blast_corr biopython
```

##  Get sequences
```bash
# $ cat input/accessions.txt 
# CP012004.1
# CP012005.1
# CP079931.1
# CP079933.1
# CP079934.1
# CP079932.1

# Code to grab multiple genbank files
# made a file containing genbank CPxxxxxx accessions
for i in `cat accessions.txt`; do efetch -db nucleotide -id ${i} -format gb > ${i}.gb ; done
```

## try source config file

********



## Get correspondence with BLAST:
https://www.metagenomics.wiki/tools/blast/blastn-output-format-6




