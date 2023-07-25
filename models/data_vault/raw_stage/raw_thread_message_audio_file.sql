WITH audio_files AS (
    SELECT
        json_array_elements(raw_audio_files) AS audio_file,
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
    audio_file ->> 'uri' AS audio_file_uri,
    audio_file ->> 'creation_timestamp' AS audio_file_creation_timestamp,
    load_timestamp
FROM audio_files