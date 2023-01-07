---
title: Driver Developer Guide
menuTitle: Driver 
description: "Delfin Driver Development Guide"
weight: 10
disableToc: false
tags: ["developer guide", "delfin", "driver"]
---



Delfin is an Infrastructure Management framework under SODA foundation projects for Heterogeneous storage backends (cloud-enabled, offline-storage, etc.) for management, status collection, telemetry and alerting.

## Goals

  - Enable third parties to integrate a new backend to SODA Delfin framework
  - Collect the steps needed to integrate a new backend to SODA Delfin framework
  - Details the interfaces that new backend driver needs to be implemented

## Motivation and background

Delfin is an Infrastructure Management framework developed in Python programming language. It provides a Python plugin interface for adding third party drivers thereby supporting third party backends. The third party driver needs to implement the interfaces defined in the Driver python class, for the framework to use the third party driver. Once drivers implement the interfaces with the details of backend storage, delfin can manage the backend.

## Non-Goals

  - Support backend specific implementation details 
  - Explain internal or higher level framework specific details

## License

Delfin project is Licensed under the *Apache License, Version 2.0*. For a third party driver to be merged to Delfin project repository, please ensure it uses compatible License.

## Third party driver integration

SODA Delfin project already contains some [drivers](https://github.com/sodafoundation/delfin/tree/master/delfin/drivers), which can be used as reference by the new third party driver developers.

Existing Delfin Drivers for reference:
  - fake_driver - This is a dummy/sample driver used for testing purpose
  - Huawei Oceanstor- This driver implements Huawei's OeanStor backend
  - DELL EMC VMAX - This driver implements Dell EMC's VMAX storage backend
  - DELL EMC UNITY - This driver implements Dell EMC's Unity backend
  - HPE 3PAR - This driver implements HPE 3PAR backend
  - Hitachi VSP -  This driver implements Hitachi VSP backend
  - IBM storewize/SVC - This driver implements IBM storewize and SVC backends.
  - Netapp Ontap - This driver implements Netapp Ontap 9+ with cluster mode.
  - Pure Storage - This driver implements Pure Storage array.
  - ......

### Code changes needed

* Add driver plugin 'entry points' to the file 'setup.py'.
  ```python

    'delfin.storage.drivers': [
        ...
        'sample_vendor sample_model = delfin.drivers.sample_vendor:SampleStorageDriver',
        ...
    ]

  ```

* Create driver source code folder under `<delfin path>/delfin/drivers/`
  ```bash
  mkdir -p /path-to-delfin/delfin/drivers/sample_vendor
  touch /path-to-delfin/delfin/drivers/sample_vendor/__init__.py
  ```

* Extend base class StorageDriver defined in `<delfin path>/delfin/drivers/driver.py`, to implement a new driver.

  ```python

  from delfin.drivers import driver


  class SampleStorageDriver(driver.StorageDriver):
    """SampleStorageDriver shows how to implement the StorageDriver,
    
    """

    def __init__(self, **kwargs):
        super().__init__(**kwargs)

    def reset_connection(self, context, **kwargs):
        pass


  ```

* Implement all the mandatory interfaces defined in `<delfin path>/delfin/drivers/driver.py`, in the new driver.

| Driver Interfaces | Input args | Output | Comment |
| ------ | ------ | ------ | ------ |
| **get_storage()** | `context`: Delfin framework context | Storage dict with schema defined in `delfin/db/sqlalchemy/model.py` `Storage` |  Get storage device information from storage system |
| **reset_connection()** | `context`: Delfin framework context, kwargs: access info | None |  Reset connection with backend with new args |
| **list_storage_pools()** | `context`: Delfin framework context | StoragePool dict with schema defined in `delfin/db/sqlalchemy/model.py` `StoragePool` |  List all storage pools from storage system |
| **list_volumes()** | `context`: Delfin framework context | Volume dict with schema defined in `delfin/db/sqlalchemy/model.py` `Volume` |  List all storage volumes from storage system |
| **list_controllers()** | `context`: Delfin framework context | Controller dict with schema defined in `delfin/db/sqlalchemy/model.py` `Controller` |  List all controllers from storage system |
| **list_ports()** | `context`: Delfin framework context | Port dict with schema defined in `delfin/db/sqlalchemy/model.py` `Port` |  List all ports from storage system |
| **list_disks()** | `context`: Delfin framework context | Disk dict with schema defined in `delfin/db/sqlalchemy/model.py` `Disk` |  List all disks from storage system |
| **list_quotas()** | `context`: Delfin framework context | Quota dict with schema defined in `delfin/db/sqlalchemy/model.py` `Quota` |  List all quotas from storage system |
| **list_filesystems()** | `context`: Delfin framework context | Filesystem dict with schema defined in `delfin/db/sqlalchemy/model.py` `Filesystem` |  List all filesystems from storage system |
| **list_qtrees()** | `context`: Delfin framework context | Qtree dict with schema defined in `delfin/db/sqlalchemy/model.py` `Qtree` |  List all qtrees from storage system |
| **list_shares()** | `context`: Delfin framework context | Share dict with schema defined in `delfin/db/sqlalchemy/model.py` `Share` |  List all shares from storage system |
| **add_trap_config()** | `context`: Delfin framework context, `trap_config`: trap configuration | None |  Config the trap receiver in storage system |
| **remove_trap_config()** | `context`: Delfin framework context, `trap_config`: trap configuration | None |  Remove trap receiver configuration from storage system |
| **parse_alert()** | `context`: Delfin framework context, `alert`: alert to parse | Alert dict as shown in `delfin/drivers/driver.py` |  Parse alert data got from snmp trap server |
| **list_alerts()** | `context`: Delfin framework context, `query_para`: optional, contains 'begin_time' and 'end_time' | Alert dict as shown in `delfin/drivers/driver.py` |  List all current alerts from storage system |
| **clear_alert()** | `context`: Delfin framework context, `alert`: alert to clear | Success/Failure |   Clear alert from storage system |
| **get_capabilities()** | `context`: Delfin framework context | Capabilities schema defined in `delfin/api/schemas/storage_capabilities_schema.py` | Return metrics collection capabilites of the storage system |
| **collect_perf_metrics()** | `context`: Delfin framework context, `storage_id`: delfin storage id, `resource_metrics`: required metrics, `start_time`: metrics start time, `end_time`: metrics end time | Collected metrics |   Collects metrics from storage system |
| **list_storage_host_initiators()** | `context`: Delfin framework context | StorageHostInitiator dict with schema defined in `delfin/db/sqlalchemy/model.py` `StorageHostInitiator` |  List all storage host initiators from storage system |
| **list_storage_hosts()** | `context`: Delfin framework context | StorageHost dict with schema defined in `delfin/db/sqlalchemy/model.py` `StorageHost` |    List all storage hosts from storage system |
| **list_storage_host_groups()** | `context`: Delfin framework context | StorageHostGroup dict with schema defined in `delfin/db/sqlalchemy/model.py` ` StorageHostGroup` |   List all storage host groups from storage system |
| **list_port_groups()** | `context`: Delfin framework context | PortGroup dict with schema defined in `delfin/db/sqlalchemy/model.py` `PortGroup`  |   List all port groups from storage system |
| **list_volume_groups()** | `context`: Delfin framework context | VolumeGroup dict with schema defined in `delfin/db/sqlalchemy/model.py` `VolumeGroup`  |   List all volume groups from storage system |
| **list_masking_views()** | `context`: Delfin framework context | MaskingView dict with schema defined in `delfin/db/sqlalchemy/model.py` `MaskingView`  |    List all masking views from storage system |
| **get_alert_sources()** | `context`: Delfin framework context  | AlertSource dict with schema defined in `delfin/db/sqlalchemy/model.py` `AlertSource`  |    List all the alert soures from storage system |
| **get_latest_perf_timestamp()** | `context`: Delfin framework context |   |  Get the timestamp of the latest performance data of the device |

  ```python

    def get_storage(self, context):
        # Do something here
        return {
            'name': 'sample',
            'description': 'sample',
            'vendor': 'sample_vendor',
            'model': 'sample_model',
            'status': 'normal',
            'serial_number': 123,
            'firmware_version': '1.0.0',
            'location': 'HK',
            'total_capacity': 123,
            'used_capacity': 0,
            'free_capacity': 123,
            'raw_capacity': 123,
            'subscribed_capacity': 123
        }

    def list_storage_pools(self, context):
        pool_list = []
        for idx in range(3):
            p = {
                "name": "sample_pool_" + str(idx),
                "storage_id": self.storage_id,
                "native_storage_pool_id": "sample_original_id_" + str(idx),
                "description": "Sample Pool",
                "status": "normal",
                "total_capacity": 123,
                "used_capacity": 0,
                "free_capacity": 123,
            }
            pool_list.append(p)
        return pool_list

    def list_volumes(self, context):
      volume_list = []
      for i in range(1, 5):
          v = {
              "name": "sample_vol_" + str(i),
              "storage_id": self.storage_id,
              "description": "Sample Volume",
              "status": "normal",
              "native_volume_id": "sample_original_id_" + str(i),
              "wwn": "fake_wwn_" + str(i),
              "total_capacity": 12,
              "used_capacity": 2,
              "free_capacity": 10,
          }
          volume_list.append(v)
          return volume_list

    def list_controllers(self, context):
      controller_list = []
      for i in range(1, 3):
          c = {
              "name": "sample_ctrl_" + str(i),
              "storage_id": self.storage_id,
              "native_controller_id": "sample_original_id_" + str(i),
              "status": "normal",
              "memory_size": 10000000,
              "cpu_info": 'Intel Xenon',
              "location": 'rack-10',
              "soft_version": 'v1.0.0',
          }
          controller_list.append(c)
          return controller_list

    def list_ports(self, context):
      port_list = []
      for i in range(1, 3):
          p = {
              "name": "sample_port_" + str(i),
              "storage_id": self.storage_id,
              "native_port_id": "sample_original_id_" + str(i),
              "health_status": "normal",
              "type": "fc",
              "speed": 1000,
              "max_speed": 10000,
              "wwn": "wwn12345",
          }
          port_list.append(p)
          return port_list

    def list_disks(self, context):
      disk_list = []
      for i in range(1, 3):
          d = {
              "name": "sample_disk_" + str(i),
              "storage_id": self.storage_id,
              "native_disk_id": "sample_original_id_" + str(i),
              "serial_number": "serial-123",
              "manufacturer": "Seagate",
              "model": "Model-SSD",
              "status": "normal",
              "location": "cage-10",
              "capacity": 1000000,
              "speed": 20000,
              "health_score": 98,
          }
          disk_list.append(d)
          return disk_list

    def list_quotas(self, context):
      quota_list = []
      for i in range(1, 5):
          q = {
              "storage_id": self.storage_id,
              "native_quota_id": "sample_original_id_" + str(i),
              "native_qtree_id": "sample_qtree_id_" + str(i),
              "type": "tree",
              "capacity_hard_limit": 9000000,
              "capacity_soft_limit": 7500000,
              "used_capacity": 1000000,
              "file_hard_limit": 900000,
              "file_soft_limit": 750000,
              "file_count": 200000,
          }
          quota_list.append(q)
          return quota_list

    def list_filesystems(self, context):
      fs_list = []
      for i in range(1, 5):
          f = {
              "name": "sample_fs_" + str(i),
              "storage_id": self.storage_id,
              "native_filesystem_id": "sample_original_id_" + str(i),
              "native_pool_id": "sample_pool_id_" + str(i),
              "status": "normal",
              "type": "non_worm",
              "total_capacity": 12,
              "used_capacity": 2,
              "free_capacity": 10,
          }
          fs_list.append(f)
          return fs_list

    def list_qtrees(self, context):
      qtree_list = []
      for i in range(1, 5):
          q = {
              "name": "sample_qtree_" + str(i),
              "storage_id": self.storage_id,
              "native_qtree_id": "sample_original_id_" + str(i),
              "native_filesystem_id": "sample_original_id_" + str(i),
              "security_mode": "ntfs",
              "path": "\opt\path",
          }
          qtree_list.append(q)
          return qtree_list

    def list_shares(self, context):
      share_list = []
      for i in range(1, 5):
          s = {
              "name": "sample_share_" + str(i),
              "storage_id": self.storage_id,
              "native_share_id": "sample_original_id_" + str(i),
              "native_filesystem_id": "sample_fs_id_" + str(i),
              "native_qtree_id": "sample_qt_id_" + str(i),
              "protocol": "cifs",
              "path": "\opt\share_path",
          }
          share_list.append(s)
          return share_list

    def add_trap_config(self, context, trap_config):
        pass

    def remove_trap_config(self, context, trap_config):
        pass

    def parse_alert(self, context, alert):
        pass

    def clear_alert(self, context, alert):
        pass

    def list_alerts(self, context, query_para=None):
        pass

    def collect_perf_metrics(self, context, storage_id, metrics, start, stop):
	perf_metrics_list = [
            constants.metric_struct(name='iops',
                                    labels={
                                        'storage_id': '12345',
                                        'resource_type': 'storage',
                                        'resource_id': '00112233',
                                        'resource_name': 'VMAX00112233',
                                        'type': 'RAW',
                                        'unit': 'IOPS'},
                                    values={1566550500000: 417.42667}
                                    ),
            constants.metric_struct(name='iops',
                                    labels={
                                        'storage_id': '12345',
                                        'resource_type': 'storagePool',
                                        'resource_id': 'SRP_1',
                                        'resource_name': 'SRP_1',
                                        'type': 'RAW',
                                        'unit': 'IOPS'},
                                    values={1566550800000: 304.8}
                                    ),
            constants.metric_struct(name='iops',
                                    labels={
                                        'storage_id': '12345',
                                        'resource_type': 'controller',
                                        'resource_id': 'DF-1C',
                                        'resource_name': 'BEDirector_DF-1C',
                                        'type': 'RAW',
                                        'unit': 'IOPS'
                                    },
                                    values={1566987000000: 248.40666}
                                    ),
            constants.metric_struct(name='iops',
                                    labels={
                                        'storage_id': '12345',
                                        'resource_type': 'port',
                                        'resource_id': '12',
                                        'resource_name': 'BEPort_DF-1C_12',
                                        'type': 'RAW',
                                        'unit': 'IOPS'
                                    },
                                    values={1566987000000: 6.693333}
                                    ),
        ]
        return perf_metrics_list

    def get_capabilities(context, filters=None):
	return {
            'is_historic': False,
            'performance_metric_retention_window': 4500,
            'resource_metrics': {
                "storage": {
                    "throughput": {
                        "unit": "MB/s",
                        "description": "Represents how much data is "
                                       "successfully transferred in MB/s"
                    },
                    "responseTime": {
                        "unit": "ms",
                        "description": "Average time taken for an IO "
                                       "operation in ms"
                    },
                    "iops": {
                        "unit": "IOPS",
                        "description": "Input/output operations per second"
                    },
                },
                "storagePool": {
                    "throughput": {
                        "unit": "MB/s",
                        "description": "Total data transferred per second "
                    },
                    "responseTime": {
                        "unit": "ms",
                        "description": "Average time taken for an IO "
                                       "operation"
                    },
                },
                "volume": {
                    "throughput": {
                        "unit": "MB/s",
                        "description": "Total data transferred per second "
                    },
                    "responseTime": {
                        "unit": "ms",
                        "description": "Average time taken for an IO "
                                       "operation"
                    },
                    "iops": {
                        "unit": "IOPS",
                        "description": "Read and write  operations per"
                                       " second"
                    },
                    "cacheHitRatio": {
                        "unit": "%",
                        "description": "Percentage of io that are cache "
                                       "hits"
                    },
                    "ioSize": {
                        "unit": "KB",
                        "description": "The average size of IO requests in KB"
                    },
                },
                "controller": {
                    "throughput": {
                        "unit": "MB/s",
                        "description": "Total data transferred per second "
                    },
                    "responseTime": {
                        "unit": "ms",
                        "description": "Average time taken for an IO "
                                       "operation"
                    },
                    "iops": {
                        "unit": "IOPS",
                        "description": "Read and write  operations per "
                                       "second"
                    },
                },
                "port": {
                    "throughput": {
                        "unit": "MB/s",
                        "description": "Total data transferred per second "
                    },
                    "responseTime": {
                        "unit": "ms",
                        "description": "Average time taken for an IO "
                                       "operation"
                    },
                    "iops": {
                        "unit": "IOPS",
                        "description": "Read and write  operations per "
                                       "second"
                    },
                },
                "disk": {
                    "throughput": {
                        "unit": "MB/s",
                        "description": "Total data transferred per second "
                    },
                    "responseTime": {
                        "unit": "ms",
                        "description": "Average time taken for an IO "
                                       "operation"
                    },
                    "iops": {
                        "unit": "IOPS",
                        "description": "Read and write  operations per"
                                       " second"
                    },
                },
                "filesystem": {
                    "throughput": {
                        "unit": "MB/s",
                        "description": "Total data transferred per second "
                    },
                    "readResponseTime": {
                        "unit": "ms",
                        "description": "Average time taken for a read"
                                       "operation"
                    },
                    "writeResponseTime": {
                        "unit": "ms",
                        "description": "Average time taken for a write "
                                       "operation"
                    },
                    "iops": {
                        "unit": "IOPS",
                        "description": "Read and write  operations per"
                                       " second"
                    },
                    "ioSize": {
                        "unit": "KB",
                        "description": "The average size of IO requests "
                                       "in KB."
                    },
                },
            },
        }
	
    def list_storage_host_initiators(self, context):
        storage_host_initiators_list = [
            {
                "name": "storage_host_initiator_1",
                "description": "storage_host_initiator_1",
                "alias": "storage_host_initiator_1",
                "storage_id": self.storage_id,
                "native_storage_host_initiator_id": "storage_host_initiator_1",
                "wwn": "wwn_1",
                "status": "Normal",
                "native_storage_host_id": "storage_host_1",
            },
            {
                "name": "storage_host_initiator_2",
                "description": "storage_host_initiator_2",
                "alias": "storage_host_initiator_2",
                "storage_id": self.storage_id,
                "native_storage_host_initiator_id": "storage_host_initiator_2",
                "wwn": "wwn_2",
                "status": "Normal",
                "native_storage_host_id": "storage_host_2",
            }
        ]
        return storage_host_initiators_list

    def list_storage_hosts(self, context):
        storage_hosts_list = [
            {
                "name": "storage_host_1",
                "description": "storage_host_1",
                "storage_id": self.storage_id,
                "native_storage_host_id": "storage_host_1",
                "os_type": "linux",
                "status": "Normal",
                "ip_address": "1.2.3.4"
            },
            {
                "name": "storage_host_2",
                "description": "storage_host_2",
                "storage_id": self.storage_id,
                "native_storage_host_id": "storage_host_2",
                "os_type": "linux",
                "status": "Normal",
                "ip_address": "1.2.3.5"
            }
        ]
        return storage_hosts_list

    def list_storage_host_groups(self, context):
        host_groups = [
            {
                "name": "storage_host_group_1",
                "description": "storage_host_group_1",
                "storage_id": self.storage_id,
                "native_storage_host_group_id": "storage_host_group_1",
                "storage_hosts": "host1,host2"
            },
            {
                "name": "storage_host_group_2",
                "description": "storage_host_group_2",
                "storage_id": self.storage_id,
                "native_storage_host_group_id": "storage_host_group_2",
                "storage_hosts": "host3,host4"
            }
        ]

        storage_host_group_relation_list = [
            {
                'storage_id': self.storage_id,
                'native_storage_host_group_id': "storage_host_group_1",
                'native_storage_host_id': "host1"
            },
            {
                'storage_id': self.storage_id,
                'native_storage_host_group_id': "storage_host_group_1",
                'native_storage_host_id': "host2"
            },
            {
                'storage_id': self.storage_id,
                'native_storage_host_group_id': "storage_host_group_2",
                'native_storage_host_id': "host3"
            },
            {
                'storage_id': self.storage_id,
                'native_storage_host_group_id': "storage_host_group_2",
                'native_storage_host_id': "host4"
            }
        ]
        result = {
            'storage_host_groups': host_groups,
            'storage_host_grp_host_rels': storage_host_group_relation_list
        }
        return result

    def list_port_groups(self, context):
        port_group_list = [
            {
                "name": "port_group_1",
                "description": "port_group_1",
                "storage_id": self.storage_id,
                "native_port_group_id": "storage_port_group_1",
                "ports": "port_1,port_2"
            }
        ]
        port_group_relation = [
            {
                'storage_id': self.storage_id,
                'native_port_group_id': "storage_port_group_1",
                'native_port_id': "port_1"
            },
            {
                'storage_id': self.storage_id,
                'native_port_group_id': "storage_port_group_1",
                'native_port_id': "port_2"
            }
        ]
        result = {
            'port_groups': port_group_list,
            'port_grp_port_rels': port_group_relation
        }
        return result

    def list_volume_groups(self, context):
        volume_group_list = [
            {
                "name": "volume_group_1",
                "description": "volume_group_1",
                "storage_id": self.storage_id,
                "native_volume_group_id": "volume_group_1",
                "volumes": "volume1,volume2"
            }
        ]
        volume_group_relation = [
            {
                'storage_id': self.storage_id,
                'native_volume_group_id': "volume_group_1",
                'native_volume_id': "volume1"
            },
            {
                'storage_id': self.storage_id,
                'native_volume_group_id': "volume_group_1",
                'native_volume_id': "volume2"

            }
        ]
        result = {
            'volume_groups': volume_group_list,
            'vol_grp_vol_rels': volume_group_relation
        }
        return result

    def list_masking_views(self, context):
        masking_view_list = [
            {
                "name": "masking_view_1",
                "description": "masking_view_1",
                "storage_id": self.storage_id,
                "native_masking_view_id": "masking_view_1",
                "native_storage_host_group_id": "storage_host_group_1",
                "native_volume_group_id": "volume_group_1",
                "native_port_group_id": "port_group_1",
                "native_storage_host_id": "",
                "native_volume_id": "",
            },
            {
                "name": "masking_view_2",
                "description": "masking_view_2",
                "storage_id": self.storage_id,
                "native_masking_view_id": "masking_view_2",
                "native_storage_host_group_id": "storage_host_group_2",
                "native_volume_group_id": "volume_group_2",
                "native_port_group_id": "port_group",
                "native_storage_host_id": "storage_host_1",
                "native_volume_id": "volume_1",
            }
        ]
        return masking_view_list

    def get_alert_sources(self, context):
        return []

    def get_latest_perf_timestamp(self, context):
        pass

  ```

* Install delfin and start delfin services of api.py, task.py and alert.py.

  ```bash
  export PYTHONPATH=$(pwd)
  installer/install
  ```

* Ensure create storages API call from Delfin, can load the driver successfully.

  ```bash
  # Sample driver with dummy values for create storage body
  curl -H "Content-Type: application/json" -X POST http://localhost:8190/v1/storages -d '
  {
    "rest": {
      "host": "127.0.0.1",
      "port": "22",
      "username": "username",
      "password": "password",
      "vendor": "sample_vendor",
      "model": "sample_model"
    }
  }'

  # Example Response:

  '{"created_at": "2020-09-15T14:10:10.692091", "updated_at": null, "id": "849e0e90-35bd-4d23-8155-53a5a583bcbf", "name": "sample", "vendor": "sample_vendor", "description": "sample", "model": "sample_model", "status": "normal", "serial_number": 123, "firmware_version": "1.0.0", "location": "HK", "total_capacity": 123, "used_capacity": 0, "free_capacity": 123, "raw_capacity": 123, "subscribed_capacity": 123, "sync_status": "SYNCED", "deleted_at": null, "deleted": false}'


  curl -H "Content-Type: application/json" -X GET http://localhost:8190/v1/storages

  # Example Response:

  {"storages": [{"created_at": "2020-09-15T14:11:05.611150", "updated_at": "2020-09-15T14:11:05.919163", "id": "2021529b-0235-4a75-b358-0779189d6463", "name": "fake_driver", "vendor": "fake_vendor", "description": "fake driver.", "model": "fake_model", "status": "normal", "serial_number": "1f8d0680-491d-4b13-9b08-996e1ef8ae6d", "firmware_version": "1.0.0", "location": "HK", "total_capacity": 1355, "used_capacity": 934, "free_capacity": 421, "raw_capacity": 2423, "subscribed_capacity": 3884, "sync_status": "SYNCED", "deleted_at": null, "deleted": false}, {"created_at": "2020-09-15T14:10:10.692091", "updated_at": "2020-09-15T14:10:10.970153", "id": "849e0e90-35bd-4d23-8155-53a5a583bcbf", "name": "sample", "vendor": "sample_vendor", "description": "sample", "model": "sample_model", "status": "normal", "serial_number": "123", "firmware_version": "1.0.0", "location": "HK", "total_capacity": 123, "used_capacity": 0, "free_capacity": 123, "raw_capacity": 123, "subscribed_capacity": 123, "sync_status": "SYNCED", "deleted_at": null, "deleted": false}]}

  ```
* Ensure APIs of list_*() and alert*() works as expected.

  ``` bash
  # Example delfin APIs that can be used with Sample driver
  curl -H "Content-Type: application/json" -X GET http://localhost:8190/v1/storages
  curl -H "Content-Type: application/json" -X GET http://localhost:8190/v1/storages-pools
  curl -H "Content-Type: application/json" -X GET http://localhost:8190/v1/volumes
  curl -X POST http://localhost:8190/v1/storages/<storage_id>/sync
  ...
  ```

* Raise PR with test reports to Delfin repository.

### How it works

Third party drivers are located and loaded into Delfin, when the create storage API (POST request) is invoked for that backend.

Create Storages POST API contains a request body model namely access_info, which contains fields ‘vendor’ & ‘model’. These fields are used to match and identify the driver from the ‘entry_points’ registered by the driver. Delfin loads this matched driver and registers the driver for the created backend. Any further API calls on this backend will use this newly loaded driver.

Delfin class Driver Manager internally utilizes the Python module ‘stevedore’ for the loading of driver plugins.

Delfin performance metrics collection starts when storage is successfully registered. Delfin will query `get_capability()` interface of driver to get supported metrics and its details. And periodically call `collect_perf_metrics` interface to collect those metrics.

Delfin performance metrics collection interfaces (`get_capability()` & `collect_perf_metrics()`) sample implementation is available in the fake_storage driver `<delfin path>/delfin/drivers/fake_storage/__init__.py`

* Example Response for collect performance metrics interface:

  ```bash
  # A list of delfin.common.constants.metric_struct
  [
    "name=""throughput",
    "labels="{
      "storage_id":"7c0aa42c-d744-4353-84da-3c9b7f631f5a",
      "resource_type":"storage",
      "resource_id":"storage_0",
      "type":"RAW",
      "unit":"MB/s",
      "name":"fake_driver",
      "serial_number":"c83228e5-77d8-40c5-aa4b-2d6067d73c8b"
    },
    "values="{
      "1624874092000":75.63737435785605
    }
  ]
  ```

## Conclusion

Pluggable design of Driver Manager makes it easy to add third party drivers expanding infrastructure management capabilities of SODA Delfin to multiple storage backends.


