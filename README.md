# RISK Network Tutorial

<p align="center">
  <img src="https://i.imgur.com/8TleEJs.png" width="50%" alt="RISK Network logo" />
</p>

<br>

![Python](https://img.shields.io/badge/python-3.8%2B-yellow)
[![Licence](https://img.shields.io/badge/license-GPLv3-purple.svg)](https://raw.githubusercontent.com/riskportal/network-tutorial/main/LICENSE)
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.xxxxxxx.svg)](https://doi.org/10.5281/zenodo.xxxxxxx)

**RISK Network Tutorial** offers a detailed guide to using RISK (Regional Inference of Significant Kinships), a next-generation tool for biological network annotation and visualization. It walks users through core features and practical workflows for network analysis.

- **Full Documentation**: [riskportal.github.io/network-tutorial](https://riskportal.github.io/network-tutorial)
- **Try in Browser (Binder)**: [![Launch in Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/riskportal/network-tutorial/HEAD?filepath=notebooks/quickstart.ipynb)
- **Source Code**: [github.com/riskportal/network](https://github.com/riskportal/network)

For a full description of RISK and its applications, see:
<br>
**Horecka and Röst (2025)**, _"RISK: a next-generation tool for biological network annotation and visualization"_.
<br>
DOI: [10.5281/zenodo.xxxxxxx](https://doi.org/10.5281/zenodo.xxxxxxx)

## Yeast Protein–Protein Interaction (PPI) Network Demonstration

We applied RISK to a _Saccharomyces cerevisiae_ protein–protein interaction (PPI) network (Michaelis _et al_., 2023; 3,839 proteins, 30,955 interactions). RISK identified compact, functional modules overrepresented in Gene Ontology Biological Process (GO BP) terms (Ashburner _et al_., 2000), revealing biological organization including ribosomal assembly, mitochondrial organization, and RNA polymerase activity (P < 0.0001).

[![Yeast PPI network annotated with GO BP terms](https://i.imgur.com/jQKatLY.jpeg)](https://i.imgur.com/jQKatLY.jpeg)
**RISK workflow overview and analysis of the yeast PPI network**. GO BP terms are color-coded to represent key cellular processes—including ribosomal assembly, mitochondrial organization, and RNA polymerase activity (P < 0.0001).

## Setting Up Python and Jupyter for RISK

<details>

<summary><strong>Step 1: Install Python 3.8+</strong></summary>

<br>

Download and install Python 3.8 or later (recommended) from the official [Python website](https://www.python.org/downloads/). RISK is tested on Python 3.8+.

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

If you use RISK in your research, please cite the following:

**Horecka and Röst (2025)**, _"RISK: a next-generation tool for biological network annotation and visualization"_.
<br>
DOI: [10.5281/zenodo.xxxxxxx](https://doi.org/10.5281/zenodo.xxxxxxx)

## License

This tutorial follows the [GPLv3 License](https://www.gnu.org/licenses/gpl-3.0.en.html).
