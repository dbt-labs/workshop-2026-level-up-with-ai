# Exercise 4 — Rebuild with your agent instructions

Practical block 4: rebuild the same two marts in a fresh conversation and compare the
result with the first attempt.

1. Ask Wizard to remove the Exercise 1 versions of:
   - `models/marts/dim_shops.sql`
   - the properties YAML created for `dim_shops`
   - `models/marts/fct_brews.sql`
   - the properties YAML created for `fct_brews`

   Keep `AGENTS.md` and `.agents/skills/create-mart-model/SKILL.md`.

2. Start a brand-new Wizard chat so none of the first conversation remains in context.

3. Send the exact same request from Exercise 1:

> Our brewing operations team needs two trusted marts from the existing Alembic Ops
> staging models: `dim_shops`, with one row per shop, and `fct_brews`, with one row per
> brew batch. Build both models with contracts, tests, and documentation, then validate
> the result.

4. Repeat the Exercise 2 review. Compare the new result with your earlier findings:
   - Which deviations disappeared?
   - Which instructions did Wizard apply consistently?
   - Which gaps remain?

5. If something is still off, refine `AGENTS.md` or the skill and try the relevant part
   again. The goal is visible improvement and reusable team context, not identical SQL
   across every participant.
