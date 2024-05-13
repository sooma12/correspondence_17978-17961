# Correspondence table construction: ATCC 17978 vs. 17961
For use with Palethorpe *et al* (2022) bfmRS data and connection to 17978-mff genome file NZ_CP012004

From Palethorpe: Gene names and locus tags in the text have been updated to the identifiers found in the completed genome sequence for strain ATCC 17961 (GenBank accession numbers CP065432 [chromosome], CP065433 [pAB17961-1], and CP065434 [pAB17961-2]) (72)

- Parse CP065432 genbank file (17961) with Biopython -> get locus tags and protein sequences
- Make 17978-mff BLAST database
- BLAST protein sequences from 17961 vs. 17978-mff to get best hits; grab those locus tags
- Associate locus tags together

*NOTE: I'm using scripts and strategies I originally designed for use with liftoff.*

## Setup

Creating conda environment for fetching genbank files and BLAST:
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

python venv for biopython:
```bash
PROJECT_DIR=/work/geisingerlab/Mark/correspondence_tables_17978/correspondence_17978-17961
python3 -m venv $PROJECT_DIR/venv
source $PROJECT_DIR/venv/bin/activate
which python  # verify that this points to the venv python


python3 -m pip freeze
deactivate
```

##  Get sequences


