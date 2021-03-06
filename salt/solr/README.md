# solr

## Depends:

  -  [cloudera-cm4-agent](/salt/cloudera-cm4-agent)
  -  [cloudera-cm5-agent](/salt/cloudera-cm5-agent)
  -  [jmxtrans-agent](/salt/jmxtrans-agent)
  -  [maven](/salt/maven)
  -  [maven.exec](/salt/maven/exec.sls)
  -  [sensu-client](/salt/sensu-client)
  -  [tomcat7](/salt/tomcat7)

## Reverse Depends:

  -  N/A

## Relates:

  -  [cloudera-cm4-server](/salt/cloudera-cm4-server)
  -  [cloudera-cm5-server](/salt/cloudera-cm5-server)
  -  [dynaTrace-server](/salt/dynaTrace-server)
  -  [graphite-carbon](/salt/graphite-carbon)
  -  [influxdb](/salt/influxdb)
  -  [sensu-api](/salt/sensu-api)
  -  [socks5](/salt/socks5)
  -  [zookeeper-server](/salt/zookeeper-server)

## Files:

```bash
.
├── defaults.yaml
├── depend-maven.sls
├── etc
│   └── sensu
│       └── conf.d
│           └── checks-solr.json
├── init.sls
├── relate-cloudera-cm4-server.sls
├── relate-cloudera-cm5-server.sls
├── relate-dynaTrace-server.sls
├── relate-graphite-carbon.sls
├── relate-influxdb.sls
├── relate-sensu-api.sls
├── relate-socks5.sls
├── relate-zookeeper-server.sls
├── root
│   └── pom.xml
└── usr
    └── share
        └── tomcat7
            └── bin
                └── setenv.sh
```
