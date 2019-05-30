# Crypto-GWAS

### scripts used to analysis crypto host-pathogen GWAS

### Quality control procedures for batch 1 were performed by Shichina (Kannambath, Shichina <shichina.kannambath@kcl.ac.uk>)  

### Quality control procedures for batch2 was performed in the following way:  

plink scripts are all contained therein  
Crypto_GWAS_QC_V3.Rmd  

### PCA visualization was performed in R by way of the following:  

Crypto_GWAS_QC_PCA.Rmd  

Crypto SNP array data were prepared for imputation as per this protocol:  

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

### Association analysis in Gemma was performed in the folowing way  

