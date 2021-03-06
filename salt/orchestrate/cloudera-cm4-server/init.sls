# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_cloudera-cm4-server:
  salt.state:
    - tgt:         roles:cloudera-cm4-server
    - tgt_type:    grain
    - sls:         cloudera-cm4-server
    - require:
      - salt:      state_sls_salt-minion

state_sls_cloudera-cm4-server_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:cloudera-cm4-server'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['cloudera-cm4-server']}
    - require:
      - salt:      state_sls_cloudera-cm4-server
