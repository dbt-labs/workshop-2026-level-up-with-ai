---
name: create-intermediate-model
description: Use when creating or materially changing a dbt intermediate model for reusable joins, enrichment, deduplication, or grain changes.
---

# Build a dependable intermediate model

## Goal

Create reusable transformation logic with an explicit output grain and controlled join,
deduplication, and aggregation behavior.

## Workflow

1. Inspect project instructions, `dbt_project.yml`, upstream SQL and YAML, representative
   data, nearby intermediate models, lineage, and the nearest materialized downstream node.
2. State every input grain and key, the output grain and key, join type and cardinality,
   retained population, transformation purpose, and intended downstream reuse.
3. Use `ref()` for every dependency; do not use `source()` or hardcoded warehouse relations.
   Profile join keys, duplicate distributions, and match rates before joining.
4. Block raw many-to-many joins until an approved bridge, allocation, or pre/post-join
   aggregation makes the output deterministic. Deduplicate only with an approved partition,
   precedence rule, and deterministic tie-breaker. Never use `distinct` to hide fanout.
5. Keep source cleanup in staging and consumer-facing presentation in marts. Give each CTE
   one responsibility and make filters, retention, aggregations, formulas, and null handling
   explicit.
6. Preserve unaffected columns and behavior. Document material grain changes and business
   rules, and add key, relationship, accepted-value, and reconciliation tests where they
   protect transformation invariants.
7. Run project lint and a scoped `dbt build` through a materialized downstream model when
   necessary. Check row counts, uniqueness, nulls, unmatched joins, retained populations,
   control totals, lineage, and downstream impact.

## Stop and ask

Ask the responsible domain owner when output grain, join cardinality, retained population,
duplicate precedence, allocation, calculation logic, null handling, materialization cost,
or consumer impact is unsupported or contradictory.

## Completion

The affected DAG slice builds successfully, lint and tests pass, warehouse evidence
supports the declared grain, cardinality, retention, and deterministic record selection,
important calculations reconcile, and downstream behavior matches the approved intent.
