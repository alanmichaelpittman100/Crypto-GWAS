# Crypto-GWAS

### scripts used to analysis crypto host-pathogen GWAS

### Quality control procedures for batch 1 were performed by Shichina (Kannambath, Shichina <shichina.kannambath@kcl.ac.uk>)  

### Quality control procedures for batch2 was performed in the following way:  

plink scripts are all contained therein  
Crypto_GWAS_QC_V3.Rmd  

### PCA visualization was performed in R by way of the following:  

Crypto_GWAS_QC_PCA.Rmd  

### Crypto SNP array data were prepared for imputation as per this protocol:  

https://github.com/alanmichaelpittman100/GWAS-Imputation-Protocol-  

### Batches 1 and 2 were imputed separately and post imputation QC was performed separately with the following:  

run_Post_impuation_quality_control_b1.sh  
run_Post_impuation_quality_control_b2.sh  

### Post QC chromosome VCFs were merged as follows:  

run_Post_impuation_quality_control_b1_cat_vcfs.sh  
run_Post_impuation_quality_control_b2_cat_vcfs.sh  

### Final union of datasets was achieved as follows:  

./bcftools merge All_chr_B1_imputed.vcf.gz All_chr_B2_imputed.vcf.gz -o Merged.vcf.gz -O z

### Merged VCF was converted to BIMBAM format:  

run_vcf_to_BIMBAM.sh  

### Relationship matrix was calculated in GEMMA in the folowing way:  

https://github.com/genetics-statistics/GEMMA  

run_Calculate_Relationship_Matrix.sh  

### 15 PCs to act as covariates were calculated in GCTA in the folowing way: 

#### clean  
/homes/athosnew/Genetics_Centre_Bioinformatics/resourses/plink_linux_x86_64/plink --bfile merged_in_plink_format --geno 0.03 --maf 0.05 --hwe 0.001 --make-bed --out merged_in_plink_format_CLEAN  
#### prune_LD_SNPS  
/homes/athosnew/Genetics_Centre_Bioinformatics/resourses/plink_linux_x86_64/plink --bfile merged_in_plink_format_CLEAN --indep-pairwise 50 5 0.5 --out merged_in_plink_format_CLEAN_prune  

/homes/athosnew/Genetics_Centre_Bioinformatics/resourses/plink_linux_x86_64/plink --bfile merged_in_plink_format_CLEAN  --extract merged_in_plink_format_CLEAN_prune.prune.in --make-bed --out merged_in_plink_format_CLEAN_pruned  


#### GCTA_PCA_analysis
/homes/athosnew/Genetics_Centre_Bioinformatics/resourses/gcta_1.91.5beta/gcta64 --bfile merged_in_plink_format_CLEAN_pruned --make-grm --autosome --thread-num 10 --out merged_in_plink_format_CLEAN_pruned_PCA_Matrix  
/homes/athosnew/Genetics_Centre_Bioinformatics/resourses/gcta_1.91.5beta/gcta64 --grm merged_in_plink_format_CLEAN_pruned_PCA_Matrix --pca 15 --out merged_in_plink_format_CLEAN_pruned_PCA_Matrix_PCs

### Association analysis in Gemma was performed in the folowing way:  

https://github.com/genetics-statistics/GEMMA  

1) Using 15 PCs as covariates  

runAssociation_analysis_GEMMA.sh  

2) Using 4 PCs as covariates  

