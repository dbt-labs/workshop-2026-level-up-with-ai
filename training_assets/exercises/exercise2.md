# Exercise 2 — Review the first attempt

Practical block 2: inspect what Wizard built and compare it with this project's actual
mart conventions.

1. Ask Wizard to preview both models:

> Show me a preview of `dim_shops` and `fct_brews` as tables. Confirm the row count and
> primary-key behavior for each.

2. Ask Wizard to show where the new models sit in the DAG:

> Show me the lineage for `dim_shops` and `fct_brews`.

3. Confirm the results look plausible at a glance:
   - Does `dim_shops` have one row per shop?
   - Does `fct_brews` have one row per brew batch?
   - Are quality results normalized?
   - Do missing brew durations remain null instead of being filled in?

4. Open the generated SQL and YAML, then compare them with
   `training_assets/exercises/team_notes.md`. Wizard output varies between runs, so
   work through every item rather than assuming the first attempt is right or wrong:
   - Are the models named `dim_shops` and `fct_brews` and placed under `models/marts/`?
   - Does each model read from the correct existing staging model with `ref()`?
   - Is the input grain preserved without unnecessary joins, deduplication, or aggregation?
   - Does each SQL file use an import CTE, an explicit ordered `final` CTE, and
     `select * from final`?
   - Is every public column explicitly cast to the same type and order declared by the
     enforced contract?
   - Do keys, foreign keys, normalized quality values, and nullable brew duration have
     the expected tests and behavior?
   - Did the scoped build actually execute both marts and their tests?

5. Write down the deviations you found. Do not fix them yet—those gaps become the input
   to Exercise 3.
