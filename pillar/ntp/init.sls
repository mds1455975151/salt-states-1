# vi: set ft=yaml.jinja :

{% if   salt['config.get']('os_family') == 'RedHat' %}

ntp:
  service:
    name:          ntpd

/var/lib/ntp/ntp.drift:
  file:
    name:         /var/lib/ntp/drift

{% elif salt['config.get']('os_family') == 'Debian' %}

ntp:
  service:
    name:          ntp

/var/lib/ntp/ntp.drift:
  file:
    name:         /var/lib/ntp/ntp.drift

{% endif %}
