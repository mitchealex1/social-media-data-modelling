WITH participants AS (
    SELECT
        json_array_elements(raw_messages) AS "participant",
        thread_path,
        load_timestamp
    FROM {{ ref('raw_thread') }}
)
SELECT
    thread_path,
    "participant" ->> 'name' AS participant_name,
    load_timestamp
FROM participants