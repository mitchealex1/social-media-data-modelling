WITH threads AS (
    SELECT
        file_content,
        load_timestamp
    FROM {{ source('load', 'messages_inbox') }}
    UNION ALL
    SELECT
        file_content,
        load_timestamp
    FROM {{ source('load', 'messages_archived_threads') }}
    UNION ALL
    SELECT
        file_content,
        load_timestamp
    FROM {{ source('load', 'messages_filtered_threads') }}
    UNION ALL
    SELECT
        file_content,
        load_timestamp
    FROM {{ source('load', 'messages_message_requests') }}
)
SELECT
    file_content ->> 'title' AS thread_title,
    file_content ->> 'thread_path' AS thread_path,
    file_content ->> 'thread_type' AS thread_type,
    file_content ->> 'is_still_participant' AS thread_is_still_participant,
    file_content -> 'image' ->> 'uri' AS thread_image_uri,
    file_content -> 'image' ->> 'creation_timestamp' AS thread_image_creation_timestamp,
    file_content -> 'joinable_mode' ->> 'mode' AS thread_joinable_mode_name,
    file_content -> 'joinable_mode' ->> 'link' AS thread_joinable_mode_link,
    load_timestamp,
    file_content -> 'messages' AS raw_messages,
    file_content -> 'magic_words' AS raw_magic_words
FROM threads