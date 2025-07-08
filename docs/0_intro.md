# Introduction to RISK

RISK (Regional Inference of Significant Kinships) is a next-generation tool for biological network annotation and visualization. It integrates advanced clustering, statistically rigorous overrepresentation analysis, and high-resolution plotting to uncover structured relationships in complex networks.

RISK is designed to:

- Identify biologically meaningful modules in large-scale networks
- Perform fast and flexible overrepresentation testing
- Generate publication-ready visualizations
- Scale to hundreds of thousands of edges on standard hardware
- Generalize beyond biology to interdisciplinary networks

## What makes RISK different?

| Feature            | RISK                                              |
| ------------------ | ------------------------------------------------- |
| **Clustering**     | Louvain, Leiden, Markov, Spinglass, etc.          |
| **Statistics**     | Permutation, hypergeometric, chi-squared, z, etc. |
| **File Formats**   | NetworkX, Cytoscape (.cys, .cyjs), GPickle        |
| **Annotation**     | JSON, CSV, Excel, TSV, Python dict                |
| **Scalability**    | Networks with 500k+ edges on standard hardware    |
| **Visual Output**  | High-resolution SVG, PNG, PDF, etc.               |
| **Beyond Biology** | Used on physics citation network (Supp. Fig. S9)  |

## Example Applications

- Functional module identification in yeast PPI and GI networks
- Synthetic lethality pathway mapping
- Drug-target prediction via annotation overrepresentation
- Cross-domain network exploration in physics and other disciplines

For more examples, see [7. Advanced Plotting](./7_advanced_plotting.md).

---

## Full Interactive Example

For a full interactive workflow, see [tutorial.html](tutorial.html), which walks through all key steps—from loading a network to generating publication-quality figures—in a single notebook. You can also [download the notebook and data as a ZIP](tutorial.zip).

The notebook focuses on a curated yeast PPI network (Michaelis et al., 2023), filtered to retain proteins with six or more interactions (2,059 nodes, 27,690 edges). Throughout the tutorial, we showcase:

- Network clustering and module detection
- Annotation-based overrepresentation analysis
- Interactive and advanced visualization features
- Exporting parameters and reproducibility tools

This notebook complements the Markdown documentation in this repository, but does not follow a strict 1-to-1 mapping. Use it for end-to-end examples and contextual guidance.

You can also <a href="https://mybinder.org/v2/gh/riskportal/network-tutorial/HEAD?filepath=notebooks/quickstart.ipynb" target="_blank" rel="noopener">launch the Quickstart notebook on Binder</a> for a fully interactive experience without installing anything locally.

---

## Getting Started

Continue to [1. Installation](./1_installation.md) to install RISK and set up your environment.
