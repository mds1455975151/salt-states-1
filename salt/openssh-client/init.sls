# vi: set ft=yaml.jinja :

{% from  'openssh-client/map.jinja'
   import openssh_client
   with   context %}

openssh-client:
  pkg.installed:
    - order:      -1
    - name:     {{ openssh_client['pkg']['name'] }}

/root/.ssh:
  file.directory:
    - user:        root
    - group:       root
    - mode:       '0700'
    - require:
      - pkg:       openssh-client

/root/.ssh/id_rsa:
  file.managed:
    - contents_pillar:  openssh-client:id_rsa
    - user:        root
    - group:       root
    - mode:       '0400'
    - require:
      - pkg:       openssh-client

/root/.ssh/id_rsa.pub:
  cmd.wait:
    - name:      |-
                 ( ssh-keygen -y -f /root/.ssh/id_rsa                          \
                                  > /root/.ssh/id_rsa.pub
                 )
    - onlyif:      test -s /root/.ssh/id_rsa
    - watch:
      - file:     /root/.ssh/id_rsa
