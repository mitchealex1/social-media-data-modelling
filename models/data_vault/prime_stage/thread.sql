{%- set yaml_metadata -%}
source_model: "raw_thread"
derived_columns:
  source: "!1"
  load_datetime: "load_timestamp"
  effective_from: "load_timestamp"
  thread_nk: "thread_path"
  thread_is_still_participant: "thread_is_still_participant::BOOLEAN"
  thread_image_creation_timestamp: "to_timestamp(thread_image_creation_timestamp::BIGINT)"
hashed_columns:
  thread_hk: "thread_nk"
  thread_hashdiff:
    is_hashdiff: true
    columns:
      - "thread_path"
      - "thread_title"
      - "thread_type"
      - "thread_is_still_participant"
      - "thread_image_uri"
      - "thread_image_creation_timestamp"
      - "thread_joinable_mode_name"
      - "thread_joinable_mode_link"
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ automate_dv.stage(include_source_columns=true,
                     source_model=metadata_dict['source_model'],
                     derived_columns=metadata_dict['derived_columns'],
                     null_columns=none,
                     hashed_columns=metadata_dict['hashed_columns'],
                     ranked_columns=none) }}
