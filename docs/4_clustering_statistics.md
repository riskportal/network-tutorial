# Summary of Clustering Algorithms and Statistical Methods

RISK implements several community detection algorithms and statistical tests to support functional annotation of networks. Clustering algorithms detect structured regions of varying size and density, while statistical methods evaluate overrepresentation of biological terms within these regions. The choice of algorithm or test depends on network scale, density, and biological context, influencing the resolution, granularity, and rigor of the resulting modules and enrichment results.

---

## Summary of Clustering Algorithms

| Algorithm          | Speed   | Primary use                                 | When/Why (assumptions & notes)                                                                 |
| ------------------ | ------- | ------------------------------------------- | ----------------------------------------------------------------------------------------------- |
| **Louvain**        | Fast    | Default, scalable to very large networks    | Greedy modularity optimization (Blondel _et al_., 2008); efficient for >10⁴ nodes; may produce disconnected subclusters. |
| **Leiden**         | Fast    | Improved Louvain with better resolution     | Guarantees well-connected communities; more stable than Louvain (Traag _et al_., 2019); slightly higher runtime.        |
| **Markov Clustering (MCL)** | Medium | Detect smaller, dense complexes              | Flow-based algorithm (Van Dongen, 2008); good for protein complexes or tightly connected submodules.                |
| **Walktrap**       | Medium  | Hierarchical detection in mid-sized graphs  | Random-walk based (Pons & Latapy, 2005); effective for local structure; slower on >10⁴ nodes.                         |
| **Greedy Modularity** | Fast | Coarse partitioning                         | Optimizes modularity via agglomeration; very fast but favors large, broad clusters (Newman, 2004).              |
| **Label Propagation** | Fast | Quick heuristic                             | Unsupervised label spreading; no objective function; non-deterministic and unstable (Zhu & Ghahramani, 2002).             |
| **Spinglass**      | Slow    | Small networks; theoretical interest        | Statistical mechanics approach (Reichardt & Bornholdt, 2006); supports overlapping modules; computationally intensive.         |

### Choosing an algorithm: quick guidance

- For large networks (>10⁴ nodes): **Louvain** or **Leiden** (fast, scalable).
- For small, dense complexes: **MCL** (protein complexes, submodules).
- For hierarchical/local structure: **Walktrap** (medium size).
- For exploratory speed: **Greedy** or **Label Propagation** (but less precise).
- For research/theory on small graphs: **Spinglass** (rarely used in practice).

---

## Summary of Statistical Methods

RISK implements multiple statistical methods to assess overrepresentation of functional terms in network neighborhoods. Each method has strengths depending on dataset size, structure, and precision requirements.

| Test           | Speed  | Primary use                              | When/Why (assumptions & notes)                                                                                              |
| -------------- | ------ | ---------------------------------------- | --------------------------------------------------------------------------------------------------------------------------- |
| Permutation    | Medium | Most robust; non-parametric              | Distribution-free empirical null (permute network or labels); best when assumptions are unclear; computationally intensive. |
| Hypergeometric | Medium | Standard for GO/pathway enrichment       | Finite population without replacement; exact count-based test for term–to–gene membership tables.                           |
| Binomial       | Fast   | Scalable approximation                   | With replacement/independent trials; good large-population approximation to hypergeometric when sample << population.       |
| Chi-squared    | Fast   | Contingency-table testing, large samples | For large counts; expected cell counts ≥ 5; very fast for big tables; avoid with sparse/low counts.                         |
| Poisson        | Fast   | Rare events, sparse networks             | Counts of independent events at ~constant rate; good when events are rare (small p, large n). Check for overdispersion.     |
| Z-score        | Fast   | Quick standardized scoring               | Normal approximation; great for rapid ranking at scale; avoid when counts are very small or highly skewed.                  |

### Choosing a test: quick guidance

- If assumptions are unclear / want a gold-standard null: use **Permutation** (robust, slower).
- Finite population without replacement (standard GO enrichment): use **Hypergeometric**.
- Need speed with large populations and small samples: use **Binomial** (approximation to hypergeometric).
- Many categories and large counts: use **Chi-squared** (fast), but ensure expected counts ≥ 5 per cell.
- Rare-event counts (sparse networks): use **Poisson**; verify that a constant-rate assumption is reasonable.
- Just need a fast ranking score (not exact p-values): use **Z-score**; treat results as heuristic when counts are small.

---

## Permutation Test

Builds an empirical null by permuting either the network structure or annotation labels.

**When to use:**

- Non-parametric and distribution-free; ideal when analytical assumptions (independence, variance, distribution) are doubtful.
- Supports flexible nulls (permute network topology or term labels) to match study design.
- Most robust option but computationally intensive; prefer for smaller networks or final confirmation analyses.

