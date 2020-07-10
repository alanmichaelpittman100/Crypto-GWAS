#!/bin/bash

GEMMA="/gemma/gemma-0.98.1-linux-static "
pheno_folder="/results"

$GEMMA \
	-g $pheno_folder/crypto_merged_dosage.bimbam \
	-p $pheno_folder/pheno_file.txt \
	-c $pheno_folder/cov_file.txt \
	-k $pheno_folder/crypto_merged_clean_matrix.sXX.txt \
	-lmm 2 \
	-n 1 \
	-maf 0.05 \
	-hwe 0.00001 \
	-o crypto_b1_b2_assoc_results_15PCs.txt

exit
