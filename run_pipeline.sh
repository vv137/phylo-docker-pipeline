#!/bin/bash
# run_pipeline.sh

set -e  # Exit on error

INPUT="input.fasta"

if [ ! -f "$INPUT" ]; then
    echo "ERROR: input.fasta not found in container working directory"
    exit 1
fi

echo "[1] Running MAFFT alignment..."
mafft --auto "$INPUT" > aligned.fasta

echo "[2] Trimming alignment using trimAl..."
trimal -in aligned.fasta -out trimmed.fasta -automated1

echo "[3] Building phylogenetic tree with FastTree..."
FastTree trimmed.fasta > tree.nwk

echo "[✔] Done! Tree saved to tree.nwk"
