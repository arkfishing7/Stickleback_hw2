#!/bin/bash
# Analyze nucleotide composition of a genome

if [ $# -ne 2 ]; then
    echo "Usage: $0 <fasta_file> <organism_name>"
    exit 1
fi

FASTA=$1
NAME=$2

echo "=== Nucleotide Composition for $NAME ==="

# Count each nucleotide

echo "Nucleotide counts:"
grep -v "^>" "$FASTA" | tr -d '\n' | fold -w1 | \
  tr '[:lower:]' '[:upper:]' | sort | uniq -c

# Calculate total

TOTAL=$(grep -v "^>" "$FASTA" | tr -d '\n' | wc -c)
echo -e "\nTotal nucleotides: $TOTAL"

# Calculate GC content

GC_COUNT=$(grep -v "^>" "$FASTA" | tr -d '\n' | grep -o "[GCgc]" | wc -l)
GC_PERCENT=$(echo "scale=2; $GC_COUNT * 100 / $TOTAL" | bc)
echo "GC content: $GC_PERCENT%"

# Calculate AT content

AT_COUNT=$(grep -v "^>" "$FASTA" | tr -d '\n' | grep -o "[ATat]" | wc -l)
AT_PERCENT=$(echo "scale=2; $AT_COUNT * 100 / $TOTAL" | bc)
echo "AT content: $AT_PERCENT%"