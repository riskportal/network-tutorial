# Installation and Setup

RISK is available on PyPI and supports Python 3.8 or later on major operating systems (Windows, macOS, Linux). Install the latest release with:

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

## Importing RISK

Verify the installation and import the package:

```python
import risk
print(risk.__version__)
```

The core functionality is accessed through the `RISK` class:

```python
from risk import RISK
```

For Jupyter notebooks, enable inline plotting:

```python
%matplotlib inline
```

---

## Initializing RISK

Initialize a `RISK` object to start analysis:

```python
risk = RISK(verbose=True)
```

- `verbose=True` enables console log messages.
- The object provides modular access to clustering, statistics, and visualization components.
