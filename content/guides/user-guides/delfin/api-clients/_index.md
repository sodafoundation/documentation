---
title: Delfin Thirdparty Integration Guide
description: "User guide for Delfin API Clients"
weight: 30
disableToc: false
tags: ["user guide", "delfin", "api-clients"] 
---

## Scope

This document is to help third party clients who wants to integrate [Delfin](https://github.com/sodafoundation/architecture-analysis/blob/master/arch-design/delfin/SODA_InfrastructureManagerDesign.md) into their Storage Management system

## Goals

- To capture changes required by third party softwares to interface with Delfin APIs and use Delfin services to manage heterogeneous storage backends.

## Non Goals

- To document steps for Delfin developer for feature enhancements
- To document third party driver development (Refer Third party driver development guide) for support more backends

## Prerequisite

- Ubuntu  18.04+/Ubuntu  20.04+
- Python 3.6+
- Delfin and its dependencies [installed](https://docs.sodafoundation.io/soda-gettingstarted/installation)

##### Installation Note:

- Delfin supports Ansible and Docker based installation for its deployment with all dependencies
- If external exporter configurations are enabled (Prometheus, Kafka or Aler Manager), SODA Ansible Installer option, 'SRM_Toolchain' needs to be enabled for installation of Kafka, Prometheus & Alert Manager tools. Default Delfin installation will not install these exporters

## Configurations

Delfin and its features/services are configured using configuration file `<delfin source path>/etc/delfin/delfin.conf`.

Important configurations that users want change may be,

- Database path
- Enable/Disable metrics exporters
- IP and Ports of exporters
- Cryptor used for encrypt sensitive data
- Certificate file paths to interface with storage backends


#### A typical configuration contains items listed below

|Category   |Name                   | Default value               | Description               |
|-----------|-----------------------|-----------------------------|---------------------------|
| DEFAULT   | api_paste_config      | /etc/delfin/api-paste.ini   | Python Paste config file  |
|           | delfin_cryptor        | delfin.cryptor._Base64      | Encryption/Decryption algorithm module to use   |
|           | api_max_limit         | 1000                        | Max API connections       |
|           | performance_exporters | PerformanceExporterPrometheus, PerformanceExporterKafka | Uncomment to enable Performance Exporters   |
|           | alert_exporters       | AlertExporterPrometheus     | Uncomment to enable Alert Exporters   |
| database  | connection            | sqlite:////var/delfin/delfin.sqlite   | Database file   |
|           | db_backend            | sqlalchemy                  | DB backend module         |
| TELEMETRY | performance_collection_interval | 900               | Metrics collection interval   |
| KAFKA_EXPORTER | kafka_topic_name | "delfin-kafka"              | KAFKA topic name |
|           | kafka_ip              | '<KAFKA_IP>'                | KAFKA installations IP    |
|           | kafka_port            | '9092'                      | KAFKA installations PORT  |
| PROMETHEUS_EXPORTER | metric_server_ip | 0.0.0.0                | PROMETHEUS IP             |
|           | metric_server_port    | 8195                        | PROMETHEUS PORT           |
|           | metrics_cache_file    | /var/lib/delfin/delfin_exporter.txt     | Metrics files |
| PROMETHEUS_ALERT_MANAGER_EXPORTER | alert_manager_host | '<AlertManager_IP>'  | Alert Manager IP    |
|           | alert_manager_port    | '9093'                      | Alert Manager PORT        |
|           |                       |                             |                           |



#### Example config file

``` ini
[DEFAULT]
api_paste_config = /etc/delfin/api-paste.ini
delfin_cryptor = delfin.cryptor._Base64
api_max_limit = 1000
# Uncomment or add exporters
# performance_exporters = PerformanceExporterPrometheus, PerformanceExporterKafka
# alert_exporters = AlertExporterPrometheus

[database]
connection = sqlite:////var/delfin.sqlite
db_backend = sqlalchemy

[TELEMETRY]
performance_collection_interval = 900

[KAFKA_EXPORTER]
kafka_topic_name = "delfin-kafka"
kafka_ip = '<Delfin_IP>'
kafka_port = '9092'

[PROMETHEUS_EXPORTER]
metric_server_ip = 0.0.0.0
metric_server_port = 8195
metrics_cache_file = /var/lib/delfin/delfin_exporter.txt

[PROMETHEUS_ALERT_MANAGER_EXPORTER]
alert_manager_host = '<Delfin_IP>'
alert_manager_port = '9093'
```


## Delfin APIs and Usage

Detailed specification of REST APIs, Schemas and Requests/Responses are provided in the [OpenAPI Spec](https://github.com/sodafoundation/delfin/blob/master/openapi-spec/swagger.yaml)

Here we are listing example CURL requests

### Register Storage

Backend storage needs to be registered with Delfin for it to be managed. Delfin should be able to access backend storage using the information provided in the registration.

```bash
curl -X POST \
http://<Delfin_IP>:8190/v1/storages \
  -H 'content-type: application/json' \
  -d '{
  "vendor":"fake_storage",
  "model":"fake_driver",
  "rest": {
    "host":"127.0.0.1",
    "port":22,
    "username":"admin",
    "password":"password"
  }
}'
```

### Delete Storage

Backend storage can be removed from management by Delfin using delete API.

```bash
curl -X DELETE \
http://<Delfin_IP>:8190/v1/storages/<storage_id>
```

### Get storages

All Delfin registered storages details may be queried using this API

```bash
curl -X GET \
http://<Delfin_IP>:8190/v1/storages
```

### Get specific storage

Specific backend storage details can be retrieved using this API

```bash
curl -X GET \
http://<Delfin_IP>:8190/v1/storages/<storage_id>
```

### Update access info

If backend access information is changed, it can be updated to Delfin through this API

```bash
curl -X PUT \
http://<Delfin_IP>:8190/v1/storages/<storage_id>/access-info \
  -H 'content-type: application/json' \
  -d '{
  "rest": {
    "host": "10.0.0.1",
    "port": 8008,
    "username": "admin",
    "password": "string"
  }
}'
```

### Get Access_info

Current access information details of a storage can be retrieved using this API

```bash
curl -X GET \
http://<Delfin_IP>:8190/v1/storages/<storage_id>/access-info
```

### Configure alert-source

Configure an alert source for the storage using this API

```bash
curl -X PUT \ http://<Delfin_IP>:8190/v1/storages/<storage_id>/alert-source \
 -H 'content-type: application/json' \
 -d '{
  "version": "SNMPV2C",
  "community_string": "string",
  "username": "string",
  "engine_id": "string",
  "security_level": "noAuthnoPriv",
  "auth_protocol": "MD5",
  "auth_key": "string",
  "privacy_protocol": "DES",
  "privacy_key": "string",
  "host": "10.0.0.1",
  "context_name": "New Context",
  "retry_num": 2,
  "expiration": 60,
  "port": 20162
}’
```

### Get alert source

Current alert source information details of a storage can be retrieved using this API

```bash
curl -X GET \  http://<Delfin_IP>:8190/v1/storages/<storage_id>/alert-source
```

### Delete alert source

Delete the configured alert source information from the storage

```bash
curl -X DELETE \
http://<Delfin_IP>:8190/v1/storages/<storage_id>/alert-source
```

### Alerts

Lists all alerts in the storage from the specified interval

```bash
curl -X POST \
http://<Delfin_IP>:8190/v1/storages/<storage_id>/alerts -H 'content-type: application/json' \
-d '{
  "begin_time": "13577777777777766",
  "end_time": "13577777777777776"
}’
```


### Delete Alerts

Delete the specified alert from backend storage.

```bash
curl -X DELETE \
http://<Delfin_IP>:8190/v1/storages/<storage_id>/alerts/<alert_seq_no>
```

### Sync

Syncs resources information from specified backend storage to Delfin

```bash
curl -X POST \ http://<Delfin_IP>:8190/v1/storages/<storage_id>/sync
```

### Sync all storages

Syncs resources information from all backend storages to Delfin

```bash
curl -X POST \
http://<Delfin_IP>:8190/v1/storages/sync
```

### Get resources

Get resources (resources are, storage_pools, volumes, controllers, ports, disks) details from all the backend storages registered with Delfin. Example below shows getting disks resource details

```bash
curl -X GET \
http://<Delfin_IP>:8190/v1/disks
```

### Get specific resource

Get resources (resources are, storage_pools, volumes, controllers, ports, disks) details from specified backend storages registered with Delfin. Example below shows getting disks resource details

```bash
curl -X GET \
http://<Delfin_IP>:8190/v1/disks/<disk_id>
```

### Performance collection

After successful registration of a storage Delfin will automatically starts performance metrics collection. Delfin framework will call driver interface to get the capabilities of the storage for supported metrics. Delfin framework periodically call driver interface of collect metrics for performance metrics. Performance metrics collection interval can be configured from delfin configuration file as above.

### Security & Certificates

The backends may support secure access, using SSL/TLS certificates.

Delfin drivers support specifying a certificate file or root certificate path while accessing backend storage. Also, Delfin drivers support reloading of certificate files if enabled, for supporting certificate expiry.

The file ‘delfin/ssl_utils.py’, has needed function prototypes that may be customized for the clients platform requirements.

### Exports

Delfin supports custom exporters for metrics and resources so that the client platform can integrate and utilize Delfin features easily.

A Sample exporter implementation is provided in Delfin repo for reference. Also, documentation for writing custom exporters is provided below.

## Reference

- [Delfin Design Spec](https://github.com/sodafoundation/architecture-analysis/blob/master/arch-design/delfin/SODA_InfrastructureManagerDesign.md)
- [Delfin OpenAPI Spec](https://github.com/sodafoundation/delfin/blob/master/openapi-spec/swagger.yaml)
- [Delfin Exporter writing guide](https://docs.sodafoundation.io/guides/developer-guides/delfin/exporter-developer-guide/)
- [Delfin Developer Guide](https://docs.sodafoundation.io/guides/developer-guides/delfin/)
- [Alert Spec](https://github.com/sodafoundation/architecture-analysis/blob/master/specs/SIM/alert_manager/SODA_AlertManagerDesign.md)
- [Performance metrics Spec](https://github.com/sodafoundation/architecture-analysis/pull/77)
