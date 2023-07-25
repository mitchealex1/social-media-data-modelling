{%- set yaml_metadata -%}
source_model: "raw_thread_message_audio_file"
derived_columns:
  source: "!1"
  load_datetime: "load_timestamp"
  effective_from: "load_timestamp"
  message_nk:
    - "message_content"
    - "message_sender_name"
    - "message_timestamp_ms"
    - "thread_path"
  audio_file_creation_timestamp: "to_timestamp(audio_file_creation_timestamp::BIGINT)"
hashed_columns:
  message_hk: "message_nk"
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ automate_dv.stage(include_source_columns=true,
                     source_model=metadata_dict['source_model'],
                     derived_columns=metadata_dict['derived_columns'],
                     null_columns=none,
                     hashed_columns=metadata_dict['hashed_columns'],
                     ranked_columns=none) }}
