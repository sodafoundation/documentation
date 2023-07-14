---
title: Installation Guide using Ansible
description: "This document describes how to install SODA projects in a local cluster with detailed configuration options. These steps will help you to enable / disable projects. After installation using these steps, you can get the features of all the enabled projects. You can test either through SODA Dashboard UI or CLI"
weight: 40
---
This document describes how to install SODA projects in a local cluster with detailed configuration options. These steps will help you to enable / disable projects. After installation using these steps, you can get the features of all the enabled projects. You can test either through SODA Dashboard UI or CLI


{{% notice info %}}
**This installation guide is supported on Ubuntu 18.04 & Ubuntu 20.04.** <br />
{{% /notice %}}

---

### Pre-requisites
- SODA installation is tested on `Ubuntu 18.04`& `Ubuntu 20.04`. 


```bash
sudo apt-get update && sudo apt-get install -y git
```

- Python 3.6 or above should be installed 
- If Ansible, Docker & Go are not installed in the OS, script `install_dependencies.sh` will install it.
- If Ansible, Docker & Go are installed ensure that the version as listed below.
  - Docker: Latest (Verfied on 20.10.21)
  - Ansible: Latest (Verfied on 5.10.0, Ansible Core 2.13.5)
  - Go: go1.17.9
 



### Download SODA Installer code

```bash
git clone https://github.com/sodafoundation/installer.git
cd installer/ansible
# Checkout the required version. For example, to checkout v1.9.0 follow
git checkout v1.9.0
chmod +x install_dependencies.sh && source install_dependencies.sh
export PATH=$PATH:/home/$USER/.local/bin
```

