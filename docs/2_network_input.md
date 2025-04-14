# Loading a Network

RISK supports multiple file formats for network input, each with its own dedicated loader function. These loaders return a processed `network` object compatible with clustering, annotation, enrichment, and visualization.

---

## Supported Input Formats

| Format       | Function                          |
|--------------|-----------------------------------|
| `.cys`       | `load_cytoscape_network()`        |
| `.cyjs`      | `load_cytoscape_json_network()`   |
| `.gpickle`   | `load_gpickle_network()`          |
| `NetworkX`   | `load_networkx_network()`         |

Each loader supports optional spherical projection, depth tuning, and node filtering.

---

## Cytoscape `.cys` Files

Use this format if you've exported or styled your network in Cytoscape.

```python
network = risk.load_cytoscape_network(
    filepath="./data/cytoscape/michaelis_2023.cys",
    source_label="source",
    target_label="target",
    view_name="",             
    compute_sphere=True,
    surface_depth=0.1,
)
```

- `source_label`, `target_label`: Column names for edges
- `view_name`: Load a specific layout (optional)
- `compute_sphere`: Project layout onto a 3D sphere
- `surface_depth`: Controls visual node "depth"

---

## Cytoscape JSON (`.cyjs`) Files

Structured network files exported from Cytoscape Web or JS-based tools.

```python
network = risk.load_cytoscape_json_network(
    filepath="./data/cyjs/michaelis_2023.cyjs",
    source_label="source",
    target_label="target",
    compute_sphere=True,
    surface_depth=0.1,
    min_edges_per_node=0,
)
```

- `min_edges_per_node`: Filters out sparsely connected nodes

---

## GPickle (`.gpickle`) Files

Fast, native Python serialization of NetworkX graphs.

```python
network = risk.load_gpickle_network(
    filepath="./data/gpickle/michaelis_2023.gpickle",
    compute_sphere=True,
    surface_depth=0.1,
    min_edges_per_node=0,
)
```

Use this for reproducibility and performance when working with saved graphs.

---

## NetworkX Graphs

Load an in-memory NetworkX graph directly.

```python
network = risk.load_networkx_network(
    network=network,
    compute_sphere=True,
    surface_depth=0.1,
    min_edges_per_node=0,
)
```

Useful if you've already constructed a graph using other tools or workflows.

---

## Spherical Projection and Depth

All formats support these shared preprocessing parameters:

- `compute_sphere=True`: Projects nodes from 2D to a 3D spherical layout (Mercator-inspired)
- `surface_depth`: Push or pull nodes inward/outward to reflect density or importance
- `min_edges_per_node`: Removes low-degree noise

These features improve layout clarity and biological interpretability.

---

## Full Walkthrough

For a complete network loading and analysis example, see [quickstart.ipynb](https://github.com/riskportal/network-tutorial/blob/main/quickstart.ipynb).

---

## Next Step

Proceed to [3. Loading Annotations](./3_annotations.md) to map biological terms onto network nodes.
