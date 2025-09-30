# Visualizing Networks in RISK

RISK provides a flexible and powerful plotting interface via the `NetworkPlotter` object. This enables generation of publication-ready figures with detailed domain annotations, significance-driven coloring, contours, and rich label customization.

---

## Create a `NetworkPlotter`

You must first load your `NetworkGraph` object into a `NetworkPlotter`.

**Parameters:**

- `graph` (NetworkGraph): The network graph to visualize.
- `figsize` (tuple, optional): Size of the figure in inches `(width, height)`. Default is `(10, 10)`.
- `background_color` (str or tuple, optional): Background color of the plot. Default is `"white"`.
- `background_alpha` (float, optional): Opacity of the plot background. Default is `1.0`.
- `pad` (float, optional): Extra padding around the network layout. Default is `0.3`.

**Returns:**

- `NetworkPlotter`: An instance of the plotter initialized with the provided graph and settings.

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

## plot_title()

Add a title and optional subtitle overlay.

**Parameters:**

- `title` (str): Main title text.
- `subtitle` (str, optional): Subtitle text.
- `title_fontsize` (int, optional): Font size for the title.
- `subtitle_fontsize` (int, optional): Font size for the subtitle.
- `font` (str, optional): Font family.
- `title_color` (str or tuple, optional): Color for the title text.
- `subtitle_color` (str or tuple, optional): Color for the subtitle text.
- `title_x` (float, optional): X-position of the title in figure coordinates.
- `title_y` (float, optional): Y-position of the title in figure coordinates.
- `title_space_offset` (float, optional): Vertical spacing offset for the title.
- `subtitle_offset` (float, optional): Vertical spacing offset for the subtitle.

```python
plotter.plot_title(
    title="Yeast PPI Network",
    subtitle="Michaelis et al., 2023",
    title_fontsize=24,
    subtitle_fontsize=18,
    font="Arial",
    title_color="white",
    subtitle_color="lightblue",
    title_x=0.5,
    title_y=0.925,
    title_space_offset=0.08,
    subtitle_offset=0.025,
)
```

---

## plot_circle_perimeter()

Draw a circular boundary around the network layout.

**Parameters:**

- `scale` (float, optional): Scale factor for the circle size.
- `center_offset_x` (float, optional): Horizontal offset of the circle center.
- `center_offset_y` (float, optional): Vertical offset of the circle center.
- `linestyle` (str, optional): Matplotlib line style string (e.g., `"solid"`, `"dashed"`).
- `linewidth` (float, optional): Width of the circle boundary line.
- `color` (str or tuple, optional): Color of the circle boundary.
- `outline_alpha` (float, optional): Transparency of the circle outline.
- `fill_alpha` (float, optional): Transparency of the circle fill.

```python
plotter.plot_circle_perimeter(
    scale=1.02,
    center_offset_x=0.0,
    center_offset_y=0.0,
    linestyle="solid",
    linewidth=1.5,
    color="white",
    outline_alpha=1.0,
    fill_alpha=0.0,
)
```

_For a more flexible countour-based layout boundary, see `plot_contour_perimeter()`._

---

## plot_contour_perimeter()

Draw a contour around the entire layout perimeter.

**Parameters:**

- `levels` (int, optional): Number of contour levels.
- `bandwidth` (float, optional): Bandwidth parameter for Kernel Density Estimation (KDE).
- `grid_size` (int, optional): Resolution of the grid used for KDE.
- `color` (str or tuple or list, optional): Color(s) for the contour lines.
- `linestyle` (str, optional): Matplotlib line style string.
- `linewidth` (float, optional): Width of the contour lines.
- `alpha` (float, optional): Transparency of the contour lines.
- `fill_alpha` (float, optional): Transparency of the filled contour areas.

```python
plotter.plot_contour_perimeter(
    levels=5,
    bandwidth=0.8,
    grid_size=250,
    color="white",
    linestyle="solid",
    linewidth=2.0,
    alpha=1.0,
    fill_alpha=0.2,
)
```

---

## plot_network()

Render nodes and edges with styles derived from significance-aware helpers.

**Parameters:**

