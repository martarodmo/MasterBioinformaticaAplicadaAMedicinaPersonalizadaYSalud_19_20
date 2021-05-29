#!/bin/bash
#SBATCH --account=bioinfo_serv
#SBATCH --partition=bioinfo
#SBATCH --job-name=htseqcount   #job name
#SBATCH --mail-type=END # Mail events (NONE, BEGIN, END, FAIL, ALL)
##SBATCH --mail-user=ldelafuente.lorena@gmail.com # Where to send mail
##SBATCH --mem-per-cpu=5gb # Per processor memory
#SBATCH --cpus-per-task=15
#SBATCH -t 15:00:00     # Walltime
#SBATCH -o %j_htseq.out # Name output file
#SBATCH --error=%j_htseq.err
##SBATCH --file=
##SBATCH --initaldir=

module load miniconda/3.6


manifest="/home/proyectos/bioinfo/mrod/2021/SS20201111.csv"
bases="/home/proyectos/bioinfo/mrod/2021/bcl_20201111_2"
output="/home/proyectos/bioinfo/NOBACKUP/mrod/fastqs/20201111"

echo bcl2fastq  --ignore-missing-bcls --ignore-missing-filter --ignore-missing-positions --ignore-missing-controls --auto-set-to-zero-barcode-mismatches --find-adapters-with-sliding-window --adapter-stringency 0.9 --mask-short-adapter-reads 35 --minimum-trimmed-read-length 35 -i ${bases}/Data/Intensities/BaseCalls/ -R $bases -o $output --loading-threads 10 --processing-threads 15 --writing-threads 10 --sample-sheet $manifest

bcl2fastq  --ignore-missing-bcls --ignore-missing-filter --ignore-missing-positions --ignore-missing-controls --auto-set-to-zero-barcode-mismatches --find-adapters-with-sliding-window --adapter-stringency 0.9 --mask-short-adapter-reads 35 --minimum-trimmed-read-length 35 -i ${bases}/Data/Intensities/BaseCalls/ -R $bases -o $output --loading-threads 10 --processing-threads 15 --writing-threads 10 --sample-sheet $manifest
