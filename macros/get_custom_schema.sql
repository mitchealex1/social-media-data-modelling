{% macro generate_schema_name(custom_schema_name, node) -%}
    {%- if custom_schema_name is none -%}

        {{ exceptions.raise_compiler_error("No schema defined for node: " ~ node.name) }}

    {%- else -%}

        {{ custom_schema_name | trim }}

    {%- endif -%}
{%- endmacro %}