WITH magic_words AS (
    SELECT
        json_array_elements(raw_magic_words) AS magic_word,
        thread_path,
        load_timestamp
    FROM {{ ref('raw_thread') }}
)
SELECT
    thread_path,
    magic_word ->> 'magic_word' AS magic_word,
    magic_word ->> 'creation_timestamp_ms' AS magic_word_creation_timestamp_ms,
    magic_word ->> 'animation_emoji' AS magic_word_animation_emoji,
    load_timestamp
FROM magic_words