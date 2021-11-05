

--{% macro cast_index_salary(index) %}

--{{ return(cast( {{ var("salary_range") }}[ORDINAL( {{index}} )] as int64) * 1000) }}

--{% endmacro %}


--{% macro replace_with_Unknown(column_name) -%}

    --IF(CONTAINS_SUBSTR( {{column_name}}, '-1' ),'Unknown', {{column_name}})

--{%- endmacro %}

