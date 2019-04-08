#!/bin/bash

plink="/homes/athosnew/Genetics_Centre_Bioinformatics/resourses/plink_linux_x86_64/plink"

imputed_vcf_dir="/homes/athosnew/Alan/crypto_GWAS/merged_imputed/raw_imputed"
plinkout="/homes/athosnew/Alan/crypto_GWAS/post_imputation_QC/plink_output"
post_imputation_QC="/homes/athosnew/Alan/crypto_GWAS/post_imputation_QC"

for chnum in {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22};
  do
	gunzip $imputed_vcf_dir/chr$chnum.info.gz
	$plink --vcf $imputed_vcf_dir/chr$chnum.dose.vcf.gz --make-bed --biallelic-only --out s1
	$plink --bfile s1 --bmerge s1 --merge-mode 6
	$plink --bfile s1 --exclude plink.missnp --make-bed --out s2
	$plink --bfile s2 --list-duplicate-vars
	$plink --bfile s2 --exclude plink.dupvar --make-bed --out s3
	$plink --bfile s3 --qual-scores $imputed_vcf_dir/chr$chnum.info 7 1 1 --qual-threshold 0.3 --make-bed --out $plinkout/chr$chnum
done

#create file merge.list that contains the directory of each chromosome
#plink --bfile ../plinkout/1 merge-list merge.list --make-bed --out imputepostqc

/homes/athosnew/Genetics_Centre_Bioinformatics/resourses/plink_linux_x86_64/plink --merge-list file_list.txt --make-bed --out crypto_merged_imputed_postQC

#then what? to gemma ??

#I believe you can also do this in order to only get biallelic variants:
#plink --vcf chr$chnum.dose.vcf.gz --make-bed --double-id --biallelic-only  --out s1