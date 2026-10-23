# 🧙 Merlin & Co. Apothecaries — ERD

Entity-relationship diagram for the **9 raw source tables** in `seeds/medium_data/`.
Types shown are logical staging targets; CSV columns arrive as text.

```mermaid
erDiagram
    raw_customers {
        varchar customer_id PK
        varchar full_name
        varchar email
        varchar home_region
        date signed_up_at
        int birth_year
        varchar favored_discipline
    }

    raw_guilds {
        varchar guild_id PK
        varchar guild_name
        int founded_year
    }

    raw_guild_memberships {
        varchar membership_id PK
        varchar customer_id FK
        varchar guild_id FK
        varchar tier
        date valid_from
        date valid_to
    }

    raw_potions {
        varchar potion_sku PK
        varchar potion_name
        varchar category
        int base_price_copper
        int potency
        int shelf_life_days
        varchar is_regulated
        date introduced_at
    }

    raw_orders {
        varchar order_id PK
        varchar customer_id FK
        varchar shop_id FK
        timestamp ordered_at
        varchar status
        varchar channel
        int discount_copper
    }

    raw_order_items {
        varchar order_item_id PK
        varchar order_id FK
        varchar potion_sku FK
        int quantity
        int unit_price_copper
    }

    raw_payments {
        varchar payment_id PK
        varchar order_id FK
        varchar method
        int amount_copper
        varchar status
        timestamp paid_at
    }

    raw_shops {
        varchar shop_id PK
        varchar shop_name
        varchar city
        varchar region
        date opened_at
    }

    raw_brew_events {
        varchar brew_id PK
        varchar potion_sku FK
        varchar shop_id FK
        varchar cauldron_id
        timestamp brewed_at
        int batch_size
        int brew_duration_minutes
        varchar quality_check
        varchar brewer_name
    }

    raw_customers ||--o{ raw_orders : places
    raw_customers ||--o{ raw_guild_memberships : holds
    raw_guilds ||--o{ raw_guild_memberships : grants
    raw_shops ||--o{ raw_orders : fulfills
    raw_orders ||--|{ raw_order_items : contains
    raw_orders ||--o{ raw_payments : paid_by
    raw_potions ||--o{ raw_order_items : sold_as
    raw_potions ||--o{ raw_brew_events : brewed_as
    raw_shops ||--o{ raw_brew_events : hosts
```

## Key facts

- Each raw relation keeps its documented event or entity grain.
- Referential integrity is intact; deliberate cleanup work is in formats and casing.
- `raw_shops.region` is canonical for regional conformance.
- `raw_brew_events` is one row per brew and may contain null durations.