**Parameters:**

- `network` (nx.Graph): The network graph.
- `annotation` (dict): The annotation associated with the network.
- `distance_metric` (str, list, tuple, or np.ndarray, optional): Methods for community detection, supporting `louvain`, `greedy_modularity`, `label_propagation`, `leiden`, `markov_clustering`, `walktrap`, `spinglass`.
- `louvain_resolution` (float, optional): Resolution parameter for Louvain. Defaults to 0.1.
- `leiden_resolution` (float, optional): Resolution parameter for Leiden. Defaults to 1.0.
- `fraction_shortest_edges` (float, list, tuple, or np.ndarray, optional): Edge threshold(s) for subgraphs. Defaults to 0.5.
- `score_metric` (str, optional): Scoring metric used in permutation tests; options include `"sum"` (default) and `"stdev"`.
- `num_permutations` (int, optional): Number of permutations (only used in permutation test). Defaults to 1000.
- `max_workers` (int, optional): Number of parallel workers for permutation tests. Defaults to 1.
- `null_distribution` (str, optional): `"network"` (default) or `"annotation"`.
- `random_seed` (int, optional): Seed for reproducibility.

**Returns:**

- `dict`: A dictionary containing the computed significance of neighborhoods within the network.

```python
neighborhoods = risk.load_neighborhoods_permutation(
    network=network,
    annotation=annotation,
    distance_metric="louvain",
    louvain_resolution=10.0,
    leiden_resolution=1.0,
    fraction_shortest_edges=0.225,
    score_metric="stdev",
    null_distribution="network",
    num_permutations=1000,
    random_seed=887,
    max_workers=1,
)
```

---

## Hypergeometric Test

Exact test based on finite sampling without replacement.

**When to use:**

- Standard for GO/pathway overrepresentation with term–to–gene membership tables.
- Appropriate for finite populations sampled without replacement (e.g., selected cluster vs whole network).
- Exact test; more accurate than approximations when sample is not negligible relative to the population.

**Parameters:**

- `network` (nx.Graph): The network graph.
- `annotation` (dict): The annotation associated with the network.
- `distance_metric` (str, list, tuple, or np.ndarray, optional): Methods for community detection, supporting `louvain`, `greedy_modularity`, `label_propagation`, `leiden`, `markov_clustering`, `walktrap`, `spinglass`.
- `louvain_resolution` (float, optional): Resolution parameter for Louvain. Defaults to 0.1.
- `leiden_resolution` (float, optional): Resolution parameter for Leiden. Defaults to 1.0.
- `fraction_shortest_edges` (float, list, tuple, or np.ndarray, optional): Edge threshold(s) for subgraphs. Defaults to 0.5.
- `null_distribution` (str, optional): `"network"` (default) or `"annotation"`.
- `random_seed` (int, optional): Seed for reproducibility.

**Returns:**

- `dict`: A dictionary containing the computed significance of neighborhoods within the network.

```python
neighborhoods = risk.load_neighborhoods_hypergeom(
    network=network,
    annotation=annotation,
    distance_metric="louvain",
    louvain_resolution=10.0,
    leiden_resolution=1.0,
    fraction_shortest_edges=0.225,
    null_distribution="network",
    random_seed=887,
)
```

---

## Binomial Test

Approximates overrepresentation via independent trials.

**When to use:**

- Fast approximation to hypergeometric when the population is large and the sample is small (sample << population).
- Assumes independent trials / with-replacement sampling; use when this is reasonable or as a scalable proxy.
- Useful for very large networks where exact tests are costly.

**Parameters:**

- `network` (nx.Graph): The network graph.
- `annotation` (dict): The annotation associated with the network.
- `distance_metric` (str, list, tuple, or np.ndarray, optional): Methods for community detection, supporting `louvain`, `greedy_modularity`, `label_propagation`, `leiden`, `markov_clustering`, `walktrap`, `spinglass`.
- `louvain_resolution` (float, optional): Resolution parameter for Louvain. Defaults to 0.1.
- `leiden_resolution` (float, optional): Resolution parameter for Leiden. Defaults to 1.0.
- `fraction_shortest_edges` (float, list, tuple, or np.ndarray, optional): Edge threshold(s) for subgraphs. Defaults to 0.5.
- `null_distribution` (str, optional): `"network"` (default) or `"annotation"`.
- `random_seed` (int, optional): Seed for reproducibility.

**Returns:**

- `dict`: A dictionary containing the computed significance of neighborhoods within the network.

```python
neighborhoods = risk.load_neighborhoods_binom(
    network=network,
    annotation=annotation,
    distance_metric="louvain",
    louvain_resolution=10.0,
    leiden_resolution=1.0,
    fraction_shortest_edges=0.225,
    null_distribution="network",
    random_seed=887,
)
```

