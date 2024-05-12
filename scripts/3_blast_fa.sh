#!/bin/bash
# BLAST fasta-formatted proteins against reference genome blast database
# Load conda environment with:
# `module load anaconda3`
# `conda activate /work/geisingerlab/conda_env/blast_corr`

blastp -query $1 -db $2 \
    -max_target_seqs 1 \
    -outfmt 6 -evalue 1e-5 -num_threads 4

