# vi: set ft=yaml.jinja :

{% set psls = sls.split('.')[0] %}

id_rsa.pub.nagios3:
  ssh_auth.present:
    - order:      -1
    - user:        root
    - source:      salt://{{ psls }}/root/.ssh/id_rsa.pub.nagios3
