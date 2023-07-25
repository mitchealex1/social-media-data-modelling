WITH gifs AS (
    SELECT
        json_array_elements(raw_gifs) AS gif,
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
    gif ->> 'uri' AS gif_uri,
    load_timestamp
FROM gifs