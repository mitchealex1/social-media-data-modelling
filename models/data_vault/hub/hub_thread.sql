{%- set source_model = "thread"   -%}
{%- set src_pk = "thread_hk"          -%}
{%- set src_nk = "thread_nk"          -%}
{%- set src_ldts = "load_datetime"      -%}
{%- set src_source = "source"    -%}

{{ automate_dv.hub(src_pk=src_pk, src_nk=src_nk, src_ldts=src_ldts,
                   src_source=src_source, source_model=source_model) }}
