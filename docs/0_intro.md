# Introduction to RISK

RISK (Regional Inference of Significant Kinships) is a next-generation tool for biological network annotation and visualization. It integrates community detection algorithms, statistically rigorous overrepresentation analysis, and high-resolution visualization to uncover structured relationships in complex networks.

RISK is designed to:

- Identify biologically coherent modules in large-scale networks
- Perform fast and flexible overrepresentation testing
- Generate publication-ready visualizations
- Scale to networks with hundreds of thousands of edges on standard hardware
- Generalize beyond biology to interdisciplinary networks

## What makes RISK different?

| Feature            | RISK                                                  |
| ------------------ | ----------------------------------------------------- |
| **Clustering**     | Louvain, Leiden, Markov, Spinglass, etc.              |
| **Statistics**     | Permutation, hypergeometric, chi-squared, z, etc.     |
| **File Formats**   | NetworkX, Cytoscape (.cys, .cyjs), GPickle            |
| **Annotation**     | JSON, CSV, Excel, TSV, Python dict                    |
| **Scalability**    | Networks with 500k+ edges on standard hardware        |
| **Visual Output**  | High-resolution SVG, PNG, PDF                         |
| **Beyond Biology** | Applied to a physics citation network (Supp. Fig. S7) |

## Example Applications

- Functional module identification in yeast PPI and GI networks
- Pathway mapping for synthetic lethality analyses
- Drug–target prediction via annotation overrepresentation
- Cross-domain network exploration in physics and other disciplines

---

## Full Interactive Example

For a complete workflow, see [tutorial.html](tutorial.html), which demonstrates all key steps—from loading a network to generating publication-ready figures—in a single notebook. You can also [download the notebook and data as a ZIP](tutorial.zip).

The tutorial applies RISK to the _Saccharomyces cerevisiae_ protein–protein interaction (PPI) network (Michaelis _et al._, 2023; 3,839 nodes, 30,955 edges). It illustrates:

- Network clustering and module detection
- Annotation-based overrepresentation analysis
- Advanced visualization and interactive exploration
- Parameter export and reproducibility tools

This notebook complements the Markdown documentation in this repository. Use it for end-to-end examples and contextual guidance.

You can also <a href="https://mybinder.org/v2/gh/riskportal/network-tutorial/HEAD?filepath=notebooks/quickstart.ipynb" target="_blank" rel="noopener">launch the Quickstart notebook on Binder</a> for an interactive session without local installation.
