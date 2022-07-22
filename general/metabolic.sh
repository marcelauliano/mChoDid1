

longest_iso_CD= "/lustre/scratch123/tol/teams/tola/users/mu2/from_scratch116/mChoDid1-paper/orthofinder-Longest/mchodid1-GCF_015220235.1_aa.longestn1.fa"
proteins_name_descriptions_fasta="/lustre/scratch123/tol/teams/tola/users/mu2/from_scratch116/mChoDid1-paper/orthofinder_names/GCF_015220235.1_mChoDid1.pri_protein.name.faa"

#protein ids with tab separated id
proteins_name_descriptions_ids="/lustre/scratch123/tol/teams/tola/users/mu2/from_scratch116/mChoDid1-paper/orthofinder-Longest/mChoDid1.prot.tab.ids"


#giving a list of gene names or descriptions

python get_protID_by_name.py -l list -i proteins_name_descriptions_ids

# this outputs all protein IDs for the list of genes in separated files. Id files ending in "*.id.csv"

cat *.id.csv > all.id.csv

python get_ort.py -ort Orthogroups.txt -id two.id

# now concatenate all orthogroup IDs so you can get the orthogroups to files

cat *.Ort.csv > all.Ort.csv


#rename orthogroup headers

python re_orthogroups_fastaHeader.py -f OG0006926.fa -n OG0006926.n.fa





