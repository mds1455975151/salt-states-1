# neutron-plugin-ibm-agent

## Depends:

  -  [logstash](/salt/logstash)
  -  [neutron-common](/salt/neutron-common)
  -  [neutron-plugin-ibm](/salt/neutron-plugin-ibm)
  -  [sensu-client](/salt/sensu-client)
  -  [supervisor](/salt/supervisor)

## Reverse Depends:

  -  N/A

## Relates:

  -  [logstash](/salt/logstash)
  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── defaults.yaml
├── depend-supervisor.sls
├── etc
│   ├── logstash
│   │   └── conf.d
│   │       └── input-file-neutron-plugin-ibm-agent.conf
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-neutron-plugin-ibm-agent.json
│   └── supervisor
│       └── conf.d
│           └── neutron-plugin-ibm-agent.conf
├── init.sls
├── relate-logstash.sls
└── relate-sensu-api.sls
```
