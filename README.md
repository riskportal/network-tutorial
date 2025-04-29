# RISK Network Tutorial

<p align="center">
  <img src="https://i.imgur.com/8TleEJs.png" width="50%" alt="RISK Network logo" />
</p>

<br>

![Python](https://img.shields.io/badge/python-3.8%2B-yellow)
[![Licence](https://img.shields.io/badge/license-GPLv3-purple.svg)](https://raw.githubusercontent.com/riskportal/network-tutorial/main/LICENSE)
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.xxxxxxx.svg)](https://doi.org/10.5281/zenodo.xxxxxxx)

**RISK Network Tutorial** offers a detailed guide on using **RISK** (Regional Inference of Significant Kinships), a next-generation tool for biological network annotation and visualization. This guide details key functionalities and practical applications for network analysis using RISK.

- **Full Documentation:** [riskportal.github.io/network-tutorial](https://riskportal.github.io/network-tutorial)
- **Source Code:** [github.com/riskportal/network](https://github.com/riskportal/network)
- **Interactive Quickstart:** [![Launch in Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/riskportal/network-tutorial/HEAD?filepath=notebooks/quickstart.ipynb)

## Key Features of RISK

Launch RISK tutorial instantly in Binder to interactively explore the workflow and analyses without any installation required.

- Clustering Algorithms: Implements Louvain, Leiden, Markov Clustering, Greedy Modularity, Label Propagation, Spinglass, and Walktrap to identify structured network regions.
- Statistical Analysis: Includes hypergeometric, permutation, binomial, chi-squared, Poisson, and z-score tests to assess annotation overrepresentation and significance.
- Supports multiple file formats: Compatible with JSON, CSV, Cytoscape, and GPickle formats.
- Publication-Ready Visualizations: Customizable figures with kernel density estimate overlays, node/edge adjustments, and high-resolution exports in multiple formats, including SVG, PNG, and PDF.

## Yeast Protein–Protein Interaction (PPI) Network Demonstration

In this demonstration, we use the yeast PPI network published by Michaelis et al. (2023), which contains 3,927 proteins and 31,004 interactions. We filtered the dataset to retain proteins with six or more interactions, emphasizing core functional interactions. The final dataset contains 2,059 nodes and 27,690 edges. RISK is applied to perform analyses such as network clustering and statistical overrepresentation of annotations.

Below is a visual representation of the yeast PPI interaction network, annotated with **Gene Ontology Biological Processes (GO BP)** terms:

[![Yeast PPI network annotated with GO BP terms](https://i.imgur.com/lJHJrJr.jpeg)](https://i.imgur.com/lJHJrJr.jpeg)

## Party and Date Hubs

RISK also identifies [**party hubs** and **date hubs**](https://www.nature.com/articles/nature02555.pdf), two distinct types of central nodes in the network. Party hubs (orange) are highly connected proteins that interact with many partners simultaneously, often forming stable protein complexes. In contrast, date hubs (cyan) connect with different partners at different times or conditions, playing roles in dynamic regulatory interactions. This visualization highlights party and date hubs in the yeast network:

<p align="center">
  <img src="https://i.imgur.com/ghXLwP0.png" width="75%" alt="Party and Date Hubs" />
</p>

The **GO BP contour overlay** highlights the spatial organization of biological processes, providing additional context for interpreting these hubs. For a full demonstration of this analysis, please refer to the [Quickstart Tutorial](notebooks/quickstart.ipynb), which can be downloaded and run locally.

## Setting Up Python and Jupyter for RISK

<details>

<summary><strong>Step 1: Install Python 3.8+</strong></summary>

<br>

Download and install Python 3.8 or later (recommended) from the official [Python website](https://www.python.org/downloads/). RISK is tested on Python 3.8–3.12.

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

<summary><strong>Step 5: Clone Repository</strong></summary>

<br>

To install the dependencies for this tutorial, run:

```bash
git clone https://github.com/riskportal/network-tutorial.git
cd network-tutorial
```

</details>

<details>

<summary><strong>Step 6: Install Dependencies</strong></summary>

<br>

To install the dependencies for this tutorial, run:

```bash
pip install -r requirements.txt
```

</details>

<details>

<summary><strong>Step 7: Launch Jupyter Notebook</strong></summary>

<br>

Start Jupyter Notebook to run the RISK tutorial:

```bash
jupyter notebook
```

</details>

## Citation

If you use RISK in your research, please cite:

**Horecka et al.**, "RISK: a next-generation tool for biological network annotation and visualization", **Bioinformatics**, 2025. DOI: [10.5281/zenodo.xxxxxxx](https://doi.org/10.5281/zenodo.xxxxxxx)

## License

This tutorial follows the [GPLv3 License](https://www.gnu.org/licenses/gpl-3.0.en.html).
