# Overview of `risk.params`

The `risk.params` module provides tools to manage, inspect, and export the internal configuration used in your RISK analysis. This allows for reproducibility and transparency by saving parameter states across formats.

---

## Loading Parameters

Use the `load()` method to import the current parameter dictionary. This flattens any `np.ndarray` objects into lists for compatibility.

### Example

```python
loaded_params = risk.params.load()
loaded_params
```

Returns:

- `dict`: Dictionary of configuration options used during analysis

The printed dictionary contains configuration blocks used throughout the RISK pipeline, including:

- `annotations`: Metadata for understanding the context of the analysis.
- `datetime`: Timestamp indicating when the parameters were created or last modified.
- `graph`: Configuration settings related to the graph structure used in the analysis.
- `neighborhoods`: Parameters defining the neighborhoods within the graph.
- `network`: Settings pertaining to the overall network configuration.
- `plotter`: Options for visualizing the results of the analysis.

---

## Export Parameters

### 1. Export to CSV

Exports the parameter dictionary to a `.csv` file.

```python
risk.params.to_csv(filepath="./data/csv/params/michaelis_2023.csv")
```

**Parameters:**

- `filepath` (str): Destination path for the CSV file  
  *Best for spreadsheet editing.*

---

### 2. Export to JSON

Exports parameters with nested structure preserved.

```python
risk.params.to_json(filepath="./data/json/params/michaelis_2023.json")
```

**Parameters:**

- `filepath` (str): Destination path for the JSON file  
  *Best for reloading parameters in future sessions.*

---

### 3. Export to Text

Outputs the parameter dictionary as a formatted `.txt` file.

```python
risk.params.to_txt(filepath="./data/txt/params/michaelis_2023.txt")
```

**Parameters:**

- `filepath` (str): Destination path for the TXT file  
  *Best for inspection of parameter configurations.*

---

These export functions allow parameters to be easily shared, archived, or reloaded in a different session.

For downstream processing, combine these with summary exports from:

- `graph.summary.to_csv()`
- `graph.summary.to_json()`
- `graph.summary.to_txt()`

---

For a complete interactive example showing how these parameters fit into a full RISK analysis workflow, see `quickstart.ipynb` in the root of this repository.
