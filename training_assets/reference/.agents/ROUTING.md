# Example skill routing

Use the smallest skill that matches the requested outcome. Always read the active
project's `AGENTS.md` and `SECURITY.md` first.

| Requested outcome | Skill | Expected result |
|---|---|---|
| Create or materially change a source-facing staging model | `skills/create-staging-model/SKILL.md` | A source-aligned, tested interface that preserves source grain and record retention. |
| Create or materially change reusable joins, enrichment, deduplication, or grain logic | `skills/create-intermediate-model/SKILL.md` | A reusable transformation with proven grain, cardinality, and reconciliation. |
| Create or materially change a dimension or fact | `skills/create-mart-model/SKILL.md` | A documented, tested mart with proven grain and interface. |
| Create or materially change Semantic Layer entities, dimensions, or metrics | `skills/create-semantic-model/SKILL.md` | Governed semantic definitions with approved meaning and validated query behavior. |
| Review a material dbt change | `skills/review-dbt-change/SKILL.md` | Evidence-backed findings and a clear approval recommendation. |
| Investigate a failed dbt Platform run | `skills/investigate-dbt-job-failure/SKILL.md` | A run-specific diagnosis and the smallest safe next action. |

Use project instructions directly for small documentation-only changes. Add another skill
only when the team repeatedly performs a distinct task that needs its own workflow,
decision boundaries, and completion evidence.
