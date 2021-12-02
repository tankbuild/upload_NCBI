#!/bin/sh
#SBATCH -J aspera
#SBATCH --cpus-per-task=4
#SBATCH --mem=16G
#SBATCH -o aspera.output
#SBATCH -e aspera.error


# Uploading genome assembly to NCBI (https://submit.ncbi.nlm.nih.gov/about/genome/)
/home/aherpin/.aspera/connect/bin/ascp -i /home/aherpin/work/genomes/aspera.openssh -QT -l100m -k1 -d \
                                          /home/aherpin/work/genomes/goldfish/upload2NCBI/assembly/Carassin_8_DiscovarDeNovo_assembly.fasta \
                                          subasp@upload.ncbi.nlm.nih.gov:uploads/673781963_qq.com_1Gd1xxkL/assembly

# Uploading SRA and RAD-seq reads to NCBI
# male genome reads (https://submit.ncbi.nlm.nih.gov/about/sra/)
/home/aherpin/.aspera/connect/bin/ascp -i /home/aherpin/work/genomes/aspera.openssh -QT -l100m -k1 -d \
                                            /home/aherpin/work/genomes/goldfish/upload2NCBI/genome/* \
                                            subasp@upload.ncbi.nlm.nih.gov:uploads/673781963_qq.com_1Gd1xxkL/genome_sra
# Pool-seq reads
/home/aherpin/.aspera/connect/bin/ascp -i /home/aherpin/work/genomes/aspera.openssh -QT -l100m -k1 -d \
                                            /home/aherpin/work/genomes/goldfish/upload2NCBI/pool/* \
                                            subasp@upload.ncbi.nlm.nih.gov:uploads/673781963_qq.com_1Gd1xxkL/genome_sra

# RAD-seq reads
/home/aherpin/.aspera/connect/bin/ascp -i /home/aherpin/work/genomes/aspera.openssh -QT -l100m -k1 -d \
                                            /home/aherpin/work/goldfishRad/samples/* \
                                            subasp@upload.ncbi.nlm.nih.gov:uploads/673781963_qq.com_1Gd1xxkL/genome_sra
