# Loading and Associating Annotation Data

Annotations must be provided by the user and formatted clearly to ensure compatibility with RISK loaders. We note that RISK does not bundle annotations; users should obtain curated resources such as Gene Ontology (Ashburner et al., 2000), CORUM (Tsitsiridis et al., 2022), or KEGG (Kanehisa et al., 2023) and format them as term–to–gene membership tables. Publicly available resources such as Gene Ontology (GO), CORUM, and KEGG offer standardized annotation files that can be adapted for use.

---

## Supported Input Formats

| Format         | Function                  | Example File                 |
| -------------- | ------------------------- | ---------------------------- |
| `.json`        | `load_annotation_json()`  | `go_biological_process.json` |
| `.csv`         | `load_annotation_csv()`   | `go_biological_process.csv`  |
| `.tsv`         | `load_annotation_tsv()`   | `go_biological_process.tsv`  |
| `.xlsx`/`.xls` | `load_annotation_excel()` | `go_biological_process.xlsx` |
| `dict`         | `load_annotation_dict()`  | Python dictionary in memory  |

Annotations must be provided by the user and formatted clearly to ensure compatibility with RISK loaders. Publicly available resources such as Gene Ontology (GO), CORUM, and KEGG offer standardized annotation files that can be adapted for use.

---

## JSON Annotation

**Parameters:**

- `network` (nx.Graph): Input NetworkX graph.
- `filepath` (str): Path to the `.json` file.
- `min_nodes_per_term` (int, default=1): Minimum number of nodes required for a term to be included.
- `max_nodes_per_term` (int, default=10,000): Maximum number of nodes allowed for a term.

**Returns:**

`dict`: A dictionary containing ordered nodes, ordered annotations, and the annotation matrix.

```python
annotation = risk.load_annotation_json(
    network=network,
    filepath="./data/json/annotation/go_biological_process.json",
    min_nodes_per_term=1,
    max_nodes_per_term=10_000,
)
```

- Loads GO BP annotations directly from JSON files.
- Annotations should follow the term–to–gene membership table format.
- Examples include GO BP terms, CORUM complexes, and KEGG pathways.

---

## CSV Annotation

**Parameters:**

- `network` (nx.Graph): Input NetworkX graph.
- `filepath` (str): Path to the `.csv` file.
- `label_colname` (str): Column name for annotation labels.
- `nodes_colname` (str): Column name for nodes in the annotation.
- `nodes_delimiter` (str, default=';'): Delimiter to split multiple nodes in a cell.
- `min_nodes_per_term` (int, default=1): Minimum number of nodes required for a term to be included.
- `max_nodes_per_term` (int, default=10,000): Maximum number of nodes allowed for a term.

**Returns:**

`dict`: A dictionary containing ordered nodes, ordered annotations, and the annotation matrix.

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

- Loads annotation data from CSV files.
- Requires specifying column names for labels and nodes.
- Use `nodes_delimiter` to split multiple nodes per term (default = `;`).
- Annotations should follow the term–to–gene membership table format.
- Examples include GO BP terms, CORUM complexes, and KEGG pathways.

---

## TSV Annotation

**Parameters:**

- `network` (nx.Graph): Input NetworkX graph.
- `filepath` (str): Path to the `.tsv` file.
- `label_colname` (str): Column name for annotation labels.
- `nodes_colname` (str): Column name for nodes in the annotation.
- `nodes_delimiter` (str, default=';'): Delimiter to split multiple nodes in a cell.
- `min_nodes_per_term` (int, default=1): Minimum number of nodes required for a term to be included.
- `max_nodes_per_term` (int, default=10,000): Maximum number of nodes allowed for a term.

**Returns:**

`dict`: A dictionary containing ordered nodes, ordered annotations, and the annotation matrix.

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

- Loads annotation data from TSV files.
- Same parameters as CSV loader, but expects tab-delimited input.
- Annotations should follow the term–to–gene membership table format.
- Examples include GO BP terms, CORUM complexes, and KEGG pathways.

---

## Excel Annotation

**Parameters:**

- `network` (nx.Graph): Input NetworkX graph.
- `filepath` (str): Path to the Excel `.xlsx` or `.xls` file.
- `label_colname` (str): Column name for annotation labels.
- `nodes_colname` (str): Column name for nodes in the annotation.
- `sheet_name` (str, default='Sheet1'): Name of the sheet to load.
- `nodes_delimiter` (str, default=';'): Delimiter to split multiple nodes in a cell.
- `min_nodes_per_term` (int, default=1): Minimum number of nodes required for a term to be included.
- `max_nodes_per_term` (int, default=10,000): Maximum number of nodes allowed for a term.

**Returns:**

`dict`: A dictionary containing ordered nodes, ordered annotations, and the annotation matrix.

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

- Loads annotation data from Excel workbooks.
- Allows loading from specific sheets.
- Annotations should follow the term–to–gene membership table format.
- Examples include GO BP terms, CORUM complexes, and KEGG pathways.

---

## Dictionary-Based Annotation

**Parameters:**

- `network` (nx.Graph): Input NetworkX graph.
- `content` (dict): Python dictionary containing annotation data.
- `min_nodes_per_term` (int, default=1): Minimum number of nodes required for a term to be included.
- `max_nodes_per_term` (int, default=10,000): Maximum number of nodes allowed for a term.

**Returns:**

`dict`: A dictionary containing ordered nodes, ordered annotations, and the annotation matrix.

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

- Loads annotation data from a Python dictionary in memory.
- Annotations should follow the term–to–gene membership table format.
- Examples include GO BP terms, CORUM complexes, and KEGG pathways.

---

## Next Step

Proceed to [4. Statistics](./4_statistics.md) to evaluate overrepresentation and assess significance of biological annotations.
