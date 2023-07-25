WITH messages AS (
    SELECT
        json_array_elements(raw_messages) AS "message",
        thread_path,
        load_timestamp
    FROM {{ ref('raw_thread') }}
)
SELECT
    thread_path,
    "message" ->> 'sender_name' AS message_sender_name,
    "message" ->> 'timestamp_ms' AS message_timestamp_ms,
    "message" ->> 'content' AS message_content,
    "message" ->> 'is_unsent' AS message_is_unsent,
    "message" -> 'sticker' ->> 'uri' AS message_sticker_uri,
    "message" -> 'share' ->> 'link' AS message_share_link,
    "message" -> 'share' ->> 'share_text' AS message_share_share_text,
    "message" ->> 'ip' AS message_ip,
    "message" ->> 'call_duration' AS message_call_duration,
    "message" ->> 'missed' AS message_missed,
    load_timestamp,
    "message" -> 'audio_file' AS raw_audio_files,
    "message" -> 'files' AS raw_files,
    "message" -> 'gifs' AS raw_gifs,
    "message" -> 'photos' AS raw_photos,
    "message" -> 'reactions' AS raw_reactions,
    "message" -> 'users' AS raw_users,
    "message" -> 'videos' AS raw_videos
FROM messages