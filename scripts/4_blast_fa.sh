#!/bin/bash
# BLAST fasta-formatted proteins against reference genome blast database
# Load conda environment with:
# `module load anaconda3`
# `conda activate /work/geisingerlab/conda_env/blast_corr`

module load anaconda3
source /shared/centos7/anaconda3/2021.05/etc/profile.d/conda.sh
conda activate /work/geisingerlab/conda_env/blast_corr

source ./config.cfg

mkdir -p $BLAST_OUTPUT

OUTFILE=${BLAST_OUTPUT}/blast_output

echo "Query fasta files" "${QUERY_FASTAS[@]}"
echo "Blastdb for reference genome: $OUTPUT_DATABASE"
echo "Saving BLAST output to: $OUTFILE"

echo "merging query fastas"
concatenated_queries=$(cat "${QUERY_FASTAS[@]}")


blastp -query $concatenated_queries -db $OUTPUT_DATABASE -max_target_seqs 1 -outfmt 6 -evalue 1e-5 -num_threads 4 1>$OUTFILE
