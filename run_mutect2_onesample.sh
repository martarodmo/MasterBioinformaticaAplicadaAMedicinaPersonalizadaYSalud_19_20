#!/bin/bash

# sample specific arguments
input="/home/proyectos/bioinfo/mrod/newResults_Oct20/results2"
sample="48141131"
output="/home/proyectos/bioinfo/mrod/newResults_Oct20/arifacts_results3"

# general arguments for our analysis
bedfile="/home/proyectos/bioinfo/lodela/BioinfoUnit/martaLymp/3110861_Covered.bed"
mutectscript="/home/proyectos/bioinfo/mrod/scriptsToMarta/sbatch_mutect2.sh"

# run mutectscript with using these arguments: sample, input, output, bedfile

echo sbatch  -o ${output}/mutect2_${sample}.out -e ${output}/mutect2_${sample}.err --account=bioinfo_serv --partition=fastbioinfo $mutectscript $sample $input $output $bedfile
sbatch  -o ${output}/mutect2_${sample}.out -e ${output}/mutect2_${sample}.err --account=bioinfo_serv --partition=fastbioinfo $mutectscript $sample $input $output $bedfile
