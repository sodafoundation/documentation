---
title: Exporter Developer Guide
menuTitle: Exporter 
description: "Delfin Exporter Development Guide"
weight: 10
disableToc: false
tags: ["developer guide", "delfin", "exporter"]
---



Delfin is an Infrastructure Management framework developed in Python programming language. It provides a Python plugin interface for adding third party exporters.
Third party exporters are required when you want to consume  performance and alert data collected by Delfin in third party platforms. The third party exporter needs to implement one interfaces to push the data. Once exporter implement the interface and update required configuration file, Delfin framework will automatically pushes data to thrid party platform through this new exporter.



## Third party exporter integration

SODA Delfin project already contains some [exporters](https://github.com/sodafoundation/delfin/tree/master/delfin/exporter), which can be used as reference by new third party exporter developers.



### Performance metric exporter

* Step 1: Add exporter plugin 'entry points' to the file 'setup.py'.

  ```python

    'delfin.performance.exporters': [
            
            'ThirdParty = delfin.exporter.ThirdParty.exporter:PerformanceExporterThirdParty'
        ]

  ```

* Step 2: Create exporter source code folder under `<delfin path>/delfin/exporters/`

 ```bash
  mkdir -p /path-to-delfin/delfin/exporters/ThirdParty
  touch /path-to-delfin/delfin/exporter/ThirdParty/__init__.py
  ```


* Step 3: Extend base class BaseExporter defined in `<delfin path>/delfin/exporter/base_exporter.py`, to implement a new exporter.

```python
from delfin.exporter import base_exporter

class PerformanceExporterThirParty(base_exporter.BaseExporter):
    def dispatch(self, ctxt, data):
        # Your logic to convert delfin performce model to third party model goes here 

  ```

{{% notice note %}}
Delfin performance data model and example can be find [here](https://github.com/sodafoundation/architecture-analysis/blob/master/arch-design/delfin/PerfomanceMontoringDesign.md#data-model)
{{% /notice %}}

* Step 4: Modify Delfin  configuration:
Third party platform configurations and exporter class name has to be provided in <path_to_delfin>/etc/delfin/delfin.conf as below.

```python
# Uncomment or add exporters
performance_exporters = PerformanceExporterThirParty, #PerformanceExporterPrometheus, PerformanceExporterKafka

  ```

* Step 5:Install delfin and start delfin services of api.py, task.py and alert.py.

  ```bash
   export PYTHONPATH=$(pwd)
   installer/install

  ```
* Step 6 : Testing

Register storage (fake storage for test)

 ```bash
  
  curl --location --request POST 'http://<delfin_ip>:8190/v1/storages' \
--header 'Content-Type: application/json' \
--data-raw '{
"vendor": "fake_storage",
"model": "fake_driver",
"rest": {
"host" : "10.0.0.1",
"port" : 8078,
"username" : "username",
"password" : "pass"

}
}



  ```

Register storage for performance collection

 ```bash
  
  curl --location --request PUT 'http://<delfin_ip>:8190/v1/storages/<storage_id>/metrics-config
' \
--header 'Content-Type: application/json' \

--data-raw '{
"array_polling" : {

"perf_collection": true,
"interval": 10,
"is_historic":true
}
}

  ```
Ensure performance metrics are dispatched to third party throgh new exporter: 
verfiy from third party platform or through DEBUG print statements in exporter log to confirm the exporter is picked and data is pushed to third party.

Step 7: Raise PR with test reports to Delfin repository.

### Alert data exporter

* Step 1: Add exporter plugin 'entry points' to the file 'setup.py'.

  ```python

    'ThirdParty = delfin.exporter.ThirdParty.exporter'
            ':AlertExporterThirdParty',
        ]

  ```

* Step 2: Create exporter source code folder under `<delfin path>/delfin/exporters/`

  ```bash
  mkdir -p /path-to-delfin/delfin/exporters/ThirdParty
  touch /path-to-delfin/delfin/exporter/ThirdParty/__init__.py
  ```

* Step 3: Extend base class BaseExporter defined in `<delfin path>/delfin/exporter/base_exporter.py`, to implement a new exporter.


```python
from delfin.exporter import base_exporter

class AlertExporterThirParty(base_exporter.BaseExporter):
    def dispatch(self, ctxt, data):
        # Your logic to convert delfin alert model to third party model goes here 

  ```

{{% notice note %}}
Note:  Delfin Alert data model can be refered [here](https://github.com/sodafoundation/architecture-analysis/blob/8549aa6ca5bf7296dedbba7b62ef63e0550a83f2/specs/SIM/alert_manager/SODA_AlertManagerDesign.md#data-model)
{{% /notice %}}

* Step 4: Modify Delfin configuration
Thir party platform configurations and exporter class name has to be provided in <path_to_delfin>/etc/delfin/delfin.conf as below.

```python
# Uncomment or add exporters
alert_exporters = AlertExporterThirParty

  ```

* Step 5: Install delfin and start delfin services of api.py, task.py and alert.py.

  ```bash
   export PYTHONPATH=$(pwd)
   installer/install

  ```
* Step 6: Testing

Register storage (fake storage for test)

 ```bash
  
  curl --location --request POST 'http://<delfin_ip>:8190/v1/storages' \
--header 'Content-Type: application/json' \
--data-raw '{
"vendor": "fake_storage",
"model": "fake_driver",
"rest": {
"host" : "10.0.0.1",
"port" : 8078,
"username" : "username",
"password" : "pass"

}
}



  ```
 Sync alerts 

 ```bash
  
  curl --location --request POST 'http://<delfin_ip>:8190/v1/storages/<storage_id>/alerts/sync' \
--header 'Content-Type: application/json' \

--data-raw '{
"begin_time" : 0,
"end_time" : 99999999
}

'
  ```
  
 Ensure alert data are dispatched to third party through new exporter
verfiy from third party platform or through DEBUG print statements in exporter log to confirm the exporter is picked and data is pushed to third party.

* Step 7 : Raise PR with test reports to Delfin repository.

### How it works

Third party exporter modules are installed with delfin . Delfin framework pushes collected data to base_exporter. base_exporter has list of all available and configured exporters. base_exporter will push data to all configured exporters.

## Conclusion

Pluggable design of exporter makes it easy to add third party exporters expanding infrastructure management capabilities of SODA Delfin to multiple data consumers.
