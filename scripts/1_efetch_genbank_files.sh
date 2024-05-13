#!/bin/bash
# Download files from
# Load conda environment with:
# `module load anaconda3`
# `conda activate /work/geisingerlab/conda_env/blast_corr`

{
if [ ! -f ./accessions.txt ]; then
    echo "Missing ./accessions.txt file containing "
    exit 0
fi
}

source ./config.cfg

echo "Fetching Genbank files in for accession numbers in ./accessions.txt"
echo "Saving files to $GENBANK_DIR"
echo "Contents of accessions.txt:"
echo `cat ./accessions.txt`

mkdir -p $GENBANK_DIR

module load anaconda3
conda activate /work/geisingerlab/conda_env/blast_corr

for i in `cat ./accessions.txt`; do efetch -db nucleotide -id ${i} -format gb > ${GENBANK_DIR}/${i}.gb ; done
