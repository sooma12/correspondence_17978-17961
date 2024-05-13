#!/bin/bash
# Make blast database for reference genome
# Load conda environment with:
# `module load anaconda3`
# `conda activate /work/geisingerlab/conda_env/blast_corr`

module load anaconda3
source /shared/centos7/anaconda3/2021.05/etc/profile.d/conda.sh
conda activate /work/geisingerlab/conda_env/blast_corr

source ./config.cfg

echo "Genome fasta file to make blast protein db: $TARGET_REF_GENOME_FA"
echo "blast db output directory: $OUT_DIR"
echo "output database name: $OUTPUT_DATABASE"

makeblastdb -in $TARGET_REF_GENOME_FA -out $OUTPUT_DATABASE -parse_seqids -dbtype prot
