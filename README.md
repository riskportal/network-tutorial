# RISK Network Tutorial

<p align="center">
  <img src="https://i.imgur.com/8TleEJs.png" width="50%" alt="RISK Network logo" />
</p>

<br>

![Python](https://img.shields.io/badge/python-3.8%2B-yellow)
![License](https://img.shields.io/badge/license-GPLv3-purple)
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.xxxxxxx.svg)](https://doi.org/10.5281/zenodo.xxxxxxx)
![Platforms](https://img.shields.io/badge/platform-linux%20%7C%20macos%20%7C%20windows-lightgrey)

**RISK Network Tutorial** offers a detailed guide on using **RISK** (Regional Inference of Significant Kinships), a next-generation tool for biological network annotation and visualization. This guide details key functionalities and practical applications for network analysis using RISK.

## Key Features of RISK

- Clustering Algorithms: Implements Louvain, Leiden, Markov Clustering, Greedy Modularity, Label Propagation, Spinglass, and Walktrap to identify structured network regions.
- Statistical Analysis: Includes hypergeometric, permutation, binomial, chi-squared, Poisson, and z-score tests to assess functional enrichment with statistical rigor.
- Supports multiple file formats: Compatible with JSON, CSV, Cytoscape, and GPickle formats.
- Publication-Ready Visualizations: Customizable figures with kernel density estimate overlays, node/edge adjustments, and high-resolution exports in multiple formats, including SVG, PNG, and PDF.

## Yeast Interactome Network Demonstration

In this demonstration, we use the yeast interactome network published by Michaelis et al. (2023), which contains 3,927 proteins and 31,004 interactions. We filtered the dataset to retain proteins with six or more interactions, emphasizing core functional interactions. The final dataset contains 2,059 nodes and 27,690 edges. RISK is applied to perform analyses such as network clustering and statistical overrepresentation of annotations.

Below is a visual representation of the yeast protein–protein interaction network, annotated with **Gene Ontology Biological Processes (GO BP)** terms:

![[Figure 1](https://i.imgur.com/lJHJrJr.jpeg)](https://i.imgur.com/lJHJrJr.jpeg)

## Party and Date Hubs

RISK also identifies [**party hubs** and **date hubs**](https://www.nature.com/articles/nature02555.pdf), two distinct types of central nodes in the network. Party hubs (orange) are highly connected proteins that interact with many partners simultaneously, often forming stable protein complexes. In contrast, date hubs (cyan) connect with different partners at different times or conditions, playing roles in dynamic regulatory interactions. This visualization highlights party and date hubs in the yeast network:

<p align="center">
  <img src="https://i.imgur.com/ghXLwP0.png" width="75%" alt="Party and Date Hubs" />
</p>

The **GO BP contour overlay** highlights the spatial organization of biological processes, providing additional context for interpreting these hubs.

## Setting Up Python and Jupyter for RISK

<details>

<summary><strong>Step 1: Install Python 3.8+</strong></summary>

<br>

Download and install Python 3.8 or later (recommended) from the official [Python website](https://www.python.org/downloads/). RISK is tested on Python 3.8–3.11.

- On Windows, ensure you check the box that says **Add Python to PATH** during installation. If you missed this step, follow this [guide](https://datatofish.com/add-python-to-windows-path/) to manually set the PATH.

</details>

<details>

<summary><strong>Step 2: Create a Virtual Environment (Optional but Recommended)</strong></summary>

<br>

Set up a virtual environment to manage dependencies for RISK:

- **For Windows:**
    ```bash
    python -m venv risk-env
    risk-env\Scripts\activate
    ```

- **For macOS/Linux:**
    ```bash
    python3 -m venv risk-env
    source risk-env/bin/activate
    ```

</details>

<details>

<summary><strong>Step 3: Configure Jupyter to Use the Virtual Environment</strong></summary>

<br>

Follow this [guide](https://janakiev.com/blog/jupyter-virtual-envs/) to link your virtual environment with Jupyter.

After setup, select the virtual environment in Jupyter Notebook:

1. Click **Kernel** in the menu.
2. Choose **Change kernel**.
3. Select your virtual environment (e.g., `risk-env`).

</details>

<details>

<summary><strong>Step 4: Install Jupyter</strong></summary>

<br>

With your virtual environment activated, install Jupyter Notebook:

```bash
pip install jupyter
```

</details>

<details>

<summary><strong>Step 5: Install RISK</strong></summary>

<br>

To install the latest version of RISK, run:

```bash
pip install risk-network --upgrade
```

</details>

<details>

<summary><strong>Step 6: Launch Jupyter Notebook</strong></summary>

<br>

Start Jupyter Notebook to run the RISK tutorial:

```bash
jupyter notebook
```

</details>

## RISK Source Code

RISK’s source code is available [here](https://github.com/riskportal/network).  

## Citation

If you use RISK in your research, please cite:

**Horecka et al.**, "RISK: a next-generation tool for biological network annotation and visualization", **Bioinformatics**, 2025. DOI: [10.1234/zenodo.xxxxxxx](https://doi.org/10.1234/zenodo.xxxxxxx)

## License

This tutorial follows the [MIT License](https://raw.githubusercontent.com/riskportal/network-tutorial/refs/heads/main/LICENSE).
