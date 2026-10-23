# Exercise 1 — Build two marts with dbt Wizard

Practical block 1: ask Wizard to build two useful data products from a plain-language
request before the team has captured project-specific instructions.

1. In dbt Studio, start a new Wizard chat.

2. Send this exact request:

> Our brewing operations team needs two trusted marts from the existing Alembic Ops
> staging models: `dim_shops`, with one row per shop, and `fct_brews`, with one row per
> brew batch. Build both models with contracts, tests, and documentation, then validate
> the result.

3. Let Wizard inspect the project and implement the change. Do not add column lists,
   test names, SQL patterns, or other implementation detail—the point is to establish
   a baseline before the team writes its own agent instructions.

4. Review Wizard's proposed edits before approving them. If its reasoning or output
   seems surprising, ask one follow-up question, but do not give it `team_notes.md` yet.

5. When the build finishes, keep a short note of what Wizard created and any choices
   that stood out. You will review those choices in Exercise 2.
