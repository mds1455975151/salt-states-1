# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_salt-halite:
  salt.state:
    - tgt:         roles:salt-halite
    - tgt_type:    grain
    - sls:         salt-halite
    - require:
      - salt:      state_sls_salt-minion

state_sls_salt-halite_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:salt-halite'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['salt-halite']}
    - require:
      - salt:      state_sls_salt-halite
