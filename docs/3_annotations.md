# Loading and Associating Annotations

Annotations link network nodes to biological terms (e.g., Gene Ontology categories). RISK supports multiple file formats, each with a dedicated loader. All annotation loaders return a dictionary with:

- Ordered list of nodes
- Ordered list of terms
- Binary annotation matrix

---

## Supported Input Formats

| Format       | Function                  | Example File                         |
|--------------|---------------------------|--------------------------------------|
| `.json`      | `load_json_annotation()`  | `go_biological_process.json`         |
| `.csv`       | `load_csv_annotation()`   | `go_biological_process.csv`          |
| `.tsv`       | `load_tsv_annotation()`   | `go_biological_process.tsv`          |
| `.xlsx`/`.xls`| `load_excel_annotation()` | `go_biological_process.xlsx`         |
| `dict`       | `load_dict_annotation()`  | Python-loaded JSON                   |

Each method also accepts a `min_nodes_per_term` argument to exclude underpowered annotations.

---

## JSON Annotations

```python
annotations = risk.load_json_annotation(
    network=network,
    filepath="./data/json/annotations/go_biological_process.json",
    min_nodes_per_term=1,
)
```

- Load term-to-node mappings from a JSON dictionary
- Ideal for GO annotations exported from standard tools

---

## CSV Annotations

```python
annotations = risk.load_csv_annotation(
    network=network,
    filepath="./data/csv/annotations/go_biological_process.csv",
    label_colname="label",
    nodes_colname="nodes",
    nodes_delimiter=";",
    min_nodes_per_term=1,
)
```

- Columns: one for labels, one for semicolon-separated nodes
- Use for flat structured data

---

## TSV Annotations

```python
annotations = risk.load_tsv_annotation(
    network=network,
    filepath="./data/tsv/annotations/go_biological_process.tsv",
    label_colname="label",
    nodes_colname="nodes",
    nodes_delimiter=";",
    min_nodes_per_term=2,
)
```

- Tab-delimited version of the CSV format

---

## Excel Annotations

```python
annotations = risk.load_excel_annotation(
    network=network,
    filepath="./data/excel/annotations/go_biological_process.xlsx",
    label_colname="label",
    nodes_colname="nodes",
    sheet_name="Sheet1",
    nodes_delimiter=";",
    min_nodes_per_term=1,
)
```

- Specify a sheet name to target structured spreadsheets

---

## Dictionary-Based Annotation

If you already have a dictionary loaded from another source:

```python
import json

with open("./data/json/annotations/go_biological_process.json") as file:
    annotations_dict = json.load(file)

annotations = risk.load_dict_annotation(
    network=network,
    content=annotations_dict,
    min_nodes_per_term=1,
)
```

Use this method to work with annotations already in memory.

---

## Why Filter with `min_nodes_per_term`?

This parameter helps remove annotation terms that are rarely used, reducing noise and increasing power in downstream statistical analysis.

---

## Next Step

Proceed to [4. Statistical Testing](./4_statistics.md) to evaluate term enrichment.
