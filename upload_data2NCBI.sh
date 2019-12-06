#!/bin/sh
#$ -M ming.wen@inra.fr
#$ -m be
#$ -N NCBI_data_uploading
#$ -pe parallel_smp 8


# Uploading genome assembly to NCBI (https://submit.ncbi.nlm.nih.gov/about/genome/)
/usr/local/bioinfo/src/Aspera/aspera-connect-3.5.1/bin/ascp -i /home/mwen/work/genomes/aspera.openssh -QT -l100m -k1 -d \
                                          /home/mwen/work/genomes/goldfish/upload2NCBI/assembly/Carassin_8_DiscovarDeNovo_assembly.fasta \
                                          subasp@upload.ncbi.nlm.nih.gov:uploads/673781963_qq.com_1Gd1xxkL/assembly

# Uploading SRA and RAD-seq reads to NCBI
# male genome reads (https://submit.ncbi.nlm.nih.gov/about/sra/)
/usr/local/bioinfo/src/Aspera/aspera-connect-3.5.1/bin/ascp -i /home/mwen/work/genomes/aspera.openssh -QT -l100m -k1 -d \
                                            /home/mwen/work/genomes/goldfish/upload2NCBI/genome/* \
                                            subasp@upload.ncbi.nlm.nih.gov:uploads/673781963_qq.com_1Gd1xxkL/genome_sra
# Pool-seq reads
/usr/local/bioinfo/src/Aspera/aspera-connect-3.5.1/bin/ascp -i /home/mwen/work/genomes/aspera.openssh -QT -l100m -k1 -d \
                                            /home/mwen/work/genomes/goldfish/upload2NCBI/pool/* \
                                            subasp@upload.ncbi.nlm.nih.gov:uploads/673781963_qq.com_1Gd1xxkL/genome_sra

# RAD-seq reads
/usr/local/bioinfo/src/Aspera/aspera-connect-3.5.1/bin/ascp -i /home/mwen/work/genomes/aspera.openssh -QT -l100m -k1 -d \
                                            /home/mwen/work/goldfishRad/samples/* \
                                            subasp@upload.ncbi.nlm.nih.gov:uploads/673781963_qq.com_1Gd1xxkL/genome_sra
