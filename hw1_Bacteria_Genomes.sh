#!/bin/bash
# Homework problem one


cd ~/Alexhw1/inputs/e.coli
ls -lh *.gz
echo "=== E. coli genome preview ==="
gzcat ./ecoli_genome.fna.gz | head -10
echo -e "\nE. coli sequences: $(zgrep -c '^>' ./ecoli_genome.fna.gz)"

cd ../Mycoplasma_genitalium
ls -lh *.gz
echo -e "\n=== Mycoplasma genome preview ==="
gzcat ./mycoplasma_genome.fna.gz | head -10
echo "Mycoplasma sequences: $(zgrep -c '^>' ./mycoplasma_genome.fna.gz)"

cd ..
gunzip -k e.coli/*.gz
ls -lh e.coli/*.fna
gunzip -k Mycoplasma_genitalium/*.gz
ls -lh Mycoplasma_genitalium/*.fna

echo "E. coli genes: $(grep -c '^>' e.coli/ecoli_cds.fna)"
echo "Mycoplasma genes: $(grep -c '^>' Mycoplasma_genitalium/mycoplasma_cds.fna)"

cd ../scripts
chmod u+x nucleotide_composition.sh
ls -l

../scripts/nucleotide_composition.sh ../inputs/e.coli/ecoli_genome.fna "E. coli" \
  > ../results/ecoli_nucleotides.txt

cat ../results/ecoli_nucleotides.txt
echo ""

../scripts/nucleotide_composition.sh ../inputs/Mycoplasma_genitalium/mycoplasma_genome.fna "Mycoplasma genitalium" \
  > ../results/Mycoplasma_genitalium_nucleotides.txt
cat ../results/Mycoplasma_genitalium_nucleotides.txt
echo ""

chmod u+x restriction_sites.sh
ls -l

../scripts/restriction_sites.sh ../inputs/e.coli/ecoli_genome.fna "E. coli" \
  > ../results/ecoli_restriction.txt

../scripts/restriction_sites.sh ../inputs/Mycoplasma_genitalium/mycoplasma_genome.fna "Mycoplasma genitalium" \
  > ../results/mycoplasma_restriction.txt

cat ../results/ecoli_restriction.txt
echo ""
cat ../results/mycoplasma_restriction.txt
echo ""

chmod u+x promotor_elements.sh
ls -l

../scripts/promotor_elements.sh ../inputs/e.coli/ecoli_genome.fna "E. coli" \
  > ../results/ecoli_promotor.txt

../scripts/promotor_elements.sh ../inputs/Mycoplasma_genitalium/mycoplasma_genome.fna "Mycoplasma genitalium" \
  > ../results/mycoplasma_promotor.txt

cat ../results/ecoli_promotor.txt
echo ""
cat ../results/mycoplasma_promotor.txt
echo ""