- `node_size` (list or array, optional): Sizes for each node.
- `node_color` (list or array or str, optional): Colors for each node.
- `node_shape` (str, optional): Shape of the nodes (e.g., `"o"`).
- `node_edgewidth` (float, optional): Width of the node borders.
- `edge_width` (float, optional): Width of the edges.
- `node_edgecolor` (str or tuple, optional): Color of the node borders.
- `edge_color` (str or tuple, optional): Color of the edges.
- `node_alpha` (float, optional): Transparency of nodes.
- `edge_alpha` (float, optional): Transparency of edges.

```python
plotter.plot_network(
    node_size=node_sizes,
    node_color=node_colors,
    node_shape="o",
    node_edgewidth=1.0,
    edge_width=0.03,
    node_edgecolor="black",
    edge_color="white",
    node_alpha=1.0,
    edge_alpha=1.0,
)
```

---

## get_annotated_node_sizes()

Generate node sizes based on annotation significance.

**Parameters:**

- `significant_size` (float, optional): Size for significant nodes.
- `nonsignificant_size` (float, optional): Size for non-significant nodes.

**Returns:**

- `list`: List of node sizes corresponding to graph nodes.

```python
node_sizes = plotter.get_annotated_node_sizes(
    significant_size=225,
    nonsignificant_size=12.5,
)
```

---

## get_annotated_node_colors()

Generate node colors based on annotation significance and optional blending.

**Parameters:**

- `cmap` (str, optional): Colormap name. Default `"gist_rainbow"`.
- `color` (str or tuple, optional): Base color.
- `blend_colors` (bool, optional): Whether to blend colors.
- `blend_gamma` (float, optional): Gamma correction for blending.
- `min_scale` (float, optional): Minimum scale factor.
- `max_scale` (float, optional): Maximum scale factor.
- `scale_factor` (float, optional): Scaling applied to colors.
- `alpha` (float, optional): Transparency.
- `nonsignificant_color` (str or tuple, optional): Color for non-significant nodes.
- `nonsignificant_alpha` (float, optional): Transparency for non-significant nodes.
- `ids_to_colors` (dict, optional): Mapping from node IDs to colors.
- `random_seed` (int, optional): Seed for reproducible color sampling.

**Returns:**

- `list`: List of colors for each node.

```python
node_colors = plotter.get_annotated_node_colors(
    cmap="gist_rainbow",
    color=None,
    blend_colors=False,
    blend_gamma=2.2,
    min_scale=1.0,
    max_scale=1.0,
    scale_factor=0.5,
    alpha=1.0,
    nonsignificant_color="white",
    nonsignificant_alpha=0.75,
    ids_to_colors=None,
    random_seed=887,
)
```

---

## plot_subnetwork()

Overlay a selected group of nodes and their connecting edges with distinct styling.

**Parameters:**

- `nodes` (list): List of node IDs to highlight.
- `node_size` (float, optional): Size for the subnetwork nodes.
- `node_shape` (str, optional): Shape of the subnetwork nodes.
- `node_edgewidth` (float, optional): Width of the subnetwork node borders.
- `edge_width` (float, optional): Width of the subnetwork edges.
- `node_color` (str or tuple, optional): Color of the subnetwork nodes.
- `node_edgecolor` (str or tuple, optional): Color of the subnetwork node borders.
- `edge_color` (str or tuple, optional): Color of the subnetwork edges.
- `node_alpha` (float, optional): Transparency of subnetwork nodes.
- `edge_alpha` (float, optional): Transparency of subnetwork edges.

```python
plotter.plot_subnetwork(
    nodes=[
        "LSM1", "LSM2", "LSM3", "LSM4", "LSM5", "LSM6", "LSM7", "PAT1",
    ],
    node_size=225,
    node_shape="^",
    node_edgewidth=1.0,
    edge_width=0.04,
    node_color="white",
    node_edgecolor="black",
    edge_color="white",
    node_alpha=1.0,
    edge_alpha=1.0,
)
```

---

## plot_contours()

Draw contours for domains (e.g., GO term regions).

**Parameters:**

- `levels` (int, optional): Number of contour levels.
- `bandwidth` (float, optional): Bandwidth parameter for Kernel Density Estimation (KDE).
- `grid_size` (int, optional): Resolution of the grid used for KDE.
- `color` (list or str or tuple, optional): Colors for the contours.
- `linestyle` (str, optional): Matplotlib line style string.
- `linewidth` (float, optional): Width of the contour lines.
- `alpha` (float, optional): Transparency of the contour lines.
- `fill_alpha` (float, optional): Transparency of the filled contour areas.

