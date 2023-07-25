{%- set yaml_metadata -%}
source_model: "thread_message"
src_pk: "message_hk"
src_hashdiff: 
  source_column: "message_hashdiff"
  alias: "hashdiff"
src_payload:
    - "message_content"
    - "message_sticker_uri"
    - "message_share_link"
    - "message_share_share_text"
    - "message_ip"
    - "message_call_duration"
    - "message_missed"
    - "message_is_unsent"
    - "message_timestamp"
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
