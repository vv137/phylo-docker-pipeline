# Phylogenetic Tree Pipeline (Docker)

This repository provides a simple, Dockerized pipeline to construct phylogenetic trees from protein sequences using:

- **MAFFT** for multiple sequence alignment
- **trimAl** for alignment trimming
- **FastTree** for phylogenetic tree inference

Everything runs automatically inside a Docker container with a single command.

---

## 📦 Requirements

- [Docker](https://www.docker.com/) installed on your system
- A FASTA file containing protein sequences named `input.fasta`

---

## 🚀 Quick Start

1. **Clone or download** this project and navigate into the directory:

   ```bash
   cd phylo_project
   ```

1. **Place your protein sequences** in a file named `input.fasta` in this directory.

1. **Build the Docker image:**

   ```bash
   docker build -t phylo-tools .
   ```

1. **Run the pipeline:**

   ```bash
   docker run --rm -v "$PWD":/data phylo-tools
   ```

## 📂 Output Files

After running, the following files will be generated in your project folder:

| File            | Description                        |
| --------------- | ---------------------------------- |
| `aligned.fasta` | MAFFT-aligned sequences            |
| `trimmed.fasta` | Cleaned alignment from trimAl      |
| `tree.nwk`      | Phylogenetic tree in Newick format |

You can visualize `tree.nwk` using tools like [iTOL](https://itol.embl.de/
) or [FigTree](https://github.com/rambaut/figtree).

🛠 Tools Used

- MAFFT
- trimAI
- FastTree

## 📜 License

This project is open-source and free to use under the MIT License.
