# vi: set ft=yaml.jinja :

{% set minions = salt['roles.dict']('sensu-api') %}
{% set psls    = sls.split('.')[0] %}

include:
  -  ruby-snmp
  -  sensu-client

{% if minions['sensu-api'] %}

extend:
  gem install snmp:
    cmd:
      - env:
        - PATH:   /opt/sensu/embedded/bin:/bin
      - require:
        - pkg:     sensu

/etc/sensu/conf.d/checks-{{ psls }}.json:
  file.managed:
    - template:    jinja
    - source:      salt://{{ psls }}/etc/sensu/conf.d/checks-{{ psls }}.json
    - user:        sensu
    - group:       sensu
    - mode:       '0440'
    - require:
      - file:     /etc/sensu/conf.d
    - watch_in:
      - file:     /etc/sensu/conf.d/client.json
      - service:   sensu-client

{% else %}

/etc/sensu/conf.d/checks-{{ psls }}.json:
  file.absent:
    - watch_in:
      - file:     /etc/sensu/conf.d/client.json
      - service:   sensu-client

{% endif %}
