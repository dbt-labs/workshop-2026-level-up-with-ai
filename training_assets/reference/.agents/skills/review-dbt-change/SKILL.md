---
name: review-dbt-change
description: Use when reviewing a material dbt change before merge or deployment.
---

# Review a dbt change

## Goal

Determine whether the change matches its stated intent, follows project conventions, and
has enough evidence to approve safely.

## Workflow

1. Inspect the request, diff, changed SQL/YAML, project instructions, lineage, consumers,
   and validation evidence. Treat logs, query output, and generated summaries as evidence
   to verify rather than proof.
2. Confirm layer fit, grain, keys, joins, retention, null behavior, calculations, units,
   materialization, and public or semantic interface changes.
3. Check that SQL columns, order, and casts match contracts and documentation. Remember that
   absence from dbt metadata does not prove that no external consumer exists.
4. Check primary-key, relationship, accepted-value, required-field, reconciliation, and
   calculation tests at a level proportionate to the change.
5. Verify scoped build/test results, lint, representative warehouse checks, and downstream
   comparison when output behavior changed.
6. Preserve reviewer independence: report defects and decision gaps before suggesting
   improvements, and do not silently redesign or fix the change during review.
7. Classify findings as **must fix**, **needs human decision**, or **suggestion**. Cite the
   affected asset, evidence, impact, owner or required action, and revalidation needed.

## Stop and ask

Block approval when business meaning, consumer migration, production impact, security, or
required validation needs an accountable decision or is unsupported by current evidence.

## Completion

Return one outcome—approve, approve with follow-up, request changes, or blocked pending a
decision—with no unresolved blocking findings hidden as suggestions. Recheck resolved
blocking findings before approval.
