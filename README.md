# 🧙‍♀️✨🌿 Merlin & Co. Apothecaries

Merlin & Co. Apothecaries is a wizard-themed dbt project for the **Level Up with AI**
workshop. It models a 15-shop potion retailer across sales, customers and guilds, and
brew and shop operations.

The project runs on Snowflake with **dbt v2 Stable**. In the 30-minute Wizard exercise,
participants build two deliberately missing marts from existing staging models, review the
first attempt, capture team standards in agent files, and rebuild the same request in a
fresh chat.

## Exercise outcome

Participants create:

1. `models/marts/dim_shops.sql` — one row per shop, built from
   `stg_alembic_ops__shops`.
2. `models/marts/fct_brews.sql` — one row per brew batch, built from
   `stg_alembic_ops__brew_events`.
3. Root `AGENTS.md` — concise always-on project instructions.
4. `.agents/skills/create-mart-model/SKILL.md` — the team's reusable mart workflow.

The starter project includes comment-only placeholders for both agent files. They make the
intended locations visible without supplying modeling guidance before Exercise 3.

## Run the workshop

Use the exercises in order:

1. [Build two marts with Wizard](training_assets/exercises/exercise1.md)
2. [Review the first attempt](training_assets/exercises/exercise2.md)
3. [Capture the team's standards](training_assets/exercises/exercise3.md)
4. [Rebuild with agent instructions](training_assets/exercises/exercise4.md)

Project-specific review criteria live in
[team notes](training_assets/exercises/team_notes.md). After drafting the agent files,
compare them with the worked examples under [`training_assets/solution/`](training_assets/solution/).

## Repository map

```text
.
├── AGENTS.md                          # Exercise 3 placeholder for always-on context
├── SECURITY.md                        # non-negotiable data and action boundaries
├── .agents/skills/create-mart-model/  # Exercise 3 skill placeholder
├── models/
│   ├── staging/                       # source-facing cleanup views
│   ├── intermediate/                  # joins and grain changes
│   └── marts/                         # contracted dimensions, facts, and semantics
├── macros/                            # shared cleanup and currency macros
├── docs/merlinco/                     # ERD, data dictionary, and style guide
├── seeds/medium_data/                 # portable workshop fixtures
└── training_assets/
    ├── exercises/                     # four-part participant guides and team notes
    ├── solution/                      # model and agent-file examples
    └── reference/                     # approachable org-wide governance examples
```

## Source systems

| Source | Domain | Raw tables |
|---|---|---|
| **Abracadabra POS** | Potions, orders, line items, and payments | `raw_potions`, `raw_orders`, `raw_order_items`, `raw_payments` |
| **Grimoire CRM** | Wizards, guilds, and memberships | `raw_customers`, `raw_guilds`, `raw_guild_memberships` |
| **Alembic Ops** | Shops and brewing | `raw_shops`, `raw_brew_events` |

Raw relations are pre-built in Snowflake and declared as dbt sources. The committed seeds
are portable facilitator fixtures.

## Starter validation

```text
dbt deps
dbt parse --no-partial-parse
dbt build
```

SQL style is defined in `.sqlfluff`. The worked solution preserves the existing Semantic
Layer examples for a follow-on workshop, while this exercise focuses on SQL, contracts,
tests, documentation, and reusable Wizard context.
