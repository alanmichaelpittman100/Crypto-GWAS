#!/bin/bash


vcftools="/homes/athosnew/Genetics_Centre_Bioinformatics/resourses/vcftools/bin/vcftools"
plink="/homes/athosnew/Genetics_Centre_Bioinformatics/resourses/plink_linux_x86_64/plink"
tabix="/homes/athosnew/Genetics_Centre_Bioinformatics/resourses/tabix-0.2.6/tabix"
bgzip="/homes/athosnew/Genetics_Centre_Bioinformatics/resourses/tabix-0.2.6/bgzip"
vcf_concat="/homes/athosnew/Genetics_Centre_Bioinformatics/resourses/vcftools/bin/vcf-concat"

imputedVCFsDir="/homes/athosnew/Alan/Alan_Bioinformatics_Projects/imputation/imputed_files_from_Michigan_Imputation_Server_crypto_b2_clean/"
OutDirDir="/homes/athosnew/Alan/crypto_GWAS/Take2/b2_imputed_vcfs_HRC"


chrs="22 21 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1"

#chrs="22 21 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1"



${vcf_concat} \
 ${OutDirDir}/chr1_excluded_low_quality.recode.vcf.gz \
 ${OutDirDir}/chr2_excluded_low_quality.recode.vcf.gz \
 ${OutDirDir}/chr3_excluded_low_quality.recode.vcf.gz \
 ${OutDirDir}/chr4_excluded_low_quality.recode.vcf.gz \
 ${OutDirDir}/chr5_excluded_low_quality.recode.vcf.gz \
 ${OutDirDir}/chr6_excluded_low_quality.recode.vcf.gz \
 ${OutDirDir}/chr7_excluded_low_quality.recode.vcf.gz \
 ${OutDirDir}/chr8_excluded_low_quality.recode.vcf.gz \
 ${OutDirDir}/chr9_excluded_low_quality.recode.vcf.gz \
 ${OutDirDir}/chr10_excluded_low_quality.recode.vcf.gz \
 ${OutDirDir}/chr11_excluded_low_quality.recode.vcf.gz \
 ${OutDirDir}/chr12_excluded_low_quality.recode.vcf.gz \
 ${OutDirDir}/chr13_excluded_low_quality.recode.vcf.gz \
 ${OutDirDir}/chr14_excluded_low_quality.recode.vcf.gz \
 ${OutDirDir}/chr15_excluded_low_quality.recode.vcf.gz \
 ${OutDirDir}/chr16_excluded_low_quality.recode.vcf.gz \
 ${OutDirDir}/chr17_excluded_low_quality.recode.vcf.gz \
 ${OutDirDir}/chr18_excluded_low_quality.recode.vcf.gz \
 ${OutDirDir}/chr19_excluded_low_quality.recode.vcf.gz \
 ${OutDirDir}/chr20_excluded_low_quality.recode.vcf.gz \
 ${OutDirDir}/chr21_excluded_low_quality.recode.vcf.gz \
 ${OutDirDir}/chr22_excluded_low_quality.recode.vcf.gz | gzip -c > ${OutDirDir}/All_chr_excluded_low_quality_variants_b2.vcf.gz


exit

