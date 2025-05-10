#!/bin/bash
# run_pipeline.sh

set -e  # Stop script on any error

INPUT="input.fasta"

# Check if the input file exists
if [ ! -f "$INPUT" ]; then
    echo "ERROR: input.fasta not found in /data"
    exit 1
fi

echo "[1] Running MAFFT alignment..."
mafft --auto "$INPUT" > aligned.fasta

echo "[2] Trimming alignment using trimAl..."
trimal -in aligned.fasta -out trimmed.fasta -automated1

echo "[3] Building phylogenetic tree with FastTree..."
FastTree -protein trimmed.fasta > tree.nwk

echo "[✔] Done! Phylogenetic tree saved to tree.nwk"

