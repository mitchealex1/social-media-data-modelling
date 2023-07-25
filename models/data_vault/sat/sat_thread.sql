{%- set yaml_metadata -%}
source_model: "thread"
src_pk: "thread_hk"
src_hashdiff: 
  source_column: "thread_hashdiff"
  alias: "hashdiff"
src_payload:
    - "thread_path"
    - "thread_title"
    - "thread_type"
    - "thread_is_still_participant"
    - "thread_image_uri"
    - "thread_image_creation_timestamp"
    - "thread_joinable_mode_name"
    - "thread_joinable_mode_link"
src_eff: "effective_from"
src_ldts: "load_datetime"
src_source: "source"
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ automate_dv.sat(src_pk=metadata_dict["src_pk"],
                   src_hashdiff=metadata_dict["src_hashdiff"],
                   src_payload=metadata_dict["src_payload"],
                   src_eff=metadata_dict["src_eff"],
                   src_ldts=metadata_dict["src_ldts"],
                   src_source=metadata_dict["src_source"],
                   source_model=metadata_dict["source_model"])   }}
