WITH files AS (
    SELECT
        json_array_elements(raw_files) AS "file",
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
    "file" ->> 'uri' AS file_uri,
    "file" ->> 'creation_timestamp' AS file_creation_timestamp,
    load_timestamp
FROM files