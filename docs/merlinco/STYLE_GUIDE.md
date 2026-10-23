# Modeling style guide

Consistent layer, interface, and validation rules make generated work reviewable and
trustworthy.

## Project shape

```text
seeds/medium_data/   portable raw CSV fixtures
models/
  staging/<source>/  source-facing models and source declarations
  intermediate/      joins, fanout control, and grain changes
  marts/             contracted marts and semantic definitions
macros/               shared cleanup logic
```

Workshop participants build the intentionally missing `dim_shops` and `fct_brews`
directly in `models/marts/`. Both required staging models already exist.

**Seeds vs. sources.** Raw relations are pre-built for the workshop. Models read through
`source()`; seeds remain portable setup fixtures.

## Layering

**Staging** reads exactly one declared source at source grain. It may rename, cast, trim,
normalize case, and reuse approved cleanup macros. It does not join, filter, deduplicate,
aggregate, or add downstream business logic.

**Intermediate** owns joins, deduplication, fanout control, aggregation, and grain
changes. The workshop marts preserve their staging grains and need no intermediate model.

**Marts** publish contracted, tested public products. A simple dimension or fact may read
directly from staging when no join or grain change is required.

## Naming and SQL structure

- Use `stg_<source>__<entity>`, `int_<description>`, `dim_<noun>`, and `fct_<noun>`.
- Use import CTEs first, bounded transformations as needed, an explicit `final` CTE,
  then `select * from final`.
- Use `snake_case` and lowercase SQL keywords and identifiers.
- PKs use `<entity>_id`; booleans use `is_*`/`has_*`; timestamps use `*_at`; dates
  use `*_date` or a date-typed `*_at`.
- Preserve unaffected columns and publish explicit ordered interfaces.

## Deliberate source quirks

| Quirk | Handling |
|---|---|
| Timestamp columns | Explicit target-type casts in staging |
| Messy booleans | `to_boolean()` |
| Copper integer prices | `copper_to_gold()` where reporting gold is approved |
| Inconsistent CRM region coding | `conform_region()` |
| Mixed-case categoricals | `lower(trim(...))` in staging |

## Testing standard

- Every PK: `unique` and `not_null`.
- Every governed FK: `relationships`.
- Every normalized categorical: grounded `accepted_values`.
- Every required field: `not_null` where the public interface requires it.
- Composite grains: a combination-uniqueness test.

For the workshop marts, `dim_shops` tests `shop_id` and canonical regions. `fct_brews`
tests `brew_id`, potion and shop relationships, and the normalized quality domain.
Nullable brew durations remain untested for non-nullness.

## Contracts

Public marts declare a `data_type` for every output column and enforce contracts. SQL
explicitly casts every public column to the matching type and order.

## CI and enforcement

Repository instructions guide behavior. Scoped builds, contracts, tests, lint, lineage
checks, warehouse acceptance checks, and accountable review establish trust.
