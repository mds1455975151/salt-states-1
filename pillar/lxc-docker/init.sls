# vi: set ft=yaml.jinja :

{% if   salt['config.get']('os_family') == 'RedHat' %}

lxc-docker:
  pkg:
    name:          docker-io

/etc/default/docker:
  file:
    name:         /etc/sysconfig/docker

{% elif salt['config.get']('os_family') == 'Debian' %}

lxc-docker:
  pkg:
    name:          lxc-docker

/etc/default/docker:
  file:
    name:         /etc/default/docker

{% endif %}
