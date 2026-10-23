with brew_events as (
    select * from {{ ref('stg_alembic_ops__brew_events') }}
),

final as (
    select
        brew_id::varchar as brew_id,
        potion_sku::varchar as potion_sku,
        shop_id::varchar as shop_id,
        cauldron_id::varchar as cauldron_id,
        quality_check::varchar as quality_check,
        brewer_name::varchar as brewer_name,
        batch_size::integer as batch_size,
        brew_duration_minutes::integer as brew_duration_minutes,
        brewed_at::timestamp_ntz as brewed_at,
        brewed_at::date as brewed_date
    from brew_events
)

select * from final
