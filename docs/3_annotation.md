# Loading and Associating Annotation Data

An annotation maps biological terms to network nodes (e.g., Gene Ontology categories mapping GO terms to genes). RISK supports multiple input formats with dedicated loaders.

---

## Supported Input Formats

| Format         | Function                  | Example File                 |
| -------------- | ------------------------- | ---------------------------- |
| `.json`        | `load_annotation_json()`  | `go_biological_process.json` |
| `.csv`         | `load_annotation_csv()`   | `go_biological_process.csv`  |
| `.tsv`         | `load_annotation_tsv()`   | `go_biological_process.tsv`  |
| `.xlsx`/`.xls` | `load_annotation_excel()` | `go_biological_process.xlsx` |
| `dict`         | `load_annotation_dict()`  | Python-loaded JSON           |

Each method also accepts `min_nodes_per_term` and `max_nodes_per_term` to exclude underpowered or overly broad annotations.

---

## JSON Annotation

```python
annotation = risk.load_annotation_json(
    network=network,
    filepath="./data/json/annotation/go_biological_process.json",
    min_nodes_per_term=1,
    max_nodes_per_term=10_000,
)
```

- Load term-to-node mappings from a JSON dictionary
- Ideal for GO annotations exported from standard tools

---

## CSV Annotation

```python
annotation = risk.load_annotation_csv(
    network=network,
    filepath="./data/csv/annotation/go_biological_process.csv",
    label_colname="label",
    nodes_colname="nodes",
    nodes_delimiter=";",
    min_nodes_per_term=1,
    max_nodes_per_term=10_000,
)
```

- Columns: one for labels, one for semicolon-separated nodes
- Use for flat structured data

---

## TSV Annotation

```python
annotation = risk.load_annotation_tsv(
    network=network,
    filepath="./data/tsv/annotation/go_biological_process.tsv",
    label_colname="label",
    nodes_colname="nodes",
    nodes_delimiter=";",
    min_nodes_per_term=1,
    max_nodes_per_term=10_000,
)
```

- Tab-delimited version of the CSV format

---

## Excel Annotation

```python
annotation = risk.load_annotation_excel(
    network=network,
    filepath="./data/excel/annotation/go_biological_process.xlsx",
    label_colname="label",
    nodes_colname="nodes",
    sheet_name="Sheet1",
    nodes_delimiter=";",
    min_nodes_per_term=1,
    max_nodes_per_term=10_000,
)
```

- Specify a sheet name to target structured spreadsheets

---

## Dictionary-Based Annotation

If you already have a dictionary loaded from another source:

```python
import json

with open("./data/json/annotation/go_biological_process.json") as file:
    annotation_dict = json.load(file)

annotation = risk.load_annotation_dict(
    network=network,
    content=annotation_dict,
    min_nodes_per_term=1,
    max_nodes_per_term=10_000,
)
```

Use this method to work with annotations already in memory.

---

## Next Step

Proceed to [4. Statistics](./4_statistics.md) to evaluate term overrepresentation.
