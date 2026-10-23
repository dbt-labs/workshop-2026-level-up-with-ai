# Merlin & Co. Apothecaries — data dictionary

Per-table column notes for the **9 raw source tables**. Logical types are shown; raw
CSV columns arrive as text. See [ERD.md](ERD.md) for relationships.

## abra_pos

### raw_orders (~15k rows)

| Column | Notes |
|---|---|
| `order_id` | PK — `ORD-000001` |
| `customer_id` | FK → `raw_customers` |
| `shop_id` | FK → `raw_shops` |
| `ordered_at` | two timestamp formats |
| `status` | mixed case: completed, returned, cancelled, placed |
| `channel` | `in_store`, `courier_owl`, `marketplace` |
| `discount_copper` | order-level discount |

### raw_order_items (~51k rows)

| Column | Notes |
|---|---|
| `order_item_id` | PK — `ITM-000001` |
| `order_id` | FK → `raw_orders` |
| `potion_sku` | FK → `raw_potions` |
| `quantity` | 1–5 |
| `unit_price_copper` | price at time of sale |

### raw_payments (~17k rows)

| Column | Notes |
|---|---|
| `payment_id` | PK — `PAY-000001` |
| `order_id` | FK → `raw_orders` |
| `method` | coin, guild credit, crystal transfer, or barter |
| `amount_copper` | successful payments reconcile to order totals |
| `status` | success, failed, refunded |
| `paid_at` | two timestamp formats |

### raw_potions (120 rows)

| Column | Notes |
|---|---|
| `potion_sku` | PK — `POT-0001` |
| `potion_name` | display name |
| `category` | mixed case |
| `base_price_copper` | list price; 100 copper = 1 gold crown |
| `potency` | 1–10 |
| `shelf_life_days` | 14–365 |
| `is_regulated` | messy boolean |
| `introduced_at` | introduction date |

## grimoire_crm

### raw_customers (5k rows)

| Column | Notes |
|---|---|
| `customer_id` | PK — `WIZ-00001` |
| `full_name` | display name |
| `email` | approximately 2% null |
| `home_region` | inconsistent coding; conform to `raw_shops.region` |
| `signed_up_at` | signup date |
| `birth_year` | 1885–2007 |
| `favored_discipline` | mixed case |

### raw_guilds (12 rows)

| Column | Notes |
|---|---|
| `guild_id` | PK — `GLD-01` |
| `guild_name` | display name |
| `founded_year` | founding year |

### raw_guild_memberships (~3.6k rows)

| Column | Notes |
|---|---|
| `membership_id` | PK — `MEM-00001` |
| `customer_id` | FK → `raw_customers` |
| `guild_id` | FK → `raw_guilds` |
| `tier` | mixed case |
| `valid_from` | interval start |
| `valid_to` | null means current |

## alembic_ops

### raw_shops (15 rows)

| Column | Notes |
|---|---|
| `shop_id` | PK — `SHP-01` |
| `shop_name` | display name |
| `city` | city |
| `region` | canonical; five values |
| `opened_at` | opening date |

### raw_brew_events (8,000 rows)

The committed fixture has exactly 8,000 data rows.

| Column | Notes |
|---|---|
| `brew_id` | PK — `BRW-00001` |
| `potion_sku` | FK → `raw_potions` |
| `shop_id` | FK → `raw_shops` |
| `cauldron_id` | operational identifier, not a dimension |
| `brewed_at` | two timestamp formats; cast to `timestamp_ntz` |
| `batch_size` | cast to integer |
| `brew_duration_minutes` | cast to integer; 71 fixture rows are null and stay null |
| `quality_check` | mixed case `pass` / `fail`; normalize with `lower(trim(...))` |
| `brewer_name` | pass through |

## Deliberate data quirks

1. Mixed-case categoricals require grounded normalization.
2. Timestamp columns may use ISO-with-Z or space-separated formats.
3. CRM home regions require conformance to shop regions.
4. Raw booleans use several text representations.
5. Copper-piece prices remain integers; reporting gold uses two decimal places.
6. Sparse nulls are intentional, including customer emails and brew durations.
