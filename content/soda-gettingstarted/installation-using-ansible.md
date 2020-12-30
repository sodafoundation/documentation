---
title: Installation Guide using Ansible
description: "This document describes how to install SODA projects in a local cluster with detailed configuraiton options. These steps will help you to enable / disable projects. After installation using these steps, you can get the features of all the enabled projects. You can test either through SODA Dashboard UI or CLI"
weight: 40
---

# SODA Installer based on Ansible.
This document describes how to install SODA projects in a local cluster with detailed configuraiton options. These steps will help you to enable / disable projects. After installation using these steps, you can get the features of all the enabled projects. You can test either through SODA Dashboard UI or CLI

`Hereafter, Hotpot refers to API, Controller and Dock projects`

## Pre-config (Ubuntu 16.04 or Ubuntu 18.04)
All the installation work is tested on `Ubuntu 16.04` and `Ubuntu 18.04`, please make sure you have installed the right one. Also `root` user is REQUIRED before the installation work starts.

#### Install following packages:

```bash
apt-get update && apt-get install -y git make curl wget libltdl7 libseccomp2 libffi-dev gawk
```
#### Install docker:

##### For Ubuntu 16.04
```bash
wget https://download.docker.com/linux/ubuntu/dists/xenial/pool/stable/amd64/docker-ce_18.06.1~ce~3-0~ubuntu_amd64.deb
```
##### For Ubuntu 18.04
```bash
wget https://download.docker.com/linux/ubuntu/dists/bionic/pool/stable/amd64/docker-ce_18.06.1~ce~3-0~ubuntu_amd64.deb
```

```bash
dpkg -i docker-ce_18.06.1~ce~3-0~ubuntu_amd64.deb
```
####  Install docker-compose:

```bash
curl -L "https://github.com/docker/compose/releases/download/1.23.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
```
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


#### Download SODA installer code
```bash
git clone https://github.com/sodafoundation/installer.git
cd installer/ansible
# Checkout the required version. For example, to checkout v1.1.0 follow
git checkout v1.1.0
```
{{% notice warning %}}
Checkout the latest stable release. Current stable release: stable/faroe. If you want to get the master branch of all components, you can skip this step. (Master may not be stable or tested fully)
{{% /notice %}}

#### Install ansible tool

This step is needed to upgrade ansible to version 2.4.2 which is required for the "include_tasks" ansible command.

```bash
chmod +x ./install_ansible.sh && ./install_ansible.sh
ansible --version # Ansible version 2.4.x is required.
```
### Configure SODA hotpot install variables:

#### Set HOST_IP environment variable

The `HOST_IP` environment variable has to be set to your local machine IP address

```bash
export HOST_IP={your_real_host_ip}
echo $HOST_IP 
```

You need to modify host_ip in `group_vars/common.yml`( Modify host_ip and change it to the actual machine IP of the host). For example, here the HOST_IP is set to 127.0.0.1 i.e. localhost. You can set it to <Strong>your real host ip</Strong> 
You can also specify which projects to deploy; only hotpot, only gelato or all. 



```bash
# This field indicates local machine host ip
host_ip: 127.0.0.1
# This field indicates which project should be deploy
# 'hotpot', 'gelato' or 'all'
deploy_project: all  #all refers to hotpot + gelato
```
`If you want to integrate SODA hotpot with k8s csi, please modify nbp_plugin_type to csi in group_vars/sushi.yml:`
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

**How to enable Orchestration installation**


Update the file `ansible/group_vars/orchestration.yml` and change the value of `enable_orchestration` to true

```bash
# Install Orchestration Manager (true/false)
enable_orchestration: false
```

**How to enable `delfin` installation**

Update the file `ansible/group_vars/delfin.yml` and change the value of `enable_delfin` to true

```bash
# Install delfin (true/false)
enable_delfin: true
```

To enable the Prometheus or Kafka Exporter in delfin change the value of `performance_exporters` to `PerformanceExporterPrometheus` or `PerformanceExporterKafka` or a comma separated list if both.


