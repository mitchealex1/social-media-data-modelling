{{ config(materialized='incremental')         }}

{%- set source_model = "thread_message"        -%}
{%- set src_pk = "message_person_hk"         -%}
{%- set src_fk = ["message_hk", "person_hk"] -%}
{%- set src_ldts = "load_datetime"           -%}
{%- set src_source = "source"         -%}

{{ automate_dv.link(src_pk=src_pk, src_fk=src_fk, src_ldts=src_ldts,
                    src_source=src_source, source_model=source_model) }}
