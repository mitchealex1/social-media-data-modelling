{%- set yaml_metadata -%}
source_model: "raw_thread_magic_word"
derived_columns:
  source: "!1"
  load_datetime: "load_timestamp"
  effective_from: "load_timestamp"
  thread_nk: "thread_path"
  magic_word_creation_timestamp: "to_timestamp(magic_word_creation_timestamp_ms::BIGINT/1000)"
hashed_columns:
  thread_hk: "thread_nk"
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ automate_dv.stage(include_source_columns=true,
                     source_model=metadata_dict['source_model'],
                     derived_columns=metadata_dict['derived_columns'],
                     null_columns=none,
                     hashed_columns=metadata_dict['hashed_columns'],
                     ranked_columns=none) }}
