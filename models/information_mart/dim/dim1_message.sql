WITH latest_records AS (
    SELECT
        message_hk,
        max(load_datetime) as max_load_datetime
    FROM
        {{ ref('sat_message') }}
    GROUP BY message_hk
)
SELECT
    hub_message.message_hk AS dim1_message_key,
    sat_message.message_content AS content,
    sat_message.message_timestamp AS sent_timestamp,
    sat_message.effective_from,
    sat_message.source
FROM
    {{ ref('hub_message') }} AS hub_message
INNER JOIN {{ ref('sat_message') }} AS sat_message ON
    hub_message.message_hk = sat_message.message_hk
INNER JOIN latest_records ON
    sat_message.message_hk = latest_records.message_hk
    AND sat_message.load_datetime = latest_records.max_load_datetime