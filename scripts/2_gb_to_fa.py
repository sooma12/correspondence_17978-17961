# 2_gb_to_fa.py
"""
Make a .fa file from genbank via biopython
Technique comes from https://warwick.ac.uk/fac/sci/moac/people/students/peter_cock/python/genbank2fasta/
"""

from Bio import SeqIO

# gbk_file =
# faa_file =
# input_handle = open(, 'r')
# output_handle = open(, 'w')

for seq_record in SeqIO.parse(input_handle, "genbank"):
    print(f'converting GenBank record {seq_record.id}')
    for seq_feature in seq_record.features:
        if seq_feature.type == "CDS":
            assert len(seq_feature.qualifiers['translation']) == 1
            output_handle.write(f">{seq_feature.qualifiers['locus_tag'][0]} from {seq_record.name}\n{seq_feature.qualifiers['translation'][0]}\n")

output_handle.close()
input_handle.close()