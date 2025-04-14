# Installation

To get started, install the `risk-network` package using pip:

```bash
pip install risk-network --upgrade
```

To install from source:

```bash
git clone https://github.com/riskportal/network.git
cd network
pip install .
```

---

## 1. Importing RISK

After installing, verify the installation and import the package:

```python
import risk
print(risk.__version__)
```

To use RISK's core functionalities:

```python
from risk import RISK
```

If using a Jupyter notebook, enable inline plotting:

```python
%matplotlib inline
```

---

## 2. Initializing RISK

Create a `RISK` object to access network analysis functions:

```python
risk = RISK(verbose=True)
```

- `verbose=True` enables log messages in the console.

---

## Next Step

Continue to [2. Loading the Network](./2_network_input.md) to import your first graph.