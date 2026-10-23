# Example organizational agent library

This folder shows a small, approachable dbt agent setup an analytics engineering team
could maintain across projects. It is reference material—not active configuration for the
workshop project.

- `AGENTS.md` demonstrates concise always-on dbt instructions.
- `.agents/ROUTING.md` demonstrates outcome-based skill selection.
- `.agents/skills/create-staging-model/SKILL.md` covers source-aligned cleanup and interfaces.
- `.agents/skills/create-intermediate-model/SKILL.md` covers reusable joins, enrichment,
  deduplication, and grain changes.
- `.agents/skills/create-mart-model/SKILL.md` covers building trusted dimensions and facts.
- `.agents/skills/create-semantic-model/SKILL.md` covers governed entities, dimensions, and
  metrics.
- `.agents/skills/review-dbt-change/SKILL.md` covers evidence-backed review.
- `.agents/skills/investigate-dbt-job-failure/SKILL.md` covers production job diagnosis.

A real organization should adapt ownership, contracts, testing standards, data handling,
CI, deployment, and escalation rules to its environment. Start small: add a skill only for
a repeatable task where always-on project instructions are not enough.
