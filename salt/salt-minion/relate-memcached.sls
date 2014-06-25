# vi: set ft=yaml.jinja :

{% set minions = salt['roles.list_minions']('memcached') %}
{% set psls    = sls.split('.')[0] %}

include:
  -  python-memcache
  -  salt-minion

{% if minions['memcached'] %}

/etc/salt/minion.d/memcached.conf:
  file.managed:
    - template:    jinja
    - source:      salt://{{ psls }}/etc/salt/minion.d/memcached.conf
    - user:        root
    - group:       root
    - mode:       '0644'
    - require:
      - pkg:       python-memcache
      - pkg:       salt-minion
    - watch_in:
      - service:   salt-minion

{% endif %}
