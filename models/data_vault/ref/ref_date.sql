WITH date_range AS (
    {{
    dbt_utils.date_spine(
        datepart="day",
        start_date="TO_DATE('" ~ var("data_start_date") ~ "','YYYY-MM-DD')",
        end_date="CURRENT_DATE"
    )
    }}
)
SELECT
    date_day::DATE AS "date",
    date_day::DATE + (1 - EXTRACT(ISODOW FROM date_day))::INT AS first_day_of_week,
    date_day::DATE + (7 - EXTRACT(ISODOW FROM date_day))::INT AS last_day_of_week,
    date_day::DATE + (1 - EXTRACT(DAY FROM date_day))::INT AS first_day_of_month,
    (DATE_TRUNC('MONTH', date_day::DATE) + INTERVAL '1 MONTH - 1 day')::DATE AS last_day_of_month,
    DATE_TRUNC('quarter', date_day::DATE)::DATE AS first_day_of_quarter,
    (DATE_TRUNC('quarter', date_day::DATE) + INTERVAL '3 MONTH - 1 day')::DATE AS last_day_of_quarter,
    TO_DATE(EXTRACT(YEAR FROM date_day::DATE) || '-01-01', 'YYYY-MM-DD') AS first_day_of_year,
    TO_DATE(EXTRACT(YEAR FROM date_day::DATE) || '-12-31', 'YYYY-MM-DD') AS last_day_of_year,
    NOW() AT TIME ZONE 'utc' AS load_datetime,
    2 AS source
FROM date_range
ORDER BY 1