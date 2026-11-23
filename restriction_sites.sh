#!/bin/bash
# Count common restriction enzyme sites

if [ $# -ne 2 ]; then
    echo "Usage: $0 <fasta_file> <organism_name>"
    exit 1
fi

FASTA=$1
NAME=$2

echo "=== Restriction Sites in $NAME ==="
echo "Enzyme  | Site    | Count"
echo "--------|---------|-------"

# Common 6-cutters
echo -n "EcoRI   | GAATTC  | "
grep -v "^>" "$FASTA" | tr -d '\n' | grep -o "GAATTC" | wc -l

echo -n "BamHI   | GGATCC  | "
grep -v "^>" "$FASTA" | tr -d '\n' | grep -o "GGATCC" | wc -l

echo -n "HindIII | AAGCTT  | "
grep -v "^>" "$FASTA" | tr -d '\n' | grep -o "AAGCTT" | wc -l

echo -n "PstI    | CTGCAG  | "
grep -v "^>" "$FASTA" | tr -d '\n' | grep -o "CTGCAG" | wc -l

echo -n "SalI    | GTCGAC  | "
grep -v "^>" "$FASTA" | tr -d '\n' | grep -o "GTCGAC" | wc -l

echo -n "XbaI    | TCTAGA  | "
grep -v "^>" "$FASTA" | tr -d '\n' | grep -o "TCTAGA" | wc -l