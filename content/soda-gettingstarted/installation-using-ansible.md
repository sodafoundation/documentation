---
title: Installation Using ansible
description: "This is a  guide for users and new contributors to install Local Cluster using ansible."
weight: 30
---
This document describes how to install SODA projects in a local cluster. These steps will help you to enable / disable projects. After installation using these steps, you can get the features of all the enabled projects. You can test either through SODA Dashboard UI or CLI

`Hereafter, Hotpot refers to API, Controller and Dock projects`

#### Pre-config (Ubuntu 16.04 or Ubuntu 18.04)
All the installation work is tested on `Ubuntu 16.04` and `Ubuntu 18.04`, please make sure you have installed the right one. Also `root` user is REQUIRED before the installation work starts.

<br /> Install following packages:

```bash
apt-get update && apt-get install -y git make curl wget libltdl7 libseccomp2 libffi-dev gawk
```
<br />Install docker:

```bash
wget https://download.docker.com/linux/ubuntu/dists/xenial/pool/stable/amd64/docker-ce_18.06.1~ce~3-0~ubuntu_amd64.deb
```
```bash
dpkg -i docker-ce_18.06.1~ce~3-0~ubuntu_amd64.deb
```
<br /> Install docker-compose:

```bash
curl -L "https://github.com/docker/compose/releases/download/1.23.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
```
<br /> Install golang
[golang 1.13.x is supported. To install golang 1.13.9, please follow these steps]

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
<br />It should be go1.13.9 linux/amd64

#### Download SODA installer code
```bash
git clone https://github.com/sodafoundation/installer.git
cd installer/ansible
git checkout v1.0.0
```
{{% notice warning %}}
Checkout the latest stable release. Current stable release: stable/elba. If you want to get the master branch of all components, you can skip this step. (Master may not be stable or tested fully)
{{% /notice %}}

<br /> Install ansible tool
<br />

This step is needed to upgrade ansible to version 2.4.2 which is required for the "include_tasks" ansible command.
<br />

```bash
chmod +x ./install_ansible.sh && ./install_ansible.sh
ansible --version # Ansible version 2.4.x is required.
```
<br />Configure SODA hotpot install variables:

<br /> Set HOST_IP environment variable

The `HOST_IP` environment variable has to be set to your local machine IP address

```bash
export HOST_IP={your_real_host_ip}
echo $HOST_IP 
```

You need to modify host_ip in `group_vars/common.yml`( Modify host_ip and change it to the actual machine IP of the host). For example, here the HOST_IP is set to 127.0.0.1 i.e. localhost. You can set it to <Strong>your real host ip</Strong> 
You can also specify which projects to deploy; only hotpot, only gelato or all. 
<br />

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
<Strong> LVM</Strong>
<br/>

If lvm is chosen as storage backend, modify `group_vars/osdsdock.yml:`<br />

```bash
enabled_backends: lvm
```
<Strong> NFS</Strong>
<br/>

If nfs is chosen as storage backend, modify `group_vars/osdsdock.yml:`<br/>

```bash
enabled_backends: nfs
```
<Strong>ceph</Strong>
<br/>

If ceph is chosen as storage backend, modify `group_vars/osdsdock.yml:`<br/>

```bash
enabled_backends: ceph # Change it according to the chosen backend. Supported backends include 'lvm', 'ceph', and 'cinder'.
```
<br />

Configure `group_vars/ceph/all.yml` with an example below:<br />

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
<Strong> cinder</Strong>
<br />

If cinder is chosen as storage backend, modify `group_vars/osdsdock.yml:`<br />

```bash
enabled_backends: cinder # Change it according to the chosen backend. Supported backends include 'lvm', 'ceph', and 'cinder'

# Use block-box install cinder_standalone if true, see details in:
use_cinder_standalone: true
```
<br />

Configure the auth and pool options to access cinder in `group_vars/cinder/cinder.yaml`. Do not need to make additional configure changes if using cinder standalone.<br />
<Strong>How to enable Telemetry installation</Strong>
<strong>NOTE</Strong> : Please ensure that you are using hotpot version >= v0.6.1.
<br />

Update the file `ansible/group_vars/telemetry.yml` and change the value of enable_telemetry_tools to true

```bash
# Do you need to install or clean up telemetry tools?
enable_telemetry_tools: false
```
<br /> How to enable Orchestration installation

<br />

Update the file `ansible/group_vars/orchestration.yml` and change the value of `enable_orchestration` to true

```bash
# Install Orchestration Manager (true/false)
enable_orchestration: false
```
<br /> How to enable `delfin` installation

<br />

Update the file `ansible/group_vars/delfin.yml` and change the value of `enable_delfin` to true

```bash
# Install delfin (true/false)
enable_delfin: true
```

<br /> Check if the hosts can be reached

```bash
ansible all -m ping -i local.hosts
```
<br /> Run SODA installer ansible playbook to start deploy

```bash
ansible-playbook site.yml -i local.hosts
# You can use the -vvv or -vv option to enable verbose display and debug mode.
[verbosity level: -vv < -vvv]
ansible-playbook site.yml -i local.hosts -vvv
```
#### How to test SODA projects cluster
<br />SODA projects 

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
<br /> Volume creation steps

Then create a default profile

```bash 
osdsctl profile create '{"name": "default", "description": "default policy", "storageType": "block"}'
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
<br /> Fileshare creation steps
Create a default profiles
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
<br />

SODA Dashboard UI is available at `http://{your_host_ip}:8088`, please login the dashboard using the default admin credentials: `admin/opensds@123.` Create `tenant`, `user`, and `profiles` as admin. Multi-Cloud service is also supported by dashboard.
<br />

Logout of the dashboard as admin and login the dashboard again as a non-admin user to manage storage resource:
##### Volume Service

1 Create volume.<br />
2 Create snapshot.<br />
3 Expand volume size.<br />
4 Create volume from snapshot.<br />
5 Create volume group.

##### FileShare service

1 Create fileshare.<br />
2 Create snapshot.<br />
3 Set access permission on fileshare (ip based access permissions are allowed).
##### Multi Cloud Service

1 Register object storage backend.<br />
2 Create bucket.<br />
3 Upload object.<br />
4 Download object.<br />
5 Migrate objects based on bucket across cloud.<br />
6 Create lifecycle for buckets.
# How to purge and clean SODA projects cluster
<br />Run SODA installer ansible playbook to clean the environment
``` bash
ansible-playbook clean.yml -i local.hosts
# You can use the -vvv option to enable verbose display and debug mode.
ansible-playbook clean.yml -i local.hosts -vvv
```
<br />Run ceph-ansible playbook to clean ceph cluster if ceph is deployed

```bash
cd /opt/ceph-ansible
sudo ansible-playbook infrastructure-playbooks/purge-cluster.yml -i ceph.hosts
```
In addition, clean up the logical partition on the physical block device used by ceph, using the fdisk tool.

<br />Remove ceph-ansible source code (optional)
```bash
sudo rm -rf /opt/ceph-ansible
```
