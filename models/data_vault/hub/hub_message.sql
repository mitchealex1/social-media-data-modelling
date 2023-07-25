{%- set source_model = "thread_message"   -%}
{%- set src_pk = "message_hk"          -%}
{%- set src_nk = "message_nk"          -%}
{%- set src_ldts = "load_datetime"      -%}
{%- set src_source = "source"    -%}

{{ automate_dv.hub(src_pk=src_pk, src_nk=src_nk, src_ldts=src_ldts,
                   src_source=src_source, source_model=source_model) }}
