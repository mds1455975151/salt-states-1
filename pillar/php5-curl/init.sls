# vi: set ft=yaml.jinja :

{% if   salt['config.get']('os_family') == 'RedHat' %}

php5-curl:
  pkg:
    name:          php53u-common

{% elif salt['config.get']('os_family') == 'Debian' %}

php5-curl:
  pkg:
    name:          php5-curl

{% endif %}
