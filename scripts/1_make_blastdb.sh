#!/bin/bash
# Make blast database for reference genome
# Load conda environment with:
# `module load anaconda3`
# `conda activate /work/geisingerlab/conda_env/blast_corr`

TARGET_REF_GENOME_FA=<.fa>
OUT_DIR=/Users/mws/Documents/geisinger_lab_research/bioinformatics_in_acinetobacter/making_correspondence_tables/17978-17961
OUTPUT_DATABASE=${OUT_DIR}/17978-mff_blast_db

makeblastdb -in $TARGET_REF_GENOME_FA -out $OUTPUT_DATABASE -parse_seqids -dbtype prot
