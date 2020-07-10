GEMMA="/resourses/gemma/gemma-0.98.1-linux-static "
inputFilesDir="/incoming_data/DTR_Genotypes_1000G_V3P5_Collab_PublicID"
qctool2="/qctool_v2.0.1-Ubuntu14.04-x86_64/qctool"

/resourses/qctool_v2.0.1-Ubuntu14.04-x86_64/qctool -g Merged.vcf.gz -ofiletype bimbam_dosage -vcf-genotype-field GP -og crypto_merged_dosage.bimbam
