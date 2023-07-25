-- Temp while there is no sat table
SELECT
    person_hk AS dim1_person_key,
    person_nk AS "name",
    load_datetime AS effective_from,
    source
FROM {{ref('hub_person')}}
