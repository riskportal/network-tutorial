# Building and Analyzing Networks

The `NetworkGraph` object integrates network data, annotations, and overrepresentation results into a unified structure, supporting clustering, domain-level significance, and downstream visualization.

---

## Create a `NetworkGraph`

**Parameters:**

- `network` (nx.Graph): The network graph containing the nodes and edges to be analyzed.
- `annotation` (dict): Annotation data associated with the network.
- `neighborhoods` (dict): Neighborhood scores from enrichment/depletion analysis.
- `tail` (str, optional): Specifies test tail. Options: `'right'` (default), `'left'`, `'both'`.
- `pval_cutoff` (float, optional): Cutoff for raw p-values (0–1). Defaults to 0.01.
- `fdr_cutoff` (float, optional): Cutoff for FDR-corrected p-values (0–1). Defaults to 0.9999.
- `impute_depth` (int, optional): Depth for imputing missing values (≥0). Defaults to 1.
- `prune_threshold` (float, optional): Threshold for pruning weak edges (0–1). Defaults to 0.0.
- `linkage_criterion` (str, optional): Criterion for clustering. Options: `'distance'` (default), `'maxclust'`, `'off'`.
- `linkage_method` (str, optional): Hierarchical clustering method. Options: `'auto'`, `'single'`, `'complete'`, `'average'`, `'weighted'`, `'centroid'`, `'median'`, `'ward'`. Defaults to `'average'`.
- `linkage_metric` (str, optional): Distance metric. Options: `'auto'`, `'braycurtis'`, `'canberra'`, `'chebyshev'`, `'cityblock'`, `'correlation'`, `'cosine'`, `'dice'`, `'euclidean'`, `'hamming'`, `'jaccard'`, `'jensenshannon'`, `'kulczynski1'`, `'mahalanobis'`, `'matching'`, `'minkowski'`, `'rogerstanimoto'`, `'russellrao'`, `'seuclidean'`, `'sokalmichener'`, `'sokalsneath'`, `'sqeuclidean'`, `'yule'`. Defaults to `'yule'`.
- `linkage_threshold` (str or float, optional): Cutoff distance or `'auto'` for silhouette optimization. Defaults to 0.2.
- `min_cluster_size` (int, optional): Minimum cluster size. Defaults to 5.
- `max_cluster_size` (int, optional): Maximum cluster size. Defaults to 1000.

**Returns:**

- `NetworkGraph`: A `NetworkGraph` object representing the processed network, ready for analysis and visualization.

```python
graph = risk.load_graph(
    network=network,
    annotation=annotation,
    neighborhoods=neighborhoods,
    tail="right",
    pval_cutoff=0.01,
    fdr_cutoff=0.9999,
    impute_depth=1,
    prune_threshold=0.0,
    linkage_criterion="distance",
    linkage_method="average",
    linkage_metric="yule",
    linkage_threshold=0.2,
    min_cluster_size=5,
    max_cluster_size=1000
)
```

## Key Attributes

The `NetworkGraph` object exposes several mappings for cluster and node information:

### Domain-Level

- `domain_id_to_node_ids_map`
- `domain_id_to_node_labels_map`
- `domain_id_to_domain_terms_map`
- `domain_id_to_domain_info_map`

### Node-Level

- `node_id_to_node_label_map`
- `node_label_to_node_id_map`
- `node_label_to_significance_map`
- `node_significance_sums`

These attributes enable visualization, labeling, and export functionalities.

---

## Example Workflow

### Summarize results

Load the analysis summary into a DataFrame to inspect matched members, counts, and significance values.

```python
summary_df = graph.summary.load()
summary_df.head()
```

### Export summary

Export the processed summary table in common formats for downstream use or sharing.

```python
graph.summary.to_csv("./data/csv/summary/michaelis_2023.csv")
graph.summary.to_json("./data/json/summary/michaelis_2023.json")
graph.summary.to_txt("./data/txt/summary/michaelis_2023.txt")
```

### Clean domains

Remove a domain and retrieve its node labels:

```python
domain_1_labels = graph.pop(1)
```
