WITH reactions AS (
    SELECT
        json_array_elements(raw_reactions) AS reaction,
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
    reaction ->> 'reaction' AS reaction,
    reaction ->> 'actor' AS reaction_actor,
    load_timestamp
FROM reactions