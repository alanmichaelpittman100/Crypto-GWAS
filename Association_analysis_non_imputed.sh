#!/bin/bash

chrs="22 21 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1"

GEMMA="/homes/athosnew/Genetics_Centre_Bioinformatics/resourses/gemma/gemma-0.98.1-linux-static "
inputFilesDir="/homes/athosnew/Alan/crypto_GWAS/Association_merged_non-imputed"
qctool2="/homes/athosnew/Genetics_Centre_Bioinformatics/resourses/qctool_v2.0.1-Ubuntu14.04-x86_64/qctool"
resultsOUTdir="/homes/athosnew/Alan/crypto_GWAS/merged_imputed/Association_Analysis"

pheno_folder="/homes/athosnew/Alan/crypto_GWAS/merged_imputed/pheno_folder"



$GEMMA \
	-bfile $inputFilesDir/crypto_merged_clean_for_association \
	-p $pheno_folder/pheno_file.txt \
	-c $pheno_folder/cov_file.txt \
	-k $pheno_folder/crypto_merges_clean_matrix.sXX.txt \
	-lmm 4 \
	-n 1 \
	-o crypto_b1_b2_assoc_results_non_imputed_chr${chr}.txt

done

exit

#	-k $pheno_folder/relatedness.txt \ # relatedness


#calculate relationship matrix
/homes/athosnew/Genetics_Centre_Bioinformatics/resourses/gemma/gemma-0.98.1-linux-static -bfile /homes/athosnew/Alan/crypto_GWAS/merged_imputed/PCA_analysis/crypto_merges_clean -gk 2 -o /homes/athosnew/Alan/crypto_GWAS/merged_imputed/PCA_analysis/crypto_merges_clean_matrix