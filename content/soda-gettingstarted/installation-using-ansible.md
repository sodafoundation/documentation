---
title: Installation Guide using Ansible
description: "This document describes how to install SODA projects in a local cluster with detailed configuration options. These steps will help you to enable / disable projects. After installation using these steps, you can get the features of all the enabled projects. You can test either through SODA Dashboard UI or CLI"
weight: 40
---
This document describes how to install SODA projects in a local cluster with detailed configuration options. These steps will help you to enable / disable projects. After installation using these steps, you can get the features of all the enabled projects. You can test either through SODA Dashboard UI or CLI

`Hereafter, Hotpot refers to API, Controller and Dock projects`

{{% notice info %}}
**Ubuntu 16.04 support for SODA is deprecated as of SODA Jerba release v1.4.0.** <br />
**If you have a requirement to install SODA on Ubuntu 16.04, please contact us on slack and we will try to help with the setup.**
{{% /notice %}}

{{% notice info %}}
**Ubuntu 20.04 support for SODA is added as experimental in Lamu v1.6.0 release through branch `ubuntu2004-experimental`.** <br />
**If you have a requirement to install SODA on Ubuntu 20.04, please [refer](https://github.com/sodafoundation/installer/tree/ubuntu2004-experimental) or contact us on slack and we will try to help with the setup.**
{{% /notice %}}

---

### Pre-requisites
- SODA installation is tested on `Ubuntu 18.04`. 
- `root` user is REQUIRED before the installation work starts.

#### Install following packages:

```bash
apt-get update && apt-get install -y git make curl wget libltdl7 libseccomp2 libffi-dev gawk
```
---

#### Install docker:


##### For Ubuntu 18.04

```bash
wget https://download.docker.com/linux/ubuntu/dists/bionic/pool/stable/amd64/docker-ce_18.06.1~ce~3-0~ubuntu_amd64.deb
```

```bash
dpkg -i docker-ce_18.06.1~ce~3-0~ubuntu_amd64.deb
```
---
####  Install docker-compose:

```bash
curl -L "https://github.com/docker/compose/releases/download/1.23.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
```
---
####  Install golang

**golang 1.13.x is supported. To install golang 1.13.9, please follow these steps**

```bash
wget https://storage.googleapis.com/golang/go1.13.9.linux-amd64.tar.gz
tar -C /usr/local -xzf go1.13.9.linux-amd64.tar.gz
echo 'export PATH=$PATH:/usr/local/go/bin' >> /etc/profile
echo 'export GOPATH=$HOME/gopath' >> /etc/profile
source /etc/profile
```
`Check if golang exists`
```bash
go version
```
***

### Download SODA Installer code
```bash
git clone https://github.com/sodafoundation/installer.git
cd installer/ansible
# Checkout the required version. For example, to checkout v1.6.0 follow
git checkout v1.6.0
```

{{% notice note %}}
Checkout the latest stable release. Current stable release: [Lamu (v1.6.0)](https://github.com/sodafoundation/soda/releases/tag/v1.6.0). If you want to get the master branch of all components, you can skip this step. (Master may not be stable or tested fully)
{{% /notice %}}

#### Install ansible

This step is needed to install ansible version 2.5.1 for Ubuntu 18.04 which is required for the "include_tasks" ansible command.

```bash
chmod +x ./install_ansible.sh && ./install_ansible.sh
ansible --version # Ensure Ansible version 2.5.1 for Ubuntu 18.04.
```
--- 

### Configure SODA installer and environment variables

A SODA release conists of various projects which have their own release cycles and versions.
To install SODA Projects and enable the different features, variables have to be modified in the respective files as below:

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
In the same `group_vars/common.yml` file, modify the `deploy_project` variable to select the projects to install. 
Currently the `deploy_project` variable takes `all`, `hotpot` and `gelato` as values. By default it is set to `all`.  
`all` installs SODA On Premise and SODA Multicloud (gelato).  
`hotpot` installs SODA On Premise only.  
`gelato` installs SODA Multicloud only.  

```bash
# This field indicates which project should be deploy
# 'hotpot', 'gelato' or 'all'
deploy_project: all  #all refers to hotpot + gelato
```
**_Note: Delfin and other member projects will be added shortly._**

---
#### Enable Delfin installation
delfin (Dolphin in Spanish!), the SODA Infrastructure Manager project is an open source project to provide unified, intelligent and scalable resource management, alert and performance monitoring. It covers the resource management of all the backends & other infrastructures under SODA deployment. It also provides alert management and metric data (performance/health) for monitoring and further analysis.

To install Delfin, update the file `group_vars/delfin.yml` and change the value of `enable_delfin` to `true`

```bash
# Install delfin (true/false)
enable_delfin: true
```

---

#### Enable SRM Toolchain installation (optional)  
Delfin produces metrics which can be consumed by any of the exporters that are supported. Currently Delfin supports the Prometheus and Kafka exporters.
The SRM Toolchain is required to view the metrics and visualization in the SODA Dashboard.  
Update the file `ansible/group_vars/srm-toolchain.yml` and change the value of `install_srm_toolchain` to `true`.  
If this value is set to false then the metrics and visualization will not be available using SODA Dashboard. 

```
install_srm_toolchain: true
```
---

#### Enable Storage Service Plans in multi-cloud (optional)

SODA Multi-cloud essentially allows users to register cloud storage backends, create buckets and upload objects.  
This process can be abstracted from the end users. SODA Multi-cloud now supports Storage Service Plans.  With this an admin can create Storage Service Plans and assign them to particular tenants and attach storage backends. Using Storage Service Plans abstracts the actual cloud storage backend from the end user and they will only see the service plan name assigned to their tenants. To enable storage service plans Update the file `ansible/group_vars/common.yml` and change the value of `enable_storage_service_plans` to `true`.

```bash
enable_storage_service_plans: true
```
For more information on how to use SSP you can check out the [user guide](/guides/user-guides/multi-cloud/storage-service-plan)

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

To enable delfin to push alerts to alert manager change the value of `alert_exporters`
```
alert_exporters: AlertExporterPrometheus
```

The performance collection interval for Delfin can be set here. This sets the interval after which the metrics are collected from the actual storage device by Delfin. By default this is set to 900 seconds (15 minutes). This means Delfin will collect metrics from the storage devices every 15minutes.  
```
# Configurable Perf collection interval in seconds
performance_collection_interval: 900
```
The Kafka or Prometheus exporters endpoints can be configured here
In case of the Prometheus exporter, the dir `/var/lib/delfin/metrics` will be used by Delfin to save the file with time series data for all the resources to be scraped by promtheus. 
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

The delfin alert manager exporter endpoint can be configured here

```
#Exporter configurations for Alert Manager
delfin_exporter_alertmanager_host: 'localhost'
delfin_exporter_alertmanager_port: 9093
```
--- 

### Configure SRM Toolchain installation

Installing the SRM toolchain will install Prometheus, alert Manager and Grafana versions as per the configuration below and can be changed. 

```
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


### Install SODA
Run SODA installer ansible playbook to start the deployment

Check if the hosts can be reached

```bash
ansible all -m ping -i local.hosts
```

```bash
ansible-playbook site.yml -i local.hosts
# You can use the -vvv or -vv option to enable verbose display and debug mode.
[verbosity level: -vv < -vvv]
ansible-playbook site.yml -i local.hosts -vvv
```

SODA ansible installer supports installation using tags. To install a particular service use the playbook as follows
```bash
# This installs only delfin
ansible-playbook site.yml -i local.hosts -vvv --tags delfin
```
Supported tags: `keystone`, `hotpot`, `dock`, `delfin`, `srm_toolchain`, `gelato`, `sushi`, `dashboard`, `orchestration`

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
