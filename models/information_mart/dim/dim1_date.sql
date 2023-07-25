SELECT
    TO_CHAR("date", 'yyyymmdd') AS dim1_date_key,
    TO_CHAR(first_day_of_week, 'yyyymmdd') AS dim1_first_day_of_week_date_key,
    TO_CHAR(last_day_of_week, 'yyyymmdd') AS dim1_last_day_of_week_date_key,
    TO_CHAR(first_day_of_month, 'yyyymmdd') AS dim1_first_day_of_month_date_key,
    TO_CHAR(last_day_of_month, 'yyyymmdd') AS dim1_last_day_of_month_date_key,
    TO_CHAR(first_day_of_quarter, 'yyyymmdd') AS dim1_first_day_of_quarter_date_key,
    TO_CHAR(last_day_of_quarter, 'yyyymmdd') AS dim1_last_day_of_quarter_date_key,
    TO_CHAR(first_day_of_year, 'yyyymmdd') AS dim1_first_day_of_year_date_key,
    TO_CHAR(last_day_of_year, 'yyyymmdd') AS dim1_last_day_of_year_date_key,
    "date",
    EXTRACT(EPOCH FROM "date") AS epoch,
    EXTRACT(DAY FROM "date") AS day_number,
    TO_CHAR("date", 'TMDay') AS day_name,
    TO_CHAR("date", 'fmDDth') AS day_suffix,
    EXTRACT(ISODOW FROM "date") AS day_of_week_number,
    ("date" - DATE_TRUNC('quarter', "date")::DATE) + 1 AS day_of_quarter_number,
    EXTRACT(DOY FROM "date") AS day_of_year_number,
    EXTRACT(WEEK FROM "date") AS week_number,
    TO_CHAR("date", 'W')::INT AS week_of_month_number,
    EXTRACT(ISOYEAR FROM "date") || TO_CHAR("date", '"-W"IW-') || EXTRACT(ISODOW FROM "date") AS week_of_year_iso,
    EXTRACT(MONTH FROM "date") AS month_number,
    TO_CHAR("date", 'TMMonth') AS month_name,
    TO_CHAR("date", 'Mon') AS month_name_abbreviated,
    EXTRACT(QUARTER FROM "date") AS quarter_number,
    CASE
        WHEN EXTRACT(QUARTER FROM "date") = 1 THEN 'Q1'
        WHEN EXTRACT(QUARTER FROM "date") = 2 THEN 'Q2'
        WHEN EXTRACT(QUARTER FROM "date") = 3 THEN 'Q3'
        WHEN EXTRACT(QUARTER FROM "date") = 4 THEN 'Q4'
    END AS quarter_name,
    EXTRACT(YEAR FROM "date") AS year_number,
    CASE
        WHEN EXTRACT(ISODOW FROM "date") IN (6, 7) THEN TRUE
        ELSE FALSE
    END AS is_weekend,
    load_datetime,
    source
FROM
    {{ref('ref_date')}}