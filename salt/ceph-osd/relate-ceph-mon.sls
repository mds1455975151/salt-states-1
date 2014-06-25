# vi: set ft=yaml.jinja :

{% set cluster = salt['grains.get']('environment', 'ceph') %}
{% set minions = salt['roles.list_minions']('ceph-mon') %}

{% if minions['ceph-mon'] %}

cp.get_file /var/lib/ceph/bootstrap-osd/{{ cluster }}.keyring:
  module.run:
    - name:        cp.get_file
    - path:        salt://{{ minions['ceph-mon'][0] }}/var/lib/ceph/bootstrap-osd/{{ cluster }}.keyring
    - dest:       /var/lib/ceph/bootstrap-osd/{{ cluster }}.keyring
    - unless:      test -f /var/lib/ceph/bootstrap-osd/{{ cluster }}.keyring

{% endif %}
