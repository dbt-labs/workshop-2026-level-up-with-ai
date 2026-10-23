---
name: create-mart-model
description: Use when creating or materially changing a dbt dimension or fact for analytics consumers.
---

# Build a trusted mart

## Goal

Create a documented and tested mart with a clear grain, stable public interface, and
validation evidence.

## Workflow

1. Inspect project instructions, `dbt_project.yml`, nearby marts, upstream models, lineage,
   contracts, semantic definitions, exposures, saved queries, and documented consumers.
2. State what one row represents, the primary key, intended consumers, required columns,
   materialization, and important null, unit, retention, or calculation rules.
3. Use the simplest trusted upstream model. Keep cleanup in staging and grain-changing
   joins, deduplication, allocation, and substantial aggregation in intermediate models.
4. Build an explicit public interface following project naming and SQL conventions. Do not
   treat absence from dbt metadata as proof that no external consumer exists.
5. Document the model grain and every public column. Align explicit SQL casts and ordered
   outputs with the contract when contracts are used.
6. Add `unique` and `not_null` tests for the primary key, `relationships` tests for governed
   foreign keys, `accepted_values` tests for controlled domains, and targeted tests for
   required fields and calculations.
7. Run project lint and a scoped `dbt build`, inspect representative rows and key behavior,
   reconcile important controls, and review lineage and material downstream impact. Compare
   changed output with the production baseline when available.

## Stop and ask

Ask the responsible owner before proceeding when grain, source of truth, key, retention,
calculation, units, null handling, public interface, materialization, or consumer impact is
unclear. A breaking column, type, grain, or behavior change requires an approved versioning
or migration path before implementation.

## Completion

The mart builds successfully, lint, tests, and contracts pass, warehouse results support
the declared grain and calculations, documentation matches the public interface, and
consumer and semantic impact—including migration treatment—has been reviewed.