```python
plotter.plot_contours(
    levels=5,
    bandwidth=0.8,
    grid_size=250,
    color=plotter.get_annotated_contour_colors(
        cmap="gist_rainbow",
        color=None,
        blend_colors=False,
        blend_gamma=2.2,
        min_scale=1.0,
        max_scale=1.0,
        scale_factor=0.5,
        ids_to_colors=None,
        random_seed=887,
    ),
    linestyle="solid",
    linewidth=2.0,
    alpha=1.0,
    fill_alpha=0.2,
)
```

---

## get_annotated_contour_colors()

Generate colors for domain contours based on annotation significance.

**Parameters:**

- `cmap` (str, optional): Colormap name. Default `"gist_rainbow"`.
- `color` (str or tuple, optional): Base color.
- `blend_colors` (bool, optional): Whether to blend colors.
- `blend_gamma` (float, optional): Gamma correction for blending.
- `min_scale` (float, optional): Minimum scale factor.
- `max_scale` (float, optional): Maximum scale factor.
- `scale_factor` (float, optional): Scaling applied to colors.
- `ids_to_colors` (dict, optional): Mapping from domain IDs to colors.
- `random_seed` (int, optional): Seed for reproducible color sampling.

**Returns:**

- `list`: List of colors for each domain contour.

```python
contour_colors = plotter.get_annotated_contour_colors(
    cmap="gist_rainbow",
    color=None,
    blend_colors=False,
    blend_gamma=2.2,
    min_scale=1.0,
    max_scale=1.0,
    scale_factor=0.5,
    ids_to_colors=None,
    random_seed=887,
)
```

---

## plot_subcontour()

Draw a contour around a subset of nodes.

**Parameters:**

- `nodes` (list): List of node IDs to include in the contour.
- `levels` (int, optional): Number of contour levels.
- `bandwidth` (float, optional): Bandwidth parameter for Kernel Density Estimation (KDE).
- `grid_size` (int, optional): Resolution of the grid used for KDE.
- `color` (str or tuple, optional): Color of the contour.
- `linestyle` (str, optional): Matplotlib line style string.
- `linewidth` (float, optional): Width of the contour lines.
- `alpha` (float, optional): Transparency of the contour lines.
- `fill_alpha` (float, optional): Transparency of the filled contour area.

```python
plotter.plot_subcontour(
    nodes=[
        "LSM1", "LSM2", "LSM3", "LSM4", "LSM5", "LSM6", "LSM7", "PAT1",
    ],
    levels=5,
    bandwidth=0.8,
    grid_size=250,
    color="white",
    linestyle="solid",
    linewidth=2.0,
    alpha=1.0,
    fill_alpha=0.25,
)
```

---

## plot_labels()

Annotate selected nodes or domains with styled text and arrows.

**Parameters:**

- `scale` (float, optional): Scaling factor for labels.
- `offset` (float, optional): Offset distance for labels.
- `font` (str, optional): Font family.
- `fontcase` (dict, optional): Case transformations for titles.
- `fontsize` (int, optional): Font size.
- `fontcolor` (str or tuple, optional): Font color.
- `fontalpha` (float, optional): Font transparency.
- `arrow_linewidth` (float, optional): Width of arrow lines.
- `arrow_style` (str, optional): Style of arrows.
- `arrow_color` (list or str or tuple, optional): Colors for arrows.
- `arrow_alpha` (float, optional): Transparency of arrows.
- `arrow_base_shrink` (float, optional): Shrink length at arrow base.
- `arrow_tip_shrink` (float, optional): Shrink length at arrow tip.
- `max_labels` (int, optional): Maximum number of labels to display.
- `min_label_lines` (int, optional): Minimum lines per label.
- `max_label_lines` (int, optional): Maximum lines per label.
- `min_chars_per_line` (int, optional): Minimum characters per line.
- `max_chars_per_line` (int, optional): Maximum characters per line.
- `words_to_omit` (list, optional): Words to omit from labels.
- `overlay_ids` (bool, optional): Whether to overlay node IDs.
- `ids_to_keep` (list, optional): List of node IDs to keep.
- `ids_to_labels` (dict, optional): Mapping from node IDs to label strings.

