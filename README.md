# RISK Network Tutorial

<p align="center">
  <img src="https://i.imgur.com/8TleEJs.png" width="50%" alt="RISK Network logo" />
</p>

<br>

![Python](https://img.shields.io/badge/python-3.8%2B-yellow)
![License](https://img.shields.io/badge/license-GPLv3-purple)
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.xxxxxxx.svg)](https://doi.org/10.5281/zenodo.xxxxxxx)
![Platforms](https://img.shields.io/badge/platform-linux%20%7C%20macos%20%7C%20windows-lightgrey)

This repository provides an in-depth guide to **RISK**, a next-generation tool for network analysis and visualization. RISK simplifies the exploration of biological networks through its modular architecture and advanced clustering algorithms. Whether you are a first-time user or looking to harness RISK's full potential, this tutorial covers key functionalities and practical applications.

## Yeast Interactome Network Demonstration

In this demonstration, we use the yeast interactome network published by Michaelis et al. (2023), which contains 3,927 proteins and 31,004 interactions. For this example, the dataset is refined to focus on proteins with six or more interactions, yielding a final network of 2,059 nodes and 27,690 edges. RISK is applied to perform analyses such as network clustering, interaction mapping, and identification of key protein complexes, offering insights into cellular organization and regulatory mechanisms.

Below is a visual representation of the yeast protein–protein interaction network, annotated with **Gene Ontology Biological Processes (GO BP)** terms:

<p align="center">
  <img src="https://i.imgur.com/xfKYhrm.png" width="70%" alt="GO BP annotated yeast interactome" />
</p>

## Party and Date Hubs

RISK also identifies **party hubs** and **date hubs**, representing different types of central nodes in the network. The following visualization shows the yeast network with nodes colored by their role as either a party hub or a date hub:

<p align="center">
  <img src="https://i.imgur.com/zyI9CF8.png" width="70%" alt="GO BP contour overlay with party hub and date hub color coding" />
</p>

The **GO BP contour overlay** helps illustrate the spatial distribution of biological processes, allowing for the interpretation of party hubs and date hubs in context.

## Setting Up Python and Jupyter for RISK

<details>
<summary><strong>Step 1: Install Python 3.8+</strong></summary>
<br>
Download and install Python 3.8 or higher from the official [Python website](https://www.python.org/downloads/).

- On Windows, ensure you check the box that says **Add Python to PATH** during installation. If you missed this step, follow this [guide](https://datatofish.com/add-python-to-windows-path/) to manually set the PATH.
</details>

<details>
<summary><strong>Step 2: Create a Virtual Environment (Optional but Recommended)</strong></summary>
<br>
Create a virtual environment to isolate dependencies for this project:

- **For Windows:**
    ```
    python -m venv risk-env
    risk-env\Scripts\activate
    ```

- **For macOS/Linux:**
    ```
    python3 -m venv risk-env
    source risk-env/bin/activate
    ```
</details>

<details>
<summary><strong>Step 3: Configure Jupyter to Use the Virtual Environment</strong></summary>
<br>
To link your virtual environment with Jupyter, follow this [guide](https://janakiev.com/blog/jupyter-virtual-envs/).

After configuring, ensure you select the virtual environment in Jupyter Notebook:
1. Click **Kernel** in the menu.
2. Choose **Change kernel**.
3. Select your virtual environment (e.g., `risk-env`).
</details>

<details>
<summary><strong>Step 4: Install Jupyter</strong></summary>
<br>
With your virtual environment activated, install Jupyter Notebook:

```
pip install jupyter
```
</details>

<details>
<summary><strong>Step 5: Install RISK</strong></summary>
<br>
Now, install RISK:

```
pip install risk-network
```
</details>

<details>
<summary><strong>Step 6: Launch Jupyter Notebook</strong></summary>
<br>
Start Jupyter Notebook to run the RISK tutorial:

```
jupyter notebook
```
</details>

## Citation

If you use RISK in your research, please cite the following:

**Horecka**, *et al.*, "RISK: a next-generation tool for biological network annotation and visualization", **[Journal Name]**, 2024. DOI: [10.1234/zenodo.xxxxxxx](https://doi.org/10.1234/zenodo.xxxxxxx)

## License

This tutorial and the RISK tool are released under the [GNU General Public License v3.0](https://www.gnu.org/licenses/gpl-3.0.en.html).
