{%- macro cents_to_dollars(cents, round_decimal_accuracy=2) -%}
    ROUND({{ cents }} / 100.0, {{ round_decimal_accuracy }})
{%- endmacro -%}