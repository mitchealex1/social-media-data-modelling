-- Get stats for messages sent, per thread, per person, per day, per hour
WITH latest_records AS (
    SELECT
        message_hk,
        max(load_datetime) as max_load_datetime
    FROM
        {{ ref('sat_message') }}
    GROUP BY message_hk
)
SELECT
    TO_CHAR(sm.message_timestamp, 'yyyymmdd') AS dim1_date_key,
    ht.thread_hk AS dim1_thread_key,
    lma.person_hk AS dim1_message_author_person_key,
    sm.message_hk AS dim1_message_key
from {{ ref('hub_thread') }} ht 
inner join {{ ref('link_message_thread') }} lmt on ht.thread_hk = lmt.thread_hk 
inner join {{ ref('link_message_author') }} lma on lmt.message_hk = lma.message_hk
inner join {{ ref('sat_message') }} sm on lmt.message_hk = sm.message_hk
inner join latest_records lr on lr.message_hk = sm.message_hk and lr.max_load_datetime = sm.load_datetime

{#

{{ dbt_utils.pivot(
      'EXTRACT(HOUR FROM sm.message_timestamp)',
      ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23'],
      prefix='hour'
    ) }}


#}

