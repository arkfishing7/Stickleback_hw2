#!/bin/bash
# Homework set up

mkdir -p ~/Alexhw1/{inputs/{e.coli,Mycoplasma_genitalium,hydrogel},results/hydrogel/{figures,tables},scripts}

cd ~/Alexhw1/inputs/e.coli

curl -o ecoli_genome.fna.gz \
  https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/005/845/GCF_000005845.2_ASM584v2/GCF_000005845.2_ASM584v2_genomic.fna.gz

curl -o ecoli_cds.fna.gz \
  https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/005/845/GCF_000005845.2_ASM584v2/GCF_000005845.2_ASM584v2_cds_from_genomic.fna.gz

cd ../Mycoplasma_genitalium

curl -o mycoplasma_genome.fna.gz \
  https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/027/325/GCF_000027325.1_ASM2732v1/GCF_000027325.1_ASM2732v1_genomic.fna.gz

curl -o mycoplasma_cds.fna.gz \
  https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/027/325/GCF_000027325.1_ASM2732v1/GCF_000027325.1_ASM2732v1_cds_from_genomic.fna.gz

cd ../hydrogel

curl -L -o Hydrogel_BMP2_release.csv https://wcresko.github.io/BioE_Comp_Tools_Fa2026/Data_Folder/Hydrogel_BMP2_release.csv

cd ~/Alexhw1/scripts

curl -L -o nucleotide_composition.sh https://raw.githubusercontent.com/arkfishing7/comp_tools/main/nucleotide_composition.sh
curl -L -o promotor_elements.sh https://raw.githubusercontent.com/arkfishing7/comp_tools/main/promotor_elements.sh
curl -L -o restriction_sites.sh https://raw.githubusercontent.com/arkfishing7/comp_tools/main/restriction_sites.sh
