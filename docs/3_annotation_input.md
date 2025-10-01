# Loading Annotations into RISK

Annotations provide the biological context for RISK by linking network clusters to functional terms (e.g., cellular components, metabolic pathways, protein complexes). They enable downstream statistical tests to evaluate whether specific functions are overrepresented within detected network clusters.

Annotations must be provided by the user and formatted clearly to ensure compatibility with RISK loaders. We note that RISK does not bundle annotations; users should obtain curated resources such as Gene Ontology (GO) (Ashburner _et al_., 2000), CORUM (Tsitsiridis _et al_., 2022), or KEGG (Kanehisa _et al_., 2023) and format them as term–to–node (e.g., genes/proteins) membership tables. Publicly available resources such as GO, CORUM, and KEGG offer standardized annotation files that can be adapted for use.

For example, a simple JSON/dictionary representation could be:

```json
{
  "proline biosynthetic process": ["CAR2", "PRO1", "PRO2", "PRO3", "YHR033W"],
  "glyoxylate metabolic process": [
    "DAL7",
    "GOR1",
    "ICL1",
    "IDP1",
    "IDP2",
    "IDP3",
    "LEU2",
    "MDH3",
    "MLS1"
  ]
}
```

---

## Supported Input Formats

_Node IDs must match the network’s node labels; unmapped IDs are ignored. Terms may overlap, and a node can belong to multiple terms. Terms outside `min_nodes_per_term` and `max_nodes_per_term` are filtered._

| Format         | Method                    | Description                                          |
| -------------- | ------------------------- | ---------------------------------------------------- |
| `.json`        | `load_annotation_json()`  | Import annotations from a JSON file.                 |
| `.csv`         | `load_annotation_csv()`   | Import from a CSV file (supports delimiter).         |
| `.tsv`         | `load_annotation_tsv()`   | Import from a tab-separated file.                    |
| `.xlsx`/`.xls` | `load_annotation_excel()` | Import from a specified Excel sheet.                 |
| `dict`         | `load_annotation_dict()`  | Load annotations from a Python dictionary in memory. |

## Shared Parameters

Shared parameters among annotation loaders.

- `network` (nx.Graph): The network to which the annotation is related.
- `min_nodes_per_term` (int, optional): The minimum number of network nodes required for each annotation term to be included. Defaults to 1.
- `max_nodes_per_term` (int, optional): The maximum number of network nodes required for each annotation term to be included. Defaults to 10_000.

---

## JSON Annotation

Load annotation data from a JSON file and associate terms with network nodes.

**Additional Parameters:**

- `filepath` (str): Path to the JSON annotation file.

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

---

## CSV Annotation

Load annotation data from a CSV file, specifying columns and delimiter for nodes.

**Additional Parameters:**

- `filepath` (str): Path to the CSV annotation file.
- `label_colname` (str): Name of the column containing the annotation term (e.g., GO term).
- `nodes_colname` (str): Name of the column containing the nodes associated with each label.
- `nodes_delimiter` (str, optional): Delimiter used to separate multiple nodes within the nodes column. Defaults to ';'.

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

---

## TSV Annotation

Load annotation data from a tab-delimited file, similar to CSV but with tabs as separators.

**Additional Parameters:**

- `filepath` (str): Path to the TSV annotation file.
- `label_colname` (str): Name of the column containing the annotation term (e.g., GO term).
- `nodes_colname` (str): Name of the column containing the nodes associated with each label.
- `nodes_delimiter` (str, optional): Delimiter used to separate multiple nodes within the nodes column. Defaults to ';'.

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

---

## Excel Annotation

Load annotation data from an Excel workbook, with support for selecting specific sheets.

**Additional Parameters:**

- `filepath` (str): Path to the Excel annotation file.
- `label_colname` (str): Name of the column containing the annotation term (e.g., GO term).
- `nodes_colname` (str): Name of the column containing the nodes associated with each label.
- `sheet_name` (str, optional): The name of the Excel sheet to load. Defaults to 'Sheet1'.
- `nodes_delimiter` (str, optional): Delimiter used to separate multiple nodes within the nodes column. Defaults to ';'.

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

---

## Dictionary-Based Annotation

Load annotation data already in memory as a Python dictionary.

**Additional Parameters:**

- `content` (dict): The annotation dictionary to load.

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

---

## Next Step

[Clustering Algorithms and Statistical Methods](4_clustering_statistics.md)
