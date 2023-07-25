{%- set yaml_metadata -%}
source_model: "raw_thread_message"
derived_columns:
  source: "!1"
  load_datetime: "load_timestamp"
  effective_from: "load_timestamp"
  thread_nk: "thread_path"
  message_nk:
    - "message_content"
    - "message_sender_name"
    - "message_timestamp_ms"
    - "thread_path"
  person_nk: "message_sender_name"
  message_timestamp: "to_timestamp(message_timestamp_ms::BIGINT/1000)"
  message_is_unsent: "message_is_unsent::BOOLEAN"
  message_missed: "message_missed::BOOLEAN"
hashed_columns:
  thread_hk: "thread_nk"
  message_hk: "message_nk"
  person_hk: "person_nk"
  message_person_hk:
    - "message_nk"
    - "person_nk"
  message_thread_hk:
    - "message_nk"
    - "thread_nk"
  message_hashdiff:
    is_hashdiff: true
    columns:
      - "message_is_unsent"
      - "message_sticker_uri"
      - "message_share_link"
      - "message_share_share_text"
      - "message_ip"
      - "message_call_duration"
      - "message_missed"
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ automate_dv.stage(include_source_columns=true,
                     source_model=metadata_dict['source_model'],
                     derived_columns=metadata_dict['derived_columns'],
                     null_columns=none,
                     hashed_columns=metadata_dict['hashed_columns'],
                     ranked_columns=none) }}
