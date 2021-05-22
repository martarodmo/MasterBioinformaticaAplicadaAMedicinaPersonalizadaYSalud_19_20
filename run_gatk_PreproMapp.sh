#!/bin/bash


module load miniconda/2.7
module load perl
source ~/.Renviron

project="/home/proyectos/bioinfo/mrod/2021/202116_fastq"
#project="/scratch/lodela/Linfomas_NextSeq500_23-09-2019"
#project="/scratch/lodela/Linfomas_NextSeq500_200420_demultiplexed_newManifest/Linfomas_NextSeq500_01-10-2020"
output="/home/proyectos/bioinfo/mrod/2021/fastq"
pipeline="/home/proyectos/bioinfo/fjd/VariantCallingFJD/pipelineFJD19.py"
#samples="/home/proyectos/bioinfo/mrod/martaLymp/results_nextseq500_2/samples.txt"
samples="/home/proyectos/bioinfo/mrod/BioinfoUnit/martaLymp/newResults_Oct20/nextseq_round4/samples.txt"

# run mapping with samples from basespase

#!/bin/bashmodule load miniconda/2.7
#python $pipeline -i $project -o $output -a mapping -b -t 4 -u martaLymp
#python $pipeline -i $project -o $output -a mapping -t 4 -u user17

# run mapping from local samples

python $pipeline -i $project -o ${output} -n Nextseq -a mapping -t 10 -M 2 -m martarodmo@gmail.com
