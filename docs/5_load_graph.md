# Creating a NetworkGraph

The `load_graph()` function in RISK generates a `NetworkGraph` object for overrepresentation-based analysis and visualization. This step consolidates the network, annotations, and overrepresentation statistics into a cohesive object with clustering, domain-level significance, and downstream plotting support.

---

## Usage

To build a `NetworkGraph`, you’ll need:

- A preprocessed `network` (e.g., from `load_networkx_network()`)
- An `annotations` object (from `load_*_annotation()`)
- A `neighborhoods` object (from one of the overrepresentation tests)

```python
graph = risk.load_graph(
    network=network,
    annotations=annotations,
    neighborhoods=neighborhoods,
    tail="right",
    pval_cutoff=0.05,
    fdr_cutoff=1.00,
    impute_depth=0,
    prune_threshold=0.125,
    linkage_criterion="distance",
    linkage_method="single",
    linkage_metric="jaccard",
    linkage_threshold="auto",
    min_cluster_size=6,
    max_cluster_size=1_000,
)
```

---

## Parameters

| Parameter | Description |
|----------|-------------|
| `network` | The NetworkX graph |
| `annotations` | Functional annotation dictionary |
| `neighborhoods` | Overrepresentation results per neighborhood |
| `tail` | Test direction: `'right'` (default), `'left'`, or `'both'` |
| `pval_cutoff` | Raw p-value threshold (e.g., 0.01–0.05) |
| `fdr_cutoff` | Adjusted p-value threshold (e.g., 0.05–1.0) |
| `impute_depth` | Hop distance to fill in missing scores |
| `prune_threshold` | Removes weak edges from layout |
| `linkage_criterion` | `'distance'`, `'maxclust'`, or `'off'` |
| `linkage_method` | `'single'`, `'average'`, `'auto'`, etc. |
| `linkage_metric` | `'jaccard'`, `'cosine'`, `'auto'`, etc. |
| `linkage_threshold` | Float (0–1) or `'auto'` for optimization |
| `min_cluster_size` | Minimum domain size |
| `max_cluster_size` | Maximum domain size |

---

## Key Attributes

After creation, the `NetworkGraph` object contains cluster- and node-level mappings:

### Domain-Level

- `domain_id_to_node_ids_map`
- `domain_id_to_node_labels_map`
- `domain_id_to_domain_terms_map`
- `domain_id_to_domain_info_map`

### Node-Level

- `node_id_to_node_label_map`
- `node_label_to_node_id_map`
- `node_label_to_significance_map`
- `node_significance_sums` (NumPy array)

These mappings drive all visualization, labeling, and export methods.

---

## Analysis Summary

You can extract the analysis results using `.summary.load()`:

```python
summary_df = graph.summary.load()
summary_df.head()
```

Export formats:

```python
graph.summary.to_csv("./data/csv/summary/michaelis_2023.csv")
graph.summary.to_json("./data/json/summary/michaelis_2023.json")
graph.summary.to_txt("./data/txt/summary/michaelis_2023.txt")
```

---

## Cleaning Domains

Use `.pop()` to remove a domain from all internal structures:

```python
graph.pop(1)
```

---

## Next Step

Proceed to [6. Visualization](./6_visualization.md) to plot enriched clusters and explore domain layout.
