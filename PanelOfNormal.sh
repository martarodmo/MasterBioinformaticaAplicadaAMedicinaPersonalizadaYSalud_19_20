#!/bin/bash

# sample specific arguments
input=""
output=""


#Step 2. Create a file ending with .args or .list extension with the paths to the VCFs from step 1 (Run Mutect2), one per line.



     normal1_for_pon.vcf.gz
     normal2_for_pon.vcf.gz
     normal3_for_pon.vcf.gz

 
#Step 3. Combine the normal calls using CreateSomaticPanelOfNormals.

 gatk CreateSomaticPanelOfNormals \
   -vcfs normals_for_pon_vcf.args \
   -O pon.vcf.gz
 


gatk CreateSomaticPanelOfNormals \
   -vcfs normal1_for_pon_vcf.gz \
   -vcfs normal2_for_pon_vcf.gz \
   -vcfs normal3_for_pon_vcf.gz \
   -O pon.vcf.gz






gatk Mutect2 -R reference.fasta -I normal1.bam -max-mnp-distance 0 -O normal1.vcf.gz 




gatk GenomicsDBImport -R reference.fasta -L intervals.interval_list \
       --genomicsdb-workspace-path pon_db \
       -V normal1.vcf.gz \
       -V normal2.vcf.gz \
       -V normal3.vcf.gz
  




 gatk CreateSomaticPanelOfNormals -R reference.fasta -V gendb://pon_db -O pon.vcf.gz
