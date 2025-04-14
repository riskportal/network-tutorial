# Statistical Tests for Annotation Significance

RISK provides six statistical methods for testing enrichment or depletion of functional annotations within local network neighborhoods. Each method has different strengths depending on your data size, structure, and goals.

---

## Summary of Methods

| Test           | Speed     | Best For                            |
|----------------|-----------|-------------------------------------|
| Permutation    | 🐢 Slow    | Most robust, no assumptions         |
| Hypergeometric | ⚖️ Medium | GO/pathway analysis, exact sampling |
| Binomial       | ⚡ Fast    | Binary trials, scalable             |
| Chi-squared    | ⚡ Fast    | Contingency tables, large datasets  |
| Poisson        | ⚡ Fast    | Rare events, sparse networks        |
| Z-score        | ⚡ Fast    | Approximate, fast scanning          |

---

## Common Parameters

All methods use a shared API and return a `neighborhoods` dictionary with per-cluster statistics.

| Parameter               | Description |
|-------------------------|-------------|
| `network`               | NetworkX graph |
| `annotations`           | Annotation dict |
| `distance_metric`       | Method(s) for neighborhood detection (e.g., `'louvain'`) |
| `louvain_resolution`    | Resolution for Louvain clustering |
| `leiden_resolution`     | Resolution for Leiden clustering |
| `fraction_shortest_edges` | Filter for edge-based subgraphs |
| `null_distribution`     | `"network"` or `"annotations"` |
| `random_seed`           | Random state for reproducibility |

---

## 1. Permutation Test

Most robust method. Shuffles graph or annotations to build a null.

```python
neighborhoods = risk.load_neighborhoods_by_permutation(
    network=network,
    annotations=annotations,
    distance_metric="louvain",
    louvain_resolution=10.0,
    leiden_resolution=1.0,
    fraction_shortest_edges=0.275,
    score_metric="stdev",
    null_distribution="network",
    num_permutations=1000,
    random_seed=887,
    max_workers=1,
)
```

---

## 2. Hypergeometric Test

Exact test based on finite sampling without replacement.

```python
neighborhoods = risk.load_neighborhoods_by_hypergeom(
    network=network,
    annotations=annotations,
    distance_metric="louvain",
    louvain_resolution=10.0,
    fraction_shortest_edges=0.275,
    null_distribution="network",
    random_seed=887,
)
```

---

## 3. Binomial Test

Models binary outcomes assuming independent trials.

```python
neighborhoods = risk.load_neighborhoods_by_binom(
    network=network,
    annotations=annotations,
    distance_metric="louvain",
    louvain_resolution=10.0,
    fraction_shortest_edges=0.275,
    null_distribution="network",
    random_seed=887,
)
```

---

## 4. Chi-squared Test

Tests significance via contingency tables.

```python
neighborhoods = risk.load_neighborhoods_by_chi2(
    network=network,
    annotations=annotations,
    distance_metric="louvain",
    louvain_resolution=10.0,
    fraction_shortest_edges=0.275,
    null_distribution="network",
    random_seed=887,
)
```

---

## 5. Poisson Test

Evaluates deviation from expected frequency under Poisson.

```python
neighborhoods = risk.load_neighborhoods_by_poisson(
    network=network,
    annotations=annotations,
    distance_metric="louvain",
    louvain_resolution=10.0,
    fraction_shortest_edges=0.275,
    null_distribution="network",
    random_seed=887,
)
```

---

## 6. Z-score Test

Computes standardized enrichment scores for each cluster.

```python
neighborhoods = risk.load_neighborhoods_by_zscore(
    network=network,
    annotations=annotations,
    distance_metric="louvain",
    louvain_resolution=10.0,
    fraction_shortest_edges=0.275,
    null_distribution="network",
    random_seed=887,
)
```

---

## Output

All test functions return a `neighborhoods` dictionary with:

- Cluster IDs
- Term-wise enrichment scores
- Optional p-values or z-scores depending on method

Use this result to create a `NetworkGraph` in the next step.

---

## Next Step

Proceed to [5. Loading NetworkGraph](./5_load_graph.md) to build a cluster-aware network object.
