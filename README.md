# RISK Examples

[![pypiv](https://img.shields.io/pypi/v/risk-network.svg)](https://pypi.python.org/pypi/risk-network)
[![Python 3.7+](https://img.shields.io/badge/python-3.8+-blue.svg)](https://www.python.org/downloads/)
[![Licence](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/irahorecka/chrono24/main/LICENSE)

This repository contains a Jupyter notebook that demonstrates how to use the **RISK** Python package for biological network analysis. The example provides practical insights into analyzing and visualizing complex biological networks using **RISK**.

![Yeast Interactome Network Demo](./docs/github/network.png)

## Features
- A Jupyter notebook with a step-by-step tutorial.
- Demonstration using a real-world biological dataset, specifically the Michaelis 2023 yeast interactome network.

## Getting Started
Clone this repository and explore the notebook to see how **RISK** can be applied to your own biological network analysis projects.

## Requirements
- Python 3.8+
- **RISK** package installed with:
  ```bash
  pip install risk-network==0.0.6b10
  ```

## Usage
Simply open the Jupyter notebook (`examples.ipynb`) to get started.

## For New Users
If you're new to Python or Jupyter Notebook, here are some resources to help you set up your environment:
- [Download Python](https://www.python.org/downloads/)
- [Install Jupyter Notebook](https://jupyter.org/install)
- [Jupyter Notebook Quick Start Guide](https://jupyter-notebook-beginner-guide.readthedocs.io/en/latest/)

## Demonstration Using the Yeast Interactome Network
In this notebook, we utilize the comprehensive yeast interactome network published by Michaelis et al. in 2023. This dataset offers a highly structured interactome of *Saccharomyces cerevisiae*, consisting of 3,927 proteins connected by 31,004 interactions. The network is particularly valuable for exploring complex biological systems and understanding protein interactions at a large scale.

By applying the **RISK** package to this yeast interactome network, we demonstrate how to perform various analyses, including network clustering, interaction mapping, and identification of key protein complexes. This example showcases the power of **RISK** in handling and deriving insights from large-scale biological networks.

**Importantly, this specific analysis and demonstration using the yeast interactome network has not been done before.** This makes our exploration both novel and uniquely valuable for researchers working in systems biology and proteomics.

## License
This project is licensed under the MIT License.
