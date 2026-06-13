{% set temperature = 70.0 %}

On a day like this, I especially like {% if temperature >= 50.0 -%}
    a refreshing lemon sorbet
{%- else -%}
    a decadent chocolate cake
{%- endif -%}

{% set max_range = 5 %}
{% for i in range(max_range) %}
    We are on number [{{i+1}}]!
{% endfor %}

{% set animals = ['cat', 'dog', 'lemur', 'lion'] %}
{%- for animal in animals %}
    {{ animal }}
{%- endfor %}