# Visualization

RISK provides a flexible and powerful plotting interface via the `NetworkPlotter` object. This enables generation of publication-ready figures with detailed domain annotations, significance-driven coloring, KDE-based contours, and rich label customization.

---

## Create a Plotter

You must first load your `NetworkGraph` object into a `NetworkPlotter`.

```python
plotter = risk.load_plotter(
    graph=graph,
    figsize=(15, 15),
    background_color="black",
    background_alpha=1.0,
    pad=0.3,
)
```

---

## Core Plotting Methods

The following methods control different aspects of the visualization:

| Method                     | Purpose                                                                                                      |
| -------------------------- | ------------------------------------------------------------------------------------------------------------ |
| `plot_title()`             | Add a title and subtitle overlay in the center of the network                                                |
| `plot_circle_perimeter()`  | Draw a circular boundary around the network layout for visual framing                                        |
| `plot_contour_perimeter()` | Draw a KDE-based contour around the entire network layout perimeter                                          |
| `plot_network()`           | Render nodes and edges based on statistical significance, using size and color to reflect overrepresentation |
| `plot_subnetwork()`        | Highlight a selected group of nodes in a different style (e.g., metabolic vs. ribosomal)                     |
| `plot_contours()`          | Draw shaded KDE contours around clustered domains (e.g., GO term regions)                                    |
| `plot_subcontour()`        | Draw a KDE contour around a specific list of nodes or a small subgraph                                       |
| `plot_labels()`            | Automatically generate text labels and arrows for each domain or functional region                           |
| `plot_sublabel()`          | Manually add a label and arrow for a user-defined node set                                                   |
| `savefig()`                | Save the current figure as a SVG, PNG, PDF, etc.                                                  |
| `show()`                   | Display the current plot in a notebook or interactive window                                                 |

Many of these methods support additional customization parameters beyond the examples shown below. For a full list, use `help(plotter.method_name)` in a Python environment or refer to the in-notebook documentation.

---

## Example: Core Visualization Workflow

The following sequence illustrates the most commonly used core plotting methods in RISK. These can be combined to create clear, informative figures with minimal code.

### Add a Title

```python
plotter.plot_title(
    title="Yeast Genetic Interaction Network",
    subtitle="Colored by Overrepresentation Score",
    fontcolor="white",
    fontsize=20,
    subtitle_color="white",
)
```

### Draw a Circle Perimeter

```python
plotter.plot_circle_perimeter(
    radius=1.0,
    color="white",
    linewidth=2.0,
    linestyle="solid",
    alpha=1.0,
)
```

_For a more flexible KDE-based layout boundary, see `plot_contour_perimeter()`._

### Plot the Annotated Network

The `plot_network()` method draws the full network similarly to networkx.draw, but with enhanced styling and layout control. It is the primary way to visualize domain-level significance on the graph.

While `plot_network()` can be used as-is, RISK provides helper functions such as `get_annotated_node_sizes()` and `get_annotated_node_colors()` to automatically generate node styles based on annotation significance. These outputs plug directly into `plot_network()`.

```python
node_sizes = plotter.get_annotated_node_sizes(
    significant_size=200,
    nonsignificant_size=10,
)

node_colors = plotter.get_annotated_node_colors(
    cmap="gist_rainbow",
    blend_colors=False,
    blend_gamma=2.2,
    min_scale=0.8,
    max_scale=1.0,
    scale_factor=0.5,
    alpha=1.0,
    nonsignificant_color="white",
    nonsignificant_alpha=0.75,
    random_seed=888,
)

plotter.plot_network(
    node_size=node_sizes,
    node_color=node_colors,
    node_shape="o",
    node_edgewidth=1.0,
    edge_width=0.04,
    node_edgecolor="black",
    edge_color="white",
    node_alpha=1.0,
    edge_alpha=1.0,
)
```

You can also use `plotter.get_annotated_contour_colors()` and `plotter.get_annotated_label_colors()` for consistent domain-based color themes across contours and labels.

### Highlight a Subnetwork

Use `plot_subnetwork()` to overlay a custom set of nodes with distinct styling—useful for emphasizing known complexes or pathway members.

```python
plotter.plot_subnetwork(
    nodes=["RPL1A", "RPL2B", "RPL3", "RPL5"],
    color="white",
    size=220,
    alpha=0.8,
)
```

---

## Domain Overlays with KDE Contours

You can highlight functionally overrepresented domains using KDE-based contours.

### All domains:

```python
plotter.plot_contours(
    levels=5,
    bandwidth=0.8,
    grid_size=250,
    color=plotter.get_annotated_contour_colors(...),
    linestyle="solid",
    linewidth=2.0,
    alpha=1.0,
    fill_alpha=0.25,
)
```

### Subsets of interest:

```python
plotter.plot_subcontour(
    nodes=["LSM1", "LSM2", "LSM3", "PAT1"],
    color="white",
    levels=5,
    fill_alpha=0.25,
)
```

---

## Domain Labels and Arrows

### Label all domains

```python
plotter.plot_labels(
    font="Arial",
    fontsize=15,
    fontcase={"title": "lower"},
    fontcolor="white",
    fontalpha=1.0,
    arrow_color=plotter.get_annotated_label_colors(...),
    arrow_style="-",
    arrow_alpha=1.0,
    max_labels=28,
    min_label_lines=3,
    max_label_lines=4,
    min_chars_per_line=3,
    max_chars_per_line=12,
    words_to_omit=["from", "the", "into", "via", "process"],
)
```

### Add a custom label

```python
plotter.plot_sublabel(
    nodes=["LSM1", "LSM2", "PAT1"],
    label="LSM1-7-PAT1 Complex",
    radial_position=73,
    scale=1.6,
    offset=0.12,
    fontcolor="white",
    fontsize=15,
)
```

---

## Export and Display

### Save your figure

```python
plotter.savefig("my_plot.png", dpi=300)
```

### Display the figure in a notebook/script

```python
plotter.show()
```

![GO BP PPI Network](images/go_bp_annotated.png)

---

## Next Step

You’re now ready to export your results or continue exploring [7. Advanced Plotting](./7_advanced_plotting.md) features like background layers, dynamic coloring, and multi-panel layouts.
