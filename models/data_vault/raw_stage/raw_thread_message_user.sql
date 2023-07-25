WITH users AS (
    SELECT
        json_array_elements(raw_users) AS "user",
        thread_path,
        message_content,
        message_sender_name,
        message_timestamp_ms,
        load_timestamp
    FROM {{ ref('raw_thread_message') }}
)
SELECT
    thread_path,
    message_content,
    message_sender_name,
    message_timestamp_ms,
    "user" ->> 'name' AS user_name,
    load_timestamp
FROM users