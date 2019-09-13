---
title: Telemetry with LVM User Guide
description: "User guide for Telemetry with LVM."
weight: 10
disableToc: false
---


## Getting Started!
This guide is a "Hello World"-style tutorial which shows how to install, configure, and use Telemetry feature in a simple opensds with lvm  setup.
By following this guide you will be able to install opensds with telemetry tools, create test volumes, create sample grafana dashboard, create sample alert rules and view dashboards.

## Deploying Opensds with Telemetry
Follow this opensds wiki link to install opensds with telemetry and 
***Pay special attention to the section below before starting the deploy operation!***

**Download opensds-installer code**

    
    git clone https://github.com/opensds/opensds-installer.git
    cd opensds-installer
    # Checkout the latest release, give master by defualt or specfy the branch 
    git checkout master
   
    
  **How to enable Telemetry installation**
  
   Update the file : ansible/group_vars/telemetry.yml to install telemetry tools
   
    
    # Do you need to install telemetry tools?
    install_telemetry_tools: true
    
Detailed instruction is in this link

- [OpenSDS Local Cluster Installation through Ansible On Ubuntu](https://github.com/opensds/opensds/wiki/OpenSDS-Cluster-Installation-through-Ansible) (Recommended)

### Make environment ready for metric collection

**export required OPENSDS environment variables**
```
export OPENSDS_ENDPOINT=http://{{ host_ip }}:50040
export OPENSDS_AUTH_STRATEGY=keystone
export OS_AUTH_URL=http://{{ host_ip }}/identity
export OS_USERNAME=admin
export OS_PASSWORD=opensds@123
export OS_TENANT_NAME=admin
export OS_PROJECT_NAME=admin
export OS_USER_DOMAIN_ID=default
```
make sure pool is available
```sh
osdsctl pool list
```

#### Create a default profile firstly.
```
osdsctl profile create '{"name": "default", "description": "default policy", "storageType": "block"}'
```

#### Create a volume.
```
osdsctl volume create 1 --name=test-001
```

#### List all volumes in opensds.
```
osdsctl volume list
```
#### List all volumes in lvm.
```
lvs
```
example :

root@ubuntu-125:~# lvs


      LV                                          VG              Attr       LSize Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert
      volume-94d29753-2edd-4257-9623-1ec6e128b68a opensds-volumes -wi-ao---- 1.00g
#### Create File system and mount volume.
```sh
mkdir /mnt/<Dir to mount>
pvscan
vgscan
mkfs.ext4 /dev/opensds-volumes/<volume-name >
mount /dev/opensds-volumes/<volume-name> /mnt/<Dir to mount>/


```

#### Generate some IO on disk using DD commands
Use DD commands repeatedly to generate some IO on created volume.


dd if=/dev/input.file  of=/path/to/output.file  bs=block-size  count=number-of-blocks  oflag=dsync

example :
```sh

dd if=/root/1/img2.jpg of=/mnt/user/img2.jpg bs=1G count=1 oflag=dsync
```
## Open OpenSDS Telemetry UI

OpenSDS Telemetry feature specific UI can be accessed via

`http://{your_host_ip}:8088/#/monitor`, 

login  using the default admin credentials: `admin/opensds@123`. 

![Telemetry UI image  ](telemetry_ui.PNG?raw=true)

### View metrics/graph in grafana
Launch grafana from OpensdsUI ( Note: first time login from a browser will ask for user credentials. default user credential is (`admin/admin`) )

 **Add data source: Prometheus**
 
First time login may require to add Prometheus as data source 

![Adding data source ](grafana_add_ds.PNG?raw=true)


Give Prometheus details 

![save data source  ](grafana_save_ds.PNG?raw=true)





 **Create Dashboard with metric graphs**
 
Home-> Add new Dashboard -> select  graph
 
 
 ![new dashboard image ](grafana_new_dashboard.PNG?raw=true)
 


select Edit graph and add  query for lvm metrics (metric name starts with 'lvm' are produced by opensds lvm_exporter; similarly metrics starts with 'node' are produced by node_exporter)

 ![edit graph image ](grafana_edit_graph.PNG?raw=true)
 
  ![add metrics image ](grafana_add_metrics.PNG?raw=true)



Save dashboard and return.
### Configure Alert
We need to configure the Prometheus server so it can talk to Alert Manager service. We are going to set up an alert rule file which defines all rules needed to trigger an alert.

 **Define alert rule file in prometheus config**
 ```
vi /etc/prometheus/prometheus.yml
```
add rules_files config
```
rule_files:
  - alert.rules.yml
alerting:
  alertmanagers:
  - static_configs:
    - targets: ['localhost:9093']

 ```
 create alert.rules.yml ( below is sample alert rule to generate alert when iops is >50 tps)
 ```
 vi /etc/prometheus/alert.rules.yml
 ```
 ```
 groups:
- name: alert.rules
  rules:
  - alert: HighIOPS
    expr: lvm_disk_iops_tps > 50
    for: 1m
    labels:
      severity: "critical"
    annotations:
      summary: "High IOPS on {{ $labels.device }}  "
      description: "{{ $labels.device }} of job {{ $labels.job }} has been showing high IOPS  for more than 1 minutes."


 ```

### FAQ
1. Why Grafana/AlertManager is not opening up from OpensdsUI ?

Ans: 
* Check whether these tools are opening independent by giving their URL (grafana: http://yourIP:3000 and Alert Manager : http://yourIP:9093)
* Check whether these services are running 
    ```
    systemctl status grafana-server.service
    systemctl status alertmanager.service 
    ```
* Check whether the URL updated in opensds.conf is correct
    ```
    cat /etc/opensds/opensds.conf
    ```
    [osdslet]
    alertmgr_url = http://<HOST_IP>:12454
    grafana_url = http://<HOST_IP>.60:12457
    node_exporter_watch_folder = /root/prom_nodeexporter_folder/

2. Why lvm metrics are displayed in grafana
* Check lvm_exporter is running
```
 systemctl status lvm_exporter.service 
```
* Check lvm metrics are received in prometheus , by typing lvm metric names

 ![prometheus ](prometheus.PNG?raw=true)

