# Exercise 3 — Capture the team's standards

Practical block 3: turn the review findings into reusable instructions. Put general,
always-on rules in `AGENTS.md` and the repeatable mart-building workflow in one skill.

## Part 1: complete `AGENTS.md`

1. Open the placeholder `AGENTS.md` at the project root and replace its comment.

2. Read `training_assets/exercises/team_notes.md` and capture the rules that should
   apply whenever Wizard changes a model—for example project layering, `ref()` usage,
   SQL structure, explicit interfaces, and validation expectations.

3. Keep the file concise and project-specific. Do not copy the exercise instructions,
   hard-code the two target models, or turn it into a step-by-step mart workflow.

4. Add a completion rule requiring Wizard to run the appropriate scoped build, inspect
   the resulting data, and show relevant lineage after a model change.

## Part 2: complete the mart skill

1. Open the placeholder `.agents/skills/create-mart-model/SKILL.md` and replace its
   comment.

2. Begin it with frontmatter containing a specific trigger, such as:

```yaml
---
name: create-mart-model
description: Use when creating or materially changing a contracted dbt dimension or fact.
---
```

3. Add the mart-specific process from `team_notes.md`: establish grain and key, use the
   simplest trusted upstream model, define the ordered contract, add grounded tests and
   docs, build the affected slice, and verify grain and null behavior.

4. Reference `AGENTS.md` instead of duplicating its general rules.

5. Compare your work with the examples in `training_assets/solution/` only after your
   team has drafted both files. The examples are a reference, not the only correct answer.
