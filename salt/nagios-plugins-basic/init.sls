# vi: set ft=yaml.jinja :

{% from  'nagios-plugins-basic/map.jinja'
   import nagios_plugins_basic
   with   context %}

include:
  -  bash
  -  openssh-server.relate-nagios3

extend:
  id_rsa.pub.nagios3:
    ssh_auth.present:
      - user:      nagios
      - enc:       ssh-dss
      - require:
        - user:    nagios

nagios-plugins-basic:
  pkg.installed:
    - order:      -1
   {% if salt['config.get']('os_family') == 'RedHat' %}
    - names:
      - nagios-plugins-disk
      - nagios-plugins-load
      - nagios-plugins-procs
   {% endif %}

nagios:
  user.present:
    - order:      -1
    - shell:      /bin/bash
    - require:
      - pkg:       bash
      - pkg:       nagios-plugins-basic

/home/nagios/libexec:
  file.symlink:
    - name:     {{ nagios_plugins_basic['/home/nagios']['file']['name'] }}/libexec
    - target:   {{ nagios_plugins_basic['/usr/lib/nagios/plugins']['file']['name'] }}
    - require:
      - user:      nagios

/usr/lib/nagios/plugins/check_mem.pl:
  file.managed:
    - name:     {{ nagios_plugins_basic['/usr/lib/nagios/plugins']['file']['name'] }}/check_mem.pl
    - source:      salt://{{ sls }}/usr/lib/nagios/plugins/check_mem.pl
    - user:        root
    - group:       root
    - mode:       '0755'
    - watch:
      - pkg:       nagios-plugins-basic
