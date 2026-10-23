<!--
One worked answer for Exercise 3. Compare after drafting your own; do not copy it before
the exercise.
-->

# Merlin & Co. dbt project instructions

## Architecture and naming

Use the existing staging → intermediate → marts architecture. Staging performs
source-facing cleanup at source grain, intermediate owns joins and grain changes, and
marts publish trusted dimensions and facts. Use canonical names: `stg_<source>__<entity>`,
`int_<description>`, `dim_<noun>`, and `fct_<noun>`.

Read project models with `ref()` and declared raw data with `source()`. Never hard-code a
warehouse relation. Preserve the upstream grain and unaffected columns unless the request
explicitly changes them.

## SQL structure and interfaces

Use import CTEs first, named transformation CTEs only when needed, an explicit ordered
`final` CTE, then `select * from final`. Do not use `select *` to define a public
interface. Use lowercase SQL and `snake_case` identifiers.

Public marts enforce contracts. Explicit SQL casts, column names, order, and YAML
`data_type` declarations must match exactly.

## Tests and documentation

Test every primary key with `unique` and `not_null`. Add grounded relationship tests for
foreign keys and `accepted_values` tests for normalized categorical fields. Do not add a
`not_null` test to a field that is intentionally nullable. Document each model's grain
and every public column's business meaning.

## Completing model changes

Inspect relevant project files and lineage before editing. After a SQL or contract change,
run the narrowest scoped `dbt build` that executes the model and its tests. Preview the
result, verify row count against distinct primary-key count and important null behavior,
and show the relevant lineage. Parse or plausible SQL alone is not completion evidence.
