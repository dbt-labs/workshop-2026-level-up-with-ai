# Merlin & Co. mart standards

Use these notes to review the first Wizard attempt. In Exercise 3, sort them into three
buckets:

- **Always-on project standards** belong in `AGENTS.md`.
- **Reusable mart-building steps** belong in the mart-authoring skill.
- **Exercise-specific acceptance criteria**—such as exact model names, columns, values,
  and build selectors—should not be copied into either reusable file.

## Project layering and grain

- Use canonical mart names: `dim_<noun>` for dimensions and `fct_<noun>` for facts.
- Read project models with `ref()`; never hard-code warehouse relations.
- A mart should use the simplest upstream model that already has the required grain.
  `dim_shops` reads `stg_alembic_ops__shops`; `fct_brews` reads
  `stg_alembic_ops__brew_events`.
- Preserve the upstream grain for these marts: one row per `shop_id` and one row per
  `brew_id`. Do not add joins, deduplication, filtering, aggregation, or imputation.
- Marts inherit the project-level `table` materialization. Do not add an incremental
  strategy for these small workshop models.

## SQL and public interfaces

- Use one import CTE per `ref()`, an explicit ordered `final` CTE, then
  `select * from final`.
- Do not use `select *` to define the public interface inside `final`.
- Explicitly cast every public mart column. SQL column names, order, and types must match
  the enforced YAML contract exactly.
- `dim_shops` publishes `shop_id`, `shop_name`, `city`, `region`, and `opened_at`.
- `fct_brews` publishes `brew_id`, `potion_sku`, `shop_id`, `cauldron_id`,
  `quality_check`, `brewer_name`, `batch_size`, `brew_duration_minutes`, `brewed_at`,
  and `brewed_date`.
- Keep missing `brew_duration_minutes` values null. Do not replace them with zero or an
  estimated duration.

## Contracts, tests, and documentation

- Public marts enforce contracts and declare a `data_type` for every output column.
- Every primary key gets `unique` and `not_null` tests.
- `fct_brews.potion_sku` relates to `dim_potions.potion_sku`, and
  `fct_brews.shop_id` relates to `dim_shops.shop_id`.
- Test normalized categorical domains with grounded values: shop regions use the five
  canonical regions and `quality_check` uses `fail` and `pass`.
- Do not add a `not_null` test to nullable `brew_duration_minutes`.
- Describe each model's grain and document the business meaning of every public column.

## Completion evidence

- Run a scoped build that creates both marts and executes their contracts and tests,
  such as `dbt build --select dim_shops +fct_brews`.
- Inspect previews for both models and verify row count equals distinct primary-key count.
- Show lineage and confirm the only new model inputs are the intended staging refs.
- A parse or plausible-looking SQL file alone is not completion evidence.
