---
name: investigate-dbt-job-failure
description: Use when a dbt Platform job fails, warns, or behaves inconsistently.
---

# Investigate a dbt job failure

## Goal

Produce a run-specific diagnosis and recommend the smallest safe next action without
changing production or retrying a job without approval.

## Workflow

1. Confirm the current project, job, run ID, environment, Git branch/SHA, status, and
   reported impact. Keep account-wide job and run listings scoped to the current project.
2. Inspect the failed step, error details, warnings, logs, artifacts, timing, job commands,
   configuration, and recent run history for that job and code version.
3. Classify the issue as code/compilation, data/test/contract, source availability,
   warehouse/permissions, job configuration, performance/timeout, or unknown.
4. Inspect the smallest relevant code, lineage, data, and platform scope. Separate confirmed
   facts, supported hypotheses, and unknowns; do not dismiss material warnings because the
   run succeeded.
5. Recommend one safe next action: fix in a branch, request a source/platform action,
   observe, or retry after approval. Never weaken a test, contract, or accepted domain only
   to clear the failure signal.
6. Record the diagnosis, confidence, owner, approval status, and validation or retry result.

## Stop and ask

Get explicit approval before retrying, cancelling, changing job configuration, deploying,
or altering production data. Escalate when permissions, security, source systems, or
platform infrastructure are outside the investigator's ownership, or when a failing test
could represent either a valid business change or a defect.

## Completion

The exact run and code version are identified, evidence is recorded, facts and hypotheses
are separated, the next action has an owner and approval status, and unresolved causes have
a clear escalation path and follow-up.
