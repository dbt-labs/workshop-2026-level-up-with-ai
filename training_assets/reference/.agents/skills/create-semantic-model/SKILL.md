---
name: create-semantic-model
description: Use when creating or materially changing dbt Semantic Layer entities, dimensions, or metrics.
---

# Build a governed semantic model

## Goal

Expose trusted marts through reusable entities, dimensions, and metrics whose business
meaning and query behavior are explicit and approved.

## Workflow

1. Inspect project instructions, existing semantic configuration, the underlying mart SQL
   and YAML, contracts and tests, representative data, lineage, consumers, and existing
   metrics that may already answer the request.
2. Confirm the mart grain and key, accountable business owner, intended question, formula
   or aggregation, numerator and denominator, inclusion rules, units or currency, rounding,
   filters, null and zero-denominator treatment, event time, time zone, late-arriving-data
   behavior, and supported time grains.
3. Follow the Semantic Layer specification already used by the project; do not mix legacy
   and current formats. Extend an existing semantic model when it represents the same
   business entity and grain, and avoid duplicate or competing definitions.
4. Define entities from proven keys, expose only useful governed dimensions, and set an
   appropriate aggregation time dimension for metrics. Build advanced metrics from trusted
   reusable metrics instead of repeating logic.
5. Keep row-level transformation logic in tested dbt models. Semantic definitions should
   govern analytical meaning rather than compensate for an unreliable mart.
6. Document business meaning, units, filters, interpretation limits, and ownership. Assess
   dashboards, saved queries, downstream models, and AI-assisted consumers; define an
   approved deprecation or migration path for breaking changes.
7. Build the affected mart, run `dbt parse` and Semantic Layer validation, then execute
   representative metric queries across expected dimensions and time grains. Compare
   results with approved warehouse checks.

## Stop and ask

Ask the accountable business owner when metric meaning, source of truth, entity identity,
aggregation, filters, units, rounding, null treatment, time semantics, access, query cost,
or breaking consumer impact is unclear. Do not infer business definitions from column names.

## Completion

The underlying mart build plus project and Semantic Layer validation pass, representative
queries match the approved definition without double counting, documentation is complete,
and consumer impact and any migration path have accountable-owner approval.
