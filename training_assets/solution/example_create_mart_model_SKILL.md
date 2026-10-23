---
name: create-mart-model
description: Use when creating or materially changing a dbt dimension or fact for analytics consumption.
---

<!--
A broadly reusable example for an analytics engineering team. Adapt ownership, contract,
testing, and validation requirements to the organization's dbt standards.
-->

# Build a trusted mart model

## Trigger and goal

Use this skill to create or materially change a consumer-facing `dim_*` or `fct_*` model.
The goal is a documented, tested mart with a clear grain, stable interface, appropriate
materialization, and validation evidence.

## What to build

- Define what one row represents and identify the primary key before writing SQL.
- Use the simplest trusted upstream models that already contain the required business
  logic and grain.
- Keep source cleanup in staging and joins, deduplication, fanout control, and substantial
  aggregation in intermediate models.
- Publish only the columns required by known analytics, BI, semantic, or operational
  consumers. Preserve existing interfaces unless a breaking change is approved.
- Follow the project's naming, SQL structure, materialization, contract, and documentation
  conventions from `AGENTS.md` and nearby marts.

## What to document and test

Every mart should have:

- a model description stating its grain and intended use;
- descriptions for public columns, including units and null behavior where relevant;
- `unique` and `not_null` tests on the primary key;
- `relationships` tests for governed foreign keys;
- `accepted_values` tests for controlled categorical fields;
- `not_null` tests only for fields the business requires to be populated;
- an enforced contract when that is the organization's standard for public marts; and
- explicit SQL casts that match contract column names, order, and data types.

Add reconciliation, expression, or unit tests when the model introduces calculations.
Tests must represent real data expectations—not assumptions invented to make the model
look complete.

## Workflow

1. Inspect `dbt_project.yml`, relevant project instructions, nearby marts, upstream SQL
   and YAML, and upstream/downstream lineage.
2. Confirm grain, key, source of truth, required columns, materialization, null handling,
   calculations, and consumer impact.
3. Profile upstream keys, duplicates, nulls, categorical values, and proposed join
   cardinalities when the change depends on them.
4. Implement the model at the declared grain, keeping complex grain-changing logic in the
   appropriate upstream layer.
5. Write or update properties, tests, descriptions, and contracts alongside the SQL.
6. Run a scoped `dbt build` that executes the mart, required ancestors, and attached
   tests. Preview the result and inspect lineage.
7. Verify row count, primary-key uniqueness, required null behavior, relationships,
   accepted values, calculations, and material downstream impact.

## Stop and ask

Stop before implementation when grain, source of truth, key, join behavior, retention,
calculation, units, null treatment, public columns, materialization, or breaking-change
handling cannot be established from project evidence and the request. Ask the responsible
owner for the narrowest missing decision.

## Completion

The change is complete when the model builds successfully, tests and contracts pass,
warehouse results support the declared grain and calculations, documentation matches the
public interface, lineage contains only intended dependencies, and material consumer
impact has been reviewed.

## Ownership

Analytics engineering owns this workflow. Data-product and metric owners approve business
meaning and public interfaces; platform owners approve deployment and production-impacting
changes.
