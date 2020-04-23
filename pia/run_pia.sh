#!/bin/bash
aalength="30"			#minimum aminoacid sequence length
search_type="single"	#single or set
gene="trp"			#gene(set) name
evalue="0.00000000000000000001"	#E-value threshold for BLAST search
blasthits="100"			#Number of BLAST hits to retain for the analysis

for file in **.fas ; do

	mkdir pia
	cd pia
	mkdir results_${file}
	cd results_${file}
	cp ../../${file} ./	

	python /ufrc/kawahara/yashsondhi/pia2_implementation/PIA2/pia/get_orfs_or_cdss.py $file fasta 1 ORF open top $aalength both ORF_nuc.fasta ORF_prot.fasta > stdout 2>&1
	#get_orfs_or_cdss.py $file fasta 1 ORF open top $aalength both ORF_nuc.fasta ORF_prot.fasta > stdout 2>&1

	perl /ufrc/kawahara/yashsondhi/pia2_implementation/PIA2/pia/pia.pl ORF_prot.fasta $search_type $gene mafft $evalue $blasthits
	#pia.pl ORF_prot.fasta $search_type $gene mafft $evalue $blasthits

	perl /ufrc/kawahara/yashsondhi/pia2_implementation/PIA2/pia/phylographics/makeRtrees.pl treeout.tab trees.pdf phylogram no None Rfile yes no >tree.R
	#/ufrc/kawahara/yashsondhi/pia2/phylographics/makeRtrees.pl treeout.tab trees.pdf phylogram no None Rfile yes no >tree.R

	R --vanilla < tree.R 2>log.txt

	#/ufrc/kawahara/yashsondhi/pia2/post_pia.sh
	post_pia.sh
	cd ../../

done