{{% notice note %}}
Checkout the latest stable release. Current stable release: [Okinawa (v1.9.0)](https://github.com/sodafoundation/soda/releases/tag/v1.9.0). If you want to get the master branch of all components, you can skip this step. (Master may not be stable or tested fully)
{{% /notice %}}


--- 

### Configure SODA installer and environment variables

A SODA release conists of various projects which have their own release cycles and versions.


#### Set Host IP address

Set the environment variable `HOST_IP` by using the steps below. 

```bash
export HOST_IP={your_real_host_ip}
echo $HOST_IP 
```

In the SODA Installer, modify `host_ip` in `group_vars/common.yml` and change it to the actual machine IP of the host.  
By default the `host_ip` is set to `127.0.0.1` i.e. localhost.  
```bash
# This field indicates local machine host ip
host_ip: 127.0.0.1
```

---

### Select SODA Projects to install


To install SODA Projects and enable the different features, installer needs to be configured using the respective files as below:

**_Note: Terra (previously known as Hotpot) ,Strato (SODA Multicloud project, previously known as Gelato) & Delfin can be used either through dashboard or REST APIs._**

---
#### Enable Delfin installation
delfin (Dolphin in Spanish!), the SODA Infrastructure Manager project is an open source project to provide unified, intelligent and scalable resource management, alert and performance monitoring. It covers the resource management of all the backends & other infrastructures under SODA deployment. It also provides alert management and metric data (performance/health) for monitoring and further analysis.

- Enable following configurations  
  - In file installer/ansible/group_vars/delfin.yml `enable_delfin: true`  
  - In file installer/ansible/group_vars/srm-toolchain.yml `install_srm_toolchain: true`  
  - In file installer/ansible/group_vars/dashboard.yml `enable_dashboard: true`  **OR**
  - In file installer/ansible/group_vars/delfin-ui.yml `enable_delfin_ui: true`  
  - **[Click here](#configure-delfin-installation) for other supported configuration details**

---

#### Enable Terra  
 Terra installs SODA On Premise only.  
- Enable following configurations  
  - In file installer/ansible/group_vars/hotpot.yml  update the value  `enable_hotpot : true`.
  - In file installer/ansible/group_vars/dashboard.yml `enable_dashboard: true`
  - In file installer/ansible/group_vars/common.yml `host_ip : <User's IP address, eg. 127.0.0.1>`  
  - **[Click here](#configure-soda-on-premise-installation) for other supported configuration details**   
---

#### Enable Strato
Strato installs SODA Multicloud only.
- Enable following configurations  
  - In file installer/ansible/group_vars/gelato.yml  update the value  `enable_gelato : true`.
  - In file installer/ansible/group_vars/common.yml `host_ip : <User's IP address, eg. 127.0.0.1>`  
  - In file installer/ansible/group_vars/dashboard.yml `enable_dashboard: true`  **OR**
  - In file installer/ansible/group_vars/strato-ui.yml `enable_strato_ui: true`    
  - **[Click here](#enable-storage-service-plans-in-multicloud) for other supported configuration details**
---

### Run SODA Installer
Run SODA installer ansible playbook to start the deployment

Check if the hosts can be reached

```bash  
sudo -E env "PATH=$PATH" ansible all -m ping -i local.hosts
```

```bash
sudo -E env "PATH=$PATH" ansible-playbook site.yml -i local.hosts
# You can use the -vvv or -vv option to enable verbose display and debug mode.
[verbosity level: -vv < -vvv]
sudo -E env "PATH=$PATH" ansible-playbook site.yml -i local.hosts -vvv
```

SODA ansible installer supports installation using tags. To install a particular service use the playbook as follows
```bash
# This installs only delfin
sudo -E env "PATH=$PATH" ansible-playbook site.yml -i local.hosts -vvv --tags delfin
```
Supported tags: `keystone`, `hotpot`, `dock`, `delfin`, `srm_toolchain`, `gelato`, `sushi`, `dashboard`, `orchestration`

---  

### Enable SODA Dashboard (optional)


Update the file `installer/ansible/group_vars/dashboard.yml` and change the value of `enable_dashboard` to `true`  

```bash
# Install dashboard (true/false)
enable_dashboard: true

```  

{{% notice info %}}
  Starting with the Okinawa release of SODA two new user interfaces can be installed; Delfin UI and Strato UI. These allows users to install only those components required for the respective projects. The SODA Dashboard can be installed alongside these user interfaces. The features are currently the same.
  Users who wish to test Terra features will have to use the SODA Dashboard. Users who wish to test Strato and Delfin features can use the SODA Dashboard or the respective independent UI.
{{% /notice %}}  

--- 


#### Enable Storage Service Plans in MultiCloud

SODA Multi-cloud essentially allows users to register cloud storage backends, create buckets and upload objects.  
This process can be abstracted from the end users. SODA Multi-cloud now supports Storage Service Plans.  With this an admin can create Storage Service Plans and assign them to particular tenants and attach storage backends. Using Storage Service Plans abstracts the actual cloud storage backend from the end user and they will only see the service plan name assigned to their tenants. To enable storage service plans Update the file `ansible/group_vars/common.yml` and change the value of `enable_storage_service_plans` to `true`.

```bash
enable_storage_service_plans: true
```
For more information on how to use SSP you can check out the [user guide](/guides/user-guides/multi-cloud/storage-service-plan)

---  

### Enable Strato UI (optional)

Starting with the Okinawa release (v1.9.0) of SODA a separate user interface is available to experience the SODA Strato project. 
This project is called the Strato UI and can be enabled by updating the file `installer/ansible/group_vars/strato-ui.yml` and change the value of `enable_strato_ui` to `true`  
The Strato UI console is served on port 9003. This can be changed in the same config file.

```bash
enable_strato_ui: true

strato_ui_port: 9003
```  

{{% notice info %}}
  Strato UI requires a working Strato installation and the SODA Keystone authentication to be installed. 
{{% /notice %}}  

---
#### Multi-Cloud installation in High Availability (HA) Mode.
The default SODA installation of the multi-cloud project is on a single node (the same node is used for all projects).  
To install SODA Multi-Cloud in HA mode please refer to the [Multi-Cloud HA installation guide](https://docs.sodafoundation.io/soda-gettingstarted/multicloud-ha-installation-using-ansible/)

---
#### Enable Orchestration installation (optional)

Update the file `ansible/group_vars/orchestration.yml` and change the value of `enable_orchestration` to `true`

```bash
# Install Orchestration Manager (true/false)
enable_orchestration: true
```
--- 

### Configure SODA On-premise installation


**Enable CSI Integration**

If you want to integrate SODA hotpot with k8s csi, please modify nbp_plugin_type to csi in `group_vars/sushi.yml`

```bash
# 'hotpot_only' is the default integration way, but you can change it to 'csi'
# or 'flexvolume'
nbp_plugin_type: hotpot_only
```

**LVM**

If lvm is chosen as storage backend, modify `group_vars/osdsdock.yml:`

```bash
enabled_backends: lvm
```

**NFS**

If nfs is chosen as storage backend, modify `group_vars/osdsdock.yml:`

```bash
enabled_backends: nfs
```

**ceph**

If ceph is chosen as storage backend, modify `group_vars/osdsdock.yml:`

```bash
enabled_backends: ceph # Change it according to the chosen backend. Supported backends include 'lvm', 'ceph', and 'cinder'.
```


Configure `group_vars/ceph/all.yml` with an example below:

```bash
ceph_origin: repository
ceph_repository: community
ceph_stable_release: luminous # Choose luminous as default version
public_network: "192.168.3.0/24" # Run 'ip -4 address' to check the ip address
cluster_network: "{{ public_network }}"
monitor_interface: eth1 # Change to the network interface on the target machine
devices: # For ceph devices, append ONE or MULTIPLE devices like the example below:
  #- '/dev/sda' # Ensure this device exists and available if ceph is chosen
  #- '/dev/sdb'  # Ensure this device exists and available if ceph is chosen
osd_scenario: collocated
```

**cinder**

If cinder is chosen as storage backend, modify `group_vars/osdsdock.yml:`

```bash
enabled_backends: cinder # Change it according to the chosen backend. Supported backends include 'lvm', 'ceph', and 'cinder'

# Use block-box install cinder_standalone if true, see details in:
use_cinder_standalone: true
```

Configure the auth and pool options to access cinder in `group_vars/cinder/cinder.yaml`. Do not need to make additional configure changes if using cinder standalone.

**NetApp NAS**

If NetApp NAS is chosen as storage backend, modify `group_vars/osdsdock.yml`

```bash
enable_backends: netapp_ontap_nas
```

Configure `ansible/group_vars/netapp/ontap/ontap_nas.yaml` with an example below. (Check the comments in the script below):

```bash
backendOptions:
  version: 1
  username: "username"                 # USERNAME of the DATA ONTAP cluster access
  password: "password"                 # PASSWORD of the DATA ONTAP Cluster access
  storageDriverName: "ontap-nas"
  managementLIF: "1.2.3.4"             # This should be the IP ADDRESS of the DATA ONTAP Cluster
  dataLIF: "1.2.3.5"                   # This should be the IP ADDRESS of the NETAPP SVM NFS Server 
  svm: "soda-svm"                      # Name of the SVM which has above NFS server associated
pool:
  soda-pool:                           # Change "soda-pool" to the name of the aggregate associated with above SVM
    storageType: file
    availabilityZone: default
    multiAttach: true
    extras:
      dataStorage:
        provisioningPolicy: Thin
        compression: false
        deduplication: false
        storageAccessCapability:
          - Read
          - Write
          - Execute
      ioConnectivity:
        accessProtocol: nfs
        maxIOPS: 7000000
        maxBWS: 600
        minIOPS: 1000000
        minBWS: 100
        latency: 100
      advanced:
        diskType: SSD
        latency: 5ms
```

--- 

### Configure Delfin Installation
Open the file `group_vars/delfin.yml`.  
To enable the Prometheus or Kafka Exporter in delfin change the value of `performance_exporters` to `PerformanceExporterPrometheus` or `PerformanceExporterKafka` or a comma separated list, if both.

```
# Both Prometheus and Kafka exporters enabled
performance_exporters: PerformanceExporterPrometheus, PerformanceExporterKafka

# Prometheus exporter only
performance_exporters: PerformanceExporterPrometheus 

# Kafka exporter only
performance_exporters: PerformanceExporterKafka
```

To enable delfin to push alerts to Alertmanager change the value of `alert_exporters`
```
alert_exporters: AlertExporterPrometheus
```

The performance collection interval for Delfin can be set here. This sets the interval after which the metrics are collected from the actual storage device by Delfin. By default this is set to 900 seconds (15 minutes). This means Delfin will collect metrics from the storage devices every 15minutes.  
```
# Configurable Perf collection interval in seconds
performance_collection_interval: 900
```
The Kafka or Prometheus exporters endpoints can be configured here
In case of the Prometheus exporter, the dir `/var/lib/delfin/metrics` will be used by Delfin to save the file with time series data for all the resources to be scraped by Promtheus. 
```
# Exporter configurations for Kafka
delfin_exporter_kafka_ip: 'localhost'
delfin_exporter_kafka_port: 9092
delfin_exporter_kafka_topic: 'delfin-kafka'

# Exporter configurations for Prometheus
delfin_exporter_prometheus_ip: 0.0.0.0
delfin_exporter_prometheus_port: 8195
delfin_exporter_prometheus_metrics_dir: '/var/lib/delfin/metrics'
```

The delfin Alertmanager exporter endpoint can be configured here

```
#Exporter configurations for Alert Manager
delfin_exporter_alertmanager_host: 'localhost'
delfin_exporter_alertmanager_port: 9093
```
--- 

### Configure SRM Toolchain installation
Delfin produces metrics which can be consumed by any of the exporters that are supported. Currently Delfin supports the Prometheus and Kafka exporters.
The SRM Toolchain is required to view the metrics and visualization in the SODA Dashboard.\  
Installing the SRM toolchain will install Prometheus, AlertManager and Grafana versions as per the configuration below and can be changed. 

```
install_srm_toolchain: true

prometheus_image_tag: v2.23.0
prometheus_port: 9090

alertmanager_image_tag: v0.21.0
alertmanager_port: 9093

grafana_image_tag: 7.3.5
grafana_port: 3000
```
{{% notice warning %}}

**Please note this will install the SRM Toolchain as docker containers.** <br />
**If you already have any of the above running then please make the appropriate changes to the docker container name and ports in the file `ansible/srm-toolchain/docker-compose.yml`.**

{{% /notice %}}

---  

### Enable Delfin UI (optional)

Starting with the Okinawa release (v1.9.0) of SODA a separate user interface is available to experience the SODA Delfin project. 
This project is called the Delfin UI and can be enabled by updating the file `installer/ansible/group_vars/delfin-ui.yml` and change the value of `enable_delfin_ui` to `true`  
The Delfin UI console is served on port 9001. This can be changed in the same config file.

```bash
enable_delfin_ui: true

delfin_ui_port: 9001
```  

{{% notice info %}}
  Delfin UI requires a working Delfin installation and the SRM toolchain to be installed. 
{{% /notice %}}  


--- 

### How to test SODA On Premise (Hotpot)

Configure the SODA projects environment variables required for CLI as well as Dashboard access as below:

```bash
sudo cp /opt/opensds-hotpot-linux-amd64/bin/osdsctl /usr/local/bin/

export OPENSDS_ENDPOINT=http://{your_real_host_ip}:50040
export OPENSDS_AUTH_STRATEGY=keystone
export OS_AUTH_URL=http://{your_real_host_ip}/identity
export OS_USERNAME=admin
export OS_PASSWORD=opensds@123
export OS_TENANT_NAME=admin
export OS_PROJECT_NAME=admin
export OS_USER_DOMAIN_ID=default

osdsctl pool list # Check if the pool resource is available
```

#### Volume creation steps

Create a default profile

```bash 
osdsctl profile create '{"name": "default_block", "description": "default policy", "storageType": "block"}'
```
Create a volume:
```bash
osdsctl volume create 1 --name=test-001
```
List all volumes:
```bash
osdsctl volume list
```
Delete the volume:
```bash
osdsctl volume delete <your_volume_id>
```

#### Fileshare creation steps

Create a default_fileshare profile

```bash
osdsctl profile create '{"name":"default_fileshare", "description":"default policy for fileshare", "storageType":"file"}'
```

Create a Fileshare

```bash
osdsctl fileshare create 1 -n "test_fileshare" -p <profile_id>
```

List all fileshare
```bash
osdsctl fileshare list
```
Delete the Fileshare
```bash
osdsctl fileshare delete <fileshare id>
```

### SODA Dashboard UI

SODA Dashboard UI is available at `http://{your_host_ip}:8088`, please login to the dashboard using the default admin credentials: `admin/opensds@123.` Create `tenant`, `user`, and `profiles` as admin. Multi-Cloud and Delfin are also supported by dashboard.


### Things to Note

{{% notice note %}}
**_To use the multicloud service, an AK/SK must be generated before anything else. To do this you can follow the steps below:_**  <br />
1. Go to AK/SK Management<br />
2. Click on Add AK/SK button.<br />
3. Save the file (Do not forget to save this file and keep it safe.)<br />
{{% /notice %}}


{{% notice note %}}
**_To generate Access Key , Secret Key using REST APIs, follow the link below:_**
 AK/SK Generation using APIs can be found [here](/guides/user-guides/multi-cloud/aksk/ak-sk-using-api/)
{{% /notice %}}

{{% notice info %}}
**_To use the Block and File service, respective profile must be created before using these services. To do this you can follow the steps below:_**  <br />
1. Go to Profiles<br />
2. Click on Create button.<br />
3. Enter the details and select the Storage type as Block or File. <br />
4. Create one profile for Block type and  name it `default_block`.<br />
5. Create one profile for File type and  name it `default_file`.<br />
6. Save the profile and select it when you are creating a new volume or file share.<br />
7. Make sure you enable the snapshot policy and replication policy in the profile if you intend to create either.<br />
{{% /notice %}}

Logout of the dashboard as admin and login the dashboard again as a non-admin user to manage storage resources.

---

### How to uninstall SODA including purge and clean
Run SODA installer ansible playbook to clean the environment
``` bash
ansible-playbook clean.yml -i local.hosts
# You can use the -vvv option to enable verbose display and debug mode.
ansible-playbook clean.yml -i local.hosts -vvv
```

SODA ansible installer supports uninstallation using tags. To uninstall a particular service use the playbook as follows
```bash
#This uninstalls only delfin
ansible-playbook clean.yml -i local.hosts -vvv --tags delfin
```
Supported tags: `keystone`, `hotpot`, `dock`, `delfin`, `srm_toolchain`, `gelato`, `sushi`, `dashboard`, `orchestration`


Run ceph-ansible playbook to clean ceph cluster if ceph is deployed

```bash
cd /opt/ceph-ansible
sudo ansible-playbook infrastructure-playbooks/purge-cluster.yml -i ceph.hosts
```
In addition, clean up the logical partition on the physical block device used by ceph, using the fdisk tool.

Remove ceph-ansible source code (optional)
```bash
sudo rm -rf /opt/ceph-ansible
```
---
