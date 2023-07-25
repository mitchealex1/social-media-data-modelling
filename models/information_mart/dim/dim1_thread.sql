WITH latest_records AS (
    SELECT
        thread_hk,
        max(load_datetime) as max_load_datetime
    FROM
        {{ ref('sat_thread') }}
    GROUP BY thread_hk
)
SELECT
    hub_thread.thread_hk AS dim1_thread_key,
    sat_thread.thread_title AS title,
    CASE
        WHEN sat_thread.thread_type = 'RegularGroup' THEN 'Group'
        WHEN sat_thread.thread_type = 'Regular' THEN 'Direct Message'
        ELSE 'Other'
    END AS "type",
    CASE
        WHEN sat_thread.thread_path ILIKE 'inbox/%' THEN 'Active'
        WHEN sat_thread.thread_path ILIKE 'message_requests/%' THEN 'Pending'
        WHEN sat_thread.thread_path ILIKE 'filtered_threads/%' THEN 'Blocked'
        WHEN sat_thread.thread_path ILIKE 'archived_threads/%' THEN 'Archived'
        ELSE 'Other'
    END AS "status",
    sat_thread.thread_is_still_participant AS current_participant,
    sat_thread.effective_from,
    sat_thread.source
FROM
    {{ ref('hub_thread') }} AS hub_thread
INNER JOIN {{ ref('sat_thread') }} AS sat_thread ON
    hub_thread.thread_hk = sat_thread.thread_hk
INNER JOIN latest_records ON
    sat_thread.thread_hk = latest_records.thread_hk
    AND sat_thread.load_datetime = latest_records.max_load_datetime