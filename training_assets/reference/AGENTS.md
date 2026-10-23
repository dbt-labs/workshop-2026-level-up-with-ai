# Example organization-wide dbt instructions

This is an example of the always-on context an analytics engineering team might maintain
for AI-assisted dbt work. Adapt it to the organization's architecture, ownership, risk,
and review process; do not copy it without checking local conventions.

## Work from project evidence

Inspect `dbt_project.yml`, relevant SQL and YAML, nearby models, macros, and lineage before
proposing changes. Use `source()` for declared raw inputs and `ref()` for dbt resources.
Never guess relation names or columns that can be discovered from the project.

Preserve existing grain, public columns, materialization, and consumer behavior unless the
request explicitly changes them. Ask the responsible owner when business meaning, grain,
retention, units, null handling, or breaking-change treatment is unclear.

## Keep logic in the right layer

- **Staging:** source-facing renaming, casting, and normalization at source grain.
- **Intermediate:** joins, deduplication, fanout control, enrichment, and grain changes.
- **Marts:** documented, tested dimensions and facts for analytics consumers.
- **Semantic layer:** governed entities, dimensions, and metrics with approved business
  definitions.

Follow the project's established names and SQL structure. Prefer explicit interfaces over
`select *` when publishing a model.

## Build trustworthy interfaces

State what one row represents and identify the primary key. Public marts should document
all columns, use contracts when adopted by the organization, and keep SQL casts aligned
with declared types.

Use tests that express real expectations:

- `unique` and `not_null` for primary keys;
- `relationships` for governed foreign keys;
- `accepted_values` for controlled domains;
- required-field tests only where nulls are genuinely invalid; and
- reconciliation or expression tests for important calculations.

## Validate changes

Match validation to the change. SQL and contract changes require a scoped `dbt build` that
executes the affected model and tests. Inspect representative rows, grain, null behavior,
and lineage. Review downstream impact for material public-interface or logic changes.
Parse or compile alone does not prove warehouse behavior.

## Safety and ownership

Follow the active project's `SECURITY.md`. Do not expose secrets or restricted data,
bypass tests or approvals, edit generated artifacts as a fix, or take destructive or
production-impacting actions without authorization. Humans retain approval for business
meaning, public interfaces, deployment, and production impact.

Use `.agents/ROUTING.md` to select task-specific guidance. Skills add workflow detail; they
do not override these instructions or human decision rights.
