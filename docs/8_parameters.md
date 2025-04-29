# Overview of `risk.params`

The `risk.params` module (accessed via an initialized RISK instance) lets you inspect and export the internal configuration used in your RISK analysis. This supports reproducibility by preserving parameter states across formats. _Note: reloading a RISK instance from a parameter file is not currently supported_.

---

## Loading Parameters

Use the `load()` method to import the current parameter dictionary.

### Example

```python
loaded_params = risk.params.load()
loaded_params
```

Returns:

- `dict`: Dictionary of configuration options used during analysis

The printed dictionary contains configuration blocks used throughout the RISK pipeline, including:

- `annotations`: Metadata for understanding the context of the analysis
- `datetime`: Timestamp indicating when the parameters were created or last modified
- `graph`: Configuration settings related to the graph structure used in the analysis
- `neighborhoods`: Parameters defining the neighborhoods within the graph
- `network`: Settings pertaining to the overall network configuration
- `plotter`: Options for visualizing the results of the analysis

---

## Export Parameters

### 1. Export to CSV

Exports the parameter dictionary to a `.csv` file.

```python
risk.params.to_csv(filepath="./data/csv/params/michaelis_2023.csv")
```

---

### 2. Export to JSON

Exports parameters with nested structure preserved.

```python
risk.params.to_json(filepath="./data/json/params/michaelis_2023.json")
```

---

### 3. Export to Text

Outputs the parameter dictionary as a formatted `.txt` file.

```python
risk.params.to_txt(filepath="./data/txt/params/michaelis_2023.txt")
```

---

These export functions allow parameters to be easily shared and archived.

For downstream processing, combine these with summary exports from:

- `graph.summary.to_csv()`
- `graph.summary.to_json()`
- `graph.summary.to_txt()`

---

For a complete interactive example showing how these parameters fit into a full RISK analysis workflow, see [tutorial.html](tutorial.html) or [download the tutorial notebook and data](tutorial.zip).

---

You can also [launch the Quickstart notebook on Binder](https://mybinder.org/v2/gh/riskportal/network-tutorial/HEAD?filepath=notebooks/quickstart_binder.ipynb) to explore a full RISK workflow interactively without installing anything locally.
