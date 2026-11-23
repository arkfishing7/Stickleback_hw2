#!/bin/bash
# Search for bacterial promoter elements
echo "=== Promoter Elements ==="

# -10 box (Pribnow box) TATAAT
echo "Pribnow box (TATAAT) counts:"
echo -n "E. coli: "
grep -v "^>" e.coli/ecoli_genome.fna | tr -d '\n' | grep -o "TATAAT" | wc -l

echo -n "Mycoplasma: "
grep -v "^>" Mycoplasma_genitalium/mycoplasma_genome.fna | tr -d '\n' | grep -o "TATAAT" | wc -l

# Shine-Dalgarno sequence (AGGAGG)
echo -e "Shine-Dalgarno (AGGAGG) counts:"
echo -n "E. coli: "
grep -v "^>" e.coli/ecoli_genome.fna | tr -d '\n' | grep -o "AGGAGG" | wc -l

echo -n "Mycoplasma: "
grep -v "^>" Mycoplasma_genitalium/mycoplasma_genome.fna | tr -d '\n' | grep -o "AGGAGG" | wc -l