---

## Chi-squared Test

Evaluates significance using contingency tables.

**When to use:**

- Best for large-sample contingency analyses across multiple categories.
- Rule of thumb: expected counts per cell should be ≥ 5; avoid with sparse tables (consider permutation or exact alternatives).
- Extremely fast and scalable for big matrices.

**Parameters:**

- `network` (nx.Graph): The network graph.
- `annotation` (dict): The annotation associated with the network.
- `distance_metric` (str, list, tuple, or np.ndarray, optional): Methods for community detection, supporting `louvain`, `greedy_modularity`, `label_propagation`, `leiden`, `markov_clustering`, `walktrap`, `spinglass`.
- `louvain_resolution` (float, optional): Resolution parameter for Louvain. Defaults to 0.1.
- `leiden_resolution` (float, optional): Resolution parameter for Leiden. Defaults to 1.0.
- `fraction_shortest_edges` (float, list, tuple, or np.ndarray, optional): Edge threshold(s) for subgraphs. Defaults to 0.5.
- `null_distribution` (str, optional): `"network"` (default) or `"annotation"`.
- `random_seed` (int, optional): Seed for reproducibility.

**Returns:**

- `dict`: A dictionary containing the computed significance of neighborhoods within the network.

```python
neighborhoods = risk.load_neighborhoods_chi2(
    network=network,
    annotation=annotation,
    distance_metric="louvain",
    louvain_resolution=10.0,
    leiden_resolution=1.0,
    fraction_shortest_edges=0.225,
    null_distribution="network",
    random_seed=887,
)
```

---

## Poisson Test

Tests observed frequencies against a Poisson expectation.

**When to use:**

- Suitable for rare-event counts under an approximately constant rate; independence between events is assumed.
- Approximates binomial when event probability is small and the number of trials is large (small p, large n).
- Effective for sparse networks; check for overdispersion before use.

**Parameters:**

- `network` (nx.Graph): The network graph.
- `annotation` (dict): The annotation associated with the network.
- `distance_metric` (str, list, tuple, or np.ndarray, optional): Methods for community detection, supporting `louvain`, `greedy_modularity`, `label_propagation`, `leiden`, `markov_clustering`, `walktrap`, `spinglass`.
- `louvain_resolution` (float, optional): Resolution parameter for Louvain. Defaults to 0.1.
- `leiden_resolution` (float, optional): Resolution parameter for Leiden. Defaults to 1.0.
- `fraction_shortest_edges` (float, list, tuple, or np.ndarray, optional): Edge threshold(s) for subgraphs. Defaults to 0.5.
- `null_distribution` (str, optional): `"network"` (default) or `"annotation"`.
- `random_seed` (int, optional): Seed for reproducibility.

**Returns:**

- `dict`: A dictionary containing the computed significance of neighborhoods within the network.

```python
neighborhoods = risk.load_neighborhoods_poisson(
    network=network,
    annotation=annotation,
    distance_metric="louvain",
    louvain_resolution=10.0,
    leiden_resolution=1.0,
    fraction_shortest_edges=0.225,
    null_distribution="network",
    random_seed=887,
)
```

---

## Z-score Test

Computes standardized enrichment scores.

**When to use:**

- Fastest option for large-scale screening and ranking.
- Relies on normal approximation (via CLT); works best with moderate-to-large counts.
- Treat as heuristic for very small counts or highly skewed distributions; confirm key findings with an exact or permutation test.

**Parameters:**

- `network` (nx.Graph): The network graph.
- `annotation` (dict): The annotation associated with the network.
- `distance_metric` (str, list, tuple, or np.ndarray, optional): Methods for community detection, supporting `louvain`, `greedy_modularity`, `label_propagation`, `leiden`, `markov_clustering`, `walktrap`, `spinglass`.
- `louvain_resolution` (float, optional): Resolution parameter for Louvain. Defaults to 0.1.
- `leiden_resolution` (float, optional): Resolution parameter for Leiden. Defaults to 1.0.
- `fraction_shortest_edges` (float, list, tuple, or np.ndarray, optional): Edge threshold(s) for subgraphs. Defaults to 0.5.
- `null_distribution` (str, optional): `"network"` (default) or `"annotation"`.
- `random_seed` (int, optional): Seed for reproducibility.

**Returns:**

- `dict`: A dictionary containing the computed significance of neighborhoods within the network.

```python
neighborhoods = risk.load_neighborhoods_zscore(
    network=network,
    annotation=annotation,
    distance_metric="louvain",
    louvain_resolution=10.0,
    leiden_resolution=1.0,
    fraction_shortest_edges=0.225,
    null_distribution="network",
    random_seed=887,
)
```
