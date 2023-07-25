SELECT
    emoji AS dim1_emoji_key,
    emoji,
    initcap(replace(replace(emoji_name, '_', ' '),':', '')) AS emoji_name,
    emoji_status,
    source,
    load_datetime
FROM {{ ref('ref_emoji') }} AS ref_emoji