```

performance_exporters: PerformanceExporterPrometheus, PerformanceExporterKafka

```

To enable delfin to push alerts to Alertmanager change the value of `alert_exporters`
```
alert_exporters: AlertExporterPrometheus
```

The Kafka or Prometheus exporters endpoints can be configured here

```
# Exporter configurations for Kafka
delfin_exporter_kafka_ip: 'localhost'
delfin_exporter_kafka_port: 9092
delfin_exporter_kafka_topic: 'delfin-kafka'

# Exporter configurations for Prometheus
delfin_exporter_prometheus_ip: 0.0.0.0
delfin_exporter_prometheus_port: 8195
delfin_exporter_prometheus_cache_file: '/var/lib/delfin/delfin_exporter.txt'
```

The delfin alertmanager exporter endpoint can be configured here

```
#Exporter configurations for Alert Manager
delfin_exporter_alertmanager_host: 'localhost'
delfin_exporter_alertmanager_port: 9093
```

**Enable SRM Toolchain installation**
The SRM Toolchain is required to view the metrics and visualization in the SODA Dashboard.
Update the file `ansible/group_vars/srm-toolchain.yml` and change the value of `install_srm_toolchain` to `true`
If this value is set to false then the metrics and visualization will not be available using SODA Dashboard. 

```
install_srm_toolchain: true
```

This will install Prometheus, AlertManager and Grafana versions as per the configuration below and can be changed. 

```
prometheus_image_tag: v2.23.0
prometheus_port: 9090

alertmanager_image_tag: v0.21.0
alertmanager_port: 9093

grafana_image_tag: 7.3.5
grafana_port: 3000
```
{{% notice warning %}}

Please note this will install the SRM Toolchain as docker containers. 
If you already have any of the above running then please make the appropriate changes to the docker container name and ports in the `ansible/srm-toolchain/docker-compose.yml`

{{% /notice %}}

Check if the hosts can be reached

```bash
ansible all -m ping -i local.hosts
```

Run SODA installer ansible playbook to start deploy

```bash
ansible-playbook site.yml -i local.hosts
# You can use the -vvv or -vv option to enable verbose display and debug mode.
[verbosity level: -vv < -vvv]
ansible-playbook site.yml -i local.hosts -vvv
```

SODA ansible installer supports installation using tags. To install a particular service use the playbook as follows
```bash
#This installs only delfin
ansible-playbook site.yml -i local.hosts -vvv --tags delfin
```
Supported tags: `keystone`, `hotpot`, `dock`, `delfin`, `srm_toolchain`, `gelato`, `sushi`, `dashboard`, `orchestration`

### How to test SODA projects cluster

Configure SODA projects env variable required for CLI as well as Dashboard access:
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

SODA Dashboard UI is available at `http://{your_host_ip}:8088`, please login the dashboard using the default admin credentials: `admin/opensds@123.` Create `tenant`, `user`, and `profiles` as admin. Multi-Cloud service is also supported by dashboard.

### Please Note
{{% notice info %}}
**_To use the multicloud service, an AK/SK must be generated before anything else. To do this you can follow the steps below:_**  <br />
1. Go to AK/SK Management<br />
2. Click on Add AK/SK button.<br />
3. Save the file (Do not forget to save this file and keep it safe.)<br />
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

Logout of the dashboard as admin and login the dashboard again as a non-admin user to manage storage resource:


### Volume Service

1. Create volume.
2. Create snapshot.
3. Expand volume size.
4. Create volume from snapshot.
5. Create volume group.

### FileShare service

1. Create fileshare.
2. Create snapshot.
3. Set access permission on fileshare (ip based access permissions are allowed).

### Multi Cloud Service

1 Register object storage backend.
2 Create bucket.
3 Upload object.
4 Download object.
5 Migrate objects based on bucket across cloud.
6 Create lifecycle for buckets.

## How to purge and clean SODA projects cluster
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
