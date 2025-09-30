# Overview of `risk.params`

The `risk.params` module in the RISK package is used to manage and export parameters related to your analysis. It lets you configure, save, and share the parameters used across the pipeline, improving reproducibility. _Note: reloading a RISK instance from a saved parameter file is not currently supported._

---

## Loading Parameters

The `load()` method imports parameters from the running RISK instance. Any `np.ndarray` values are converted to lists for easier serialization.

**Returns:**
`dict`: A dictionary containing the processed parameters.

```python
loaded_params = risk.params.load()
```

---

## Exporting Parameters

### Export to CSV

Exports the parameter dictionary to a `.csv` file.

**Parameters:**

- `filepath` (str): The path where the CSV file will be saved.

```python
risk.params.to_csv(filepath="./data/csv/params/michaelis_2023.csv")
```

### Export to JSON

Exports the parameter dictionary to a `.json` file. The hierarchical structure is preserved.

**Parameters:**

- `filepath` (str): The path where the JSON file will be saved.

```python
risk.params.to_json(filepath="./data/json/params/michaelis_2023.json")
```

### Export to Text

Exports the parameter dictionary to a formatted `.txt` file.

**Parameters:**

- `filepath` (str): The path where the text file will be saved.

```python
risk.params.to_txt(filepath="./data/txt/params/michaelis_2023.txt")
```

---

These export functions allow parameters to be shared and archived. For downstream processing, combine them with summary exports from:

- `graph.summary.to_csv()`
- `graph.summary.to_json()`
- `graph.summary.to_txt()`

For an interactive example showing how these parameters fit into a full RISK workflow, see [tutorial.html](tutorial.html) or [download the tutorial notebook and data](tutorial.zip).
You can also <a href="https://mybinder.org/v2/gh/riskportal/network-tutorial/HEAD?filepath=notebooks/quickstart.ipynb" target="_blank" rel="noopener">launch the Quickstart notebook on Binder</a> to explore the workflow without local installation.