```python
plotter.plot_labels(
    scale=1.1,
    offset=0.12,
    font="Arial",
    fontcase={"title": "lower"},
    fontsize=15,
    fontcolor="white",
    fontalpha=1.0,
    arrow_linewidth=2.0,
    arrow_style="-",
    arrow_color=plotter.get_annotated_label_colors(
        cmap="gist_rainbow",
        color=None,
        blend_colors=False,
        blend_gamma=2.2,
        min_scale=1.0,
        max_scale=1.0,
        scale_factor=0.5,
        ids_to_colors=None,
        random_seed=random_seed,
    ),
    arrow_alpha=1.0,
    arrow_base_shrink=10.0,
    arrow_tip_shrink=0.0,
    max_labels=28,
    min_label_lines=3,
    max_label_lines=4,
    min_chars_per_line=3,
    max_chars_per_line=12,
    words_to_omit=["from", "the", "into", "via", "novo", "process", "activity"],
    overlay_ids=False,
    ids_to_keep=None,
    ids_to_labels=None,
)
```

---

## get_annotated_label_colors()

Generate colors for labels based on annotation significance.

**Parameters:**

- `cmap` (str, optional): Colormap name. Default `"gist_rainbow"`.
- `color` (str or tuple, optional): Base color.
- `blend_colors` (bool, optional): Whether to blend colors.
- `blend_gamma` (float, optional): Gamma correction for blending.
- `min_scale` (float, optional): Minimum scale factor.
- `max_scale` (float, optional): Maximum scale factor.
- `scale_factor` (float, optional): Scaling applied to colors.
- `ids_to_colors` (dict, optional): Mapping from label IDs to colors.
- `random_seed` (int, optional): Seed for reproducible color sampling.

**Returns:**

- `list`: List of colors for each label.

```python
label_colors = plotter.get_annotated_label_colors(
    cmap="gist_rainbow",
    color=None,
    blend_colors=False,
    blend_gamma=2.2,
    min_scale=1.0,
    max_scale=1.0,
    scale_factor=0.5,
    ids_to_colors=None,
    random_seed=random_seed,
)
```

---

## plot_sublabel()

Add a single label tied to a chosen set of nodes (arrow points to centroid). Useful for naming complexes or pathway modules.

**Parameters:**

- `nodes` (list): List of node IDs to label.
- `label` (str): Text label.
- `radial_position` (float, optional): Radial position for label placement.
- `scale` (float, optional): Scaling factor for the label.
- `offset` (float, optional): Offset distance for the label.
- `font` (str, optional): Font family.
- `fontsize` (int, optional): Font size.
- `fontcolor` (str or tuple, optional): Font color.
- `fontalpha` (float, optional): Font transparency.
- `arrow_linewidth` (float, optional): Width of arrow lines.
- `arrow_style` (str, optional): Style of arrows.
- `arrow_color` (str or tuple, optional): Color of the arrow.
- `arrow_alpha` (float, optional): Transparency of the arrow.
- `arrow_base_shrink` (float, optional): Shrink length at arrow base.
- `arrow_tip_shrink` (float, optional): Shrink length at arrow tip.

```python
plotter.plot_sublabel(
    nodes=[
        "LSM1", "LSM2", "LSM3", "LSM4", "LSM5", "LSM6", "LSM7", "PAT1",
    ],
    label="LSM1-7-PAT1 Complex",
    radial_position=73,
    scale=1.6,
    offset=0.12,
    font="Arial",
    fontsize=15,
    fontcolor="white",
    fontalpha=1.0,
    arrow_linewidth=2.0,
    arrow_style="-",
    arrow_color="white",
    arrow_alpha=1.0,
    arrow_base_shrink=10.0,
    arrow_tip_shrink=0.0,
)
```

---

## savefig()

Save the current figure to file in formats like PNG, SVG, or PDF.

**Parameters:**

- `filename` (str): Path and name of the output file.

```python
plotter.savefig("my_plot.png")
```

---

## show()

Display the current figure inline or in a graphical window.

**Parameters:**

- None

```python
plotter.show()
```

---

![Annotated Yeast PPI Network](images/go_bp_annotated.png)
