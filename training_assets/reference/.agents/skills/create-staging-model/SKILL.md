---
name: create-staging-model
description: Use when creating or materially changing a source-facing dbt staging model.
---

# Build a reliable staging model

## Goal

Create a thin, source-aligned model that gives downstream dbt resources a consistent,
tested interface without changing the source grain.

## Workflow

1. Inspect project instructions, `dbt_project.yml`, the declared source and source YAML,
   representative data, nearby staging models, downstream lineage, and any macro before
   reusing it.
2. State the source table, what one row represents, the source key, required columns, and
   known duplicate or null behavior.
3. Use exactly one declared relation through `source()`. Do not use `ref()` or a hardcoded
   warehouse relation. Preserve source grain and retain records unless an approved
   requirement says otherwise.
4. Limit transformations to clear renaming, type casting, basic normalization, and simple
   source-system flags. Put joins, deduplication, aggregation, and business rules in an
   intermediate model.
5. Follow project naming, SQL, and materialization conventions. Expose an explicit, stable
   column interface and preserve unaffected source columns when modifying an existing model.
6. Document the model and columns. Add key, required-field, and accepted-value tests only
   where the source contract and observed data support them; do not infer expectations from
   names alone.
7. Run project lint and a scoped `dbt build`, inspect representative rows, and verify row
   count, key behavior, nulls, types, casts, normalization, and lineage against the source.

## Stop and ask

Ask the responsible source or domain owner when source authority, grain, key, record
retention, timezone, units, sensitive-data handling, or the meaning of a source value is
unclear. Do not silently deduplicate, filter, map, or reinterpret source records.

## Completion

The staging model builds successfully, lint and tests pass, warehouse checks show that
source grain and record retention are preserved, documented types and names match the
output, and known source-data limitations are visible to downstream users.
