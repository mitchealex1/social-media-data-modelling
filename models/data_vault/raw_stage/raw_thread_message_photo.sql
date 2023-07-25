WITH photos AS (
    SELECT
        json_array_elements(raw_photos) AS photo,
        message_content,
        message_sender_name,
        message_timestamp_ms,
        thread_path,
        load_timestamp
    FROM {{ ref('raw_thread_message') }}
)
SELECT
    message_content,
    message_sender_name,
    message_timestamp_ms,
    thread_path,
    photo ->> 'uri' AS photo_uri,
    photo ->> 'creation_timestamp'AS photo_creation_timestamp,
    load_timestamp
FROM photos