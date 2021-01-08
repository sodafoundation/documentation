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

* Implement all the interfaces defined in `<delfin path>/delfin/drivers/driver.py`, in the new driver.

| Driver Interfaces | Input args | Output | Comment |
| ------ | ------ | ------ | ------ |
| **get_storage()** | `context`: Delfin framework context | Storage dict with schema defined in `delfin/db/sqlalchemy/model.py` `Storage` |  Get storage device information from storage system |
| **reset_connection()** | `context`: Delfin framework context, kwargs: access info | None |  Reset connection with backend with new args |
| **list_storage_pools()** | `context`: Delfin framework context | StoragePool dict with schema defined in `delfin/db/sqlalchemy/model.py` `StoragePool` |  List all storage pools from storage system |
| **list_volume()** | `context`: Delfin framework context | Volume dict with schema defined in `delfin/db/sqlalchemy/model.py` `Volume` |  List all storage volumes from storage system |
| **add_trap_config()** | `context`: Delfin framework context, `trap_config`: trap configuration | None |  Config the trap receiver in storage system |
| **remove_trap_config()** | `context`: Delfin framework context, `trap_config`: trap configuration | None |  Remove trap receiver configuration from storage system |
| **parse_alert()** | `context`: Delfin framework context, `alert`: alert to parse | Alert dict as shown in `delfin/drivers/driver.py` |  Parse alert data got from snmp trap server |
| **list_alerts()** | `context`: Delfin framework context, `query_para`: optional, contains 'begin_time' and 'end_time' | Alert dict as shown in `delfin/drivers/driver.py` |  List all current alerts from storage system |
| **clear_alert()** | `context`: Delfin framework context, `alert`: alert to clear | Success/Failure |   Clear alert from storage system |

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

  ```

* Install delfin and start delfin services of api.py, task.py and alert.py.

  ```bash
  cd <delfin directory>
  ./script/start.sh

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

## Conclusion

Pluggable design of Driver Manager makes it easy to add third party drivers expanding infrastructure management capabilities of SODA Delfin to multiple storage backends.


