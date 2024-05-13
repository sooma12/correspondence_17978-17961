# 2_gb_to_fa.py
"""
Make a .fa file from genbank via biopython
Technique comes from https://warwick.ac.uk/fac/sci/moac/people/students/peter_cock/python/genbank2fasta/
"""


from Bio import SeqIO
import os
import sys


def main():
    genbank_dir = get_var_from_config(config_filename="./config.cfg", varname="GENBANK_DIR")
    for input_file in os.listdir(genbank_dir):
        file_name = os.path.splitext(os.path.basename(input_file))[0]
        output_file = file_name + '.fa'

        write_genbank_to_fa(input_filename=input_file, output_filename=output_file)


def write_genbank_to_fa(input_filename: str, output_filename: str):
    """
    write the amino acid protein sequences from a genbank file to a fasta file, with locus tags as headers
    """
    input_handle = open(input_filename, 'r')
    output_handle = open(output_filename, 'w')

    for seq_record in SeqIO.parse(input_handle, "genbank"):
        print(f'converting GenBank record {seq_record.id}')
        for seq_feature in seq_record.features:
            if seq_feature.type == "CDS":
                assert len(seq_feature.qualifiers['translation']) == 1
                output_handle.write(
                    f">{seq_feature.qualifiers['locus_tag'][0]} from {seq_record.name}\n{seq_feature.qualifiers['translation'][0]}\n")

    output_handle.close()
    input_handle.close()


def get_var_from_config(config_filename: str, varname: str):
    """Open config file and get specified variable.
    Assumes config file is formatted with one variable per line, e.g. `VARNAME=VARVALUE`
    """

    target_var = None

    with open(config_filename, 'r') as config_fh:
        for line in config_fh:
            if line.startswith(varname):
                line = line.strip()
                if target_var:
                    print("Error in config parsing: variable occurs more than once.")
                    sys.exit(1)
                split_line = line.split(sep='=')
                target_var = split_line[1]

    return target_var


if __name__ == "__main__":
    main()
