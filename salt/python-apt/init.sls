# vi: set ft=yaml.jinja :

{% if salt['config.get']('os_family') == 'Debian' %}

python-apt:
  pkg.installed:   []

{% endif %}
