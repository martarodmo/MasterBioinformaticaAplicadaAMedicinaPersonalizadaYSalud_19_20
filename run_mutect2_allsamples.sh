#!/bin/bash


# sample specific arguments
input="/home/proyectos/bioinfo/mrod/newResults_Oct20/results2"
output="/home/proyectos/bioinfo/mrod/newResults_Oct20/artifacts_results"


# general arguments for our analysis
bedfile="/home/proyectos/bioinfo/lodela/BioinfoUnit/martaLymp/3110861_Covered.bed"
mutectscript="/home/proyectos/bioinfo/mrod/scriptsToMarta/sbatch_mutect2.sh"


# run mutectscript with using these arguments: sample, input, output, bedfile
for file in "$input"/*.bam; do
    file_name=`basename $file` 
    sample=`echo $file_name | cut -d'_' -f 1`
    #echo $sample
    #sample="B19335725"
    echo sbatch  -o ${output}/mutect2_${sample}.out -e ${output}/mutect2_${sample}.err --account=bioinfo_serv --partition=fastbioinfo $mutectscript $sample $input $output $bedfile
    sbatch  -o ${output}/mutect2_${sample}.out -e ${output}/mutect2_${sample}.err --account=bioinfo_serv --partition=fastbioinfo $mutectscript $sample $input $output $bedfile
done
