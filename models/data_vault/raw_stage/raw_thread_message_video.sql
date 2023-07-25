WITH videos AS (
    SELECT
        json_array_elements(raw_videos) AS video,
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
    video ->> 'uri' AS video_uri,
    video ->> 'creation_timestamp' AS video_creation_timestamp,
    video -> 'thumbnail' ->> 'uri' AS video_thumbnail_uri,
    load_timestamp
FROM videos