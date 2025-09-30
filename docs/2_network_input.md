# Loading Network for RISK Analysis

RISK offers flexible loading functions compatible with multiple network formats, including Cytoscape session files, Cytoscape JSON exports, GPickle files, and in-memory NetworkX graphs. These loaders provide standardized NetworkX graph objects ready for downstream analysis, with options for preprocessing such as spherical projection, surface depth adjustment, and node filtering.

---

## Supported Input Formats

| Format     | Function                   |
| ---------- | -------------------------- |
| `.cys`     | `load_network_cytoscape()` |
| `.cyjs`    | `load_network_cyjs()`      |
| `.gpickle` | `load_network_gpickle()`   |
| `NetworkX` | `load_network_networkx()`  |

All loaders accept shared preprocessing parameters for spherical projection, surface depth, and node filtering.

---

## Cytoscape `.cys` Files

Load Cytoscape session files exported from the desktop app.

**Parameters:**

- `filepath` (str): Path to the `.cys` file.
- `source_label` (str): Name of the source node attribute.
- `target_label` (str): Name of the target node attribute.
- `view_name` (str): Name of the Cytoscape view to load.
- `compute_sphere` (bool, default=True): Apply 3D Mercator-inspired spherical projection.
- `surface_depth` (float, default=0.0): Inward/outward displacement relative to sphere surface.
- `min_edges_per_node` (int, default=0): Minimum degree threshold for nodes.

**Returns:**

`nx.Graph`: The loaded and processed network as a NetworkX graph.

```python
network = risk.load_network_cytoscape(
    filepath="./data/cytoscape/michaelis_2023.cys",
    source_label="source",
    target_label="target",
    view_name="",
    compute_sphere=True,
    surface_depth=0.0,
    min_edges_per_node=0,
)
```

---

## Cytoscape JSON (`.cyjs`) Files

Load JSON exports from Cytoscape Web or JavaScript pipelines.

**Parameters:**

- `filepath` (str): Path to the `.cyjs` file.
- `source_label` (str): Name of the source node attribute.
- `target_label` (str): Name of the target node attribute.
- `compute_sphere` (bool, default=True): Apply 3D Mercator-inspired spherical projection.
- `surface_depth` (float, default=0.0): Inward/outward displacement relative to sphere surface.
- `min_edges_per_node` (int, default=0): Minimum degree threshold for nodes.

**Returns:**

`nx.Graph`: The loaded and processed network as a NetworkX graph.

```python
network = risk.load_network_cyjs(
    filepath="./data/cyjs/michaelis_2023.cyjs",
    source_label="source",
    target_label="target",
    compute_sphere=True,
    surface_depth=0.1,
    min_edges_per_node=1,
)
```

---

## GPickle (`.gpickle`) Files

Fast, Python-native serialization of NetworkX graphs preserving all attributes. Recommended for reproducibility and performance.

**Parameters:**

- `filepath` (str): Path to the `.gpickle` file.
- `compute_sphere` (bool, default=True): Apply 3D Mercator-inspired spherical projection.
- `surface_depth` (float, default=0.0): Inward/outward displacement relative to sphere surface.
- `min_edges_per_node` (int, default=0): Minimum degree threshold for nodes.

**Returns:**

`nx.Graph`: The loaded and processed network as a NetworkX graph.

```python
network = risk.load_network_gpickle(
    filepath="./data/gpickle/michaelis_2023.gpickle",
    compute_sphere=True,
    surface_depth=0.1,
    min_edges_per_node=1,
)
```

---

## NetworkX Graphs

Load directly from an in-memory `networkx.Graph`. Integrates seamlessly when the graph is already loaded.

**Parameters:**

- `network` (nx.Graph): The input NetworkX graph.
- `compute_sphere` (bool, default=True): Apply 3D Mercator-inspired spherical projection.
- `surface_depth` (float, default=0.0): Inward/outward displacement relative to sphere surface.
- `min_edges_per_node` (int, default=0): Minimum degree threshold for nodes.

**Returns:**

`nx.Graph`: The loaded and processed network as a NetworkX graph.

```python
network = risk.load_network_networkx(
    network=network,
    compute_sphere=True,
    surface_depth=0.1,
    min_edges_per_node=1,
)
```
