# Introduction to RISK

RISK (Regional Inference of Significant Kinships) is a next-generation tool for biological network annotation and visualization. It integrates advanced clustering, statistically rigorous overrepresentation analysis, and high-resolution plotting to uncover structured relationships in complex networks.

RISK is designed to:

- Identify biologically meaningful modules in large-scale networks
- Perform fast and flexible enrichment testing
- Generate publication-ready visualizations
- Scale to hundreds of thousands of edges on standard hardware
- Generalize beyond biology to interdisciplinary networks

## What makes RISK different?

| Feature                    | RISK                                      |
|---------------------------|-------------------------------------------|
| **Clustering**            | Louvain, Leiden, Markov, Spinglass, more |
| **Statistics**            | Permutation, hypergeometric, chi-squared, z, etc. |
| **File Formats**          | NetworkX, Cytoscape (.cys, .cyjs), GPickle |
| **Annotations**           | JSON, CSV, Excel, TSV, Python dict        |
| **Scalability**           | Networks with 500k+ edges                 |
| **Visual Output**         | High-resolution SVG, PNG, PDF             |
| **Beyond Biology**        | Used on citation networks (Supp. Fig. S9) |

## Example Applications

- Functional module identification in yeast PPI and GI networks
- Synthetic lethality pathway mapping
- Drug-target prediction via annotation enrichment
- Cross-domain network exploration in physics and other disciplines

For more examples, see [7. Advanced Plotting](./7_advanced_plotting.md).

---

## Full Interactive Example

If you prefer an interactive, all-in-one workflow, see [quickstart.ipynb](https://github.com/riskportal/network-tutorial/blob/main/quickstart.ipynb). It walks through all key steps—from loading a network to generating publication-quality figures—in a single notebook.

The notebook focuses on a curated yeast PPI network (Michaelis et al., 2023), filtered to retain proteins with six or more interactions (2,059 nodes, 27,690 edges). Throughout the tutorial, we showcase:

- Network clustering and module detection
- Annotation-based enrichment analysis
- Interactive and advanced visualization features
- Exporting parameters and reproducibility tools

This notebook complements the Markdown documentation in this repository, but does not follow a strict 1-to-1 mapping. Use it for end-to-end examples and contextual guidance. The notebook covers the following topics, each reflected in this documentation:

0. Installing RISK  
1. Importing RISK  
2. Initializing RISK  
3. Network Input  
4. Annotations  
5. Statistical Tests  
6. Graph Analysis  
7. Visualization  
8. Parameters  
9. Advanced Plotting

---

## Getting Started

Continue to [Installation](./1_installation.md) to install RISK and set up your environment.
