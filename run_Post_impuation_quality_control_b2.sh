#!/bin/bash


vcftools="/homes/athosnew/Genetics_Centre_Bioinformatics/resourses/vcftools/bin/vcftools"
plink="/homes/athosnew/Genetics_Centre_Bioinformatics/resourses/plink_linux_x86_64/plink"
tabix="/homes/athosnew/Genetics_Centre_Bioinformatics/resourses/tabix-0.2.6/tabix"
bgzip="/homes/athosnew/Genetics_Centre_Bioinformatics/resourses/tabix-0.2.6/bgzip"
vcf_concat="/homes/athosnew/Genetics_Centre_Bioinformatics/resourses/vcftools/perl/vcf-concat"
bgzip="/homes/athosnew/Genetics_Centre_Bioinformatics/resourses/tabix-0.2.6/bgzip"

imputedVCFsDir="/homes/athosnew/Alan/Alan_Bioinformatics_Projects/imputation/imputed_files_from_Michigan_Imputation_Server_crypto_b2_clean/"
OutDirDir="/homes/athosnew/Alan/crypto_GWAS/Take2/b2_imputed_vcfs_HRC"


chrs="22 21 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1"

#chrs="22 21 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1"

for chr in $chrs; do

	#chr1.dose.vcf.gz
    
	# Extract the r2 metric from INFO file for ALL variants
	
	gunzip -c $imputedVCFsDir/chr${chr}.info.gz > $OutDirDir/chr${chr}.info

    # Write a list of variants with r2 metric < 0.3cd j	
    #awk '$NF < 0.3' ${OutDirDir}/chr${chr}.INFO | cut -f 1-2 > ${OutDirDir}/chr${chr}_ExcludePositions.txt
	
	#awk '{print $8}' chr22.info
	
	awk '$7 < 0.8 {print $1}' $OutDirDir/chr${chr}.info | cut -f 1-2 > $OutDirDir/exclusions_chr${chr}.txt

    # Call VCFtools to exclude those variants by position
    $vcftools --gzvcf $imputedVCFsDir/chr${chr}.dose.vcf.gz --exclude $OutDirDir/exclusions_chr${chr}.txt \
	--recode --out ${OutDirDir}/chr${chr}_excluded_low_quality

    # Filter out multiallelic variants, set to missing calls with <90% posterior probability, then make plink binary file
    #$plink  --vcf ${OutDirDir}/chr${chr}_clean.recode.vcf --double-id \
	#--biallelic-only strict list --vcf-min-gp 0.9 --make-bed --out ${OutDirDir}/chr${chr}

	rm $OutDirDir/chr${chr}.info $OutDirDir/exclusions_chr${chr}.txt

done

for chr in $chrs; do

	$bgzip ${OutDirDir}/chr${chr}_excluded_low_quality.recode.vcf
	$tabix ${OutDirDir}/chr${chr}_excluded_low_quality.recode.vcf.gz

done

exit

