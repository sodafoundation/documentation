---
title: Quick Start Guide
description: "This is a quickstart guide for users and new contributors to get familiar with SODA Foundation by installing a simple containerized local cluster. It also gives the install steps for old OpenSDS versions"
weight: 20
---

This is a quickstart guide for users and new contributors to try and get familiar with [SODA Foundation Release](https://github.com/sodafoundation/releases) and its [projects](https://github.com/sodafoundation). It will help to test the SODA Releases directly from binaries with minimum configurations or settings.

***Note**: *Currently this document also provides the information to install old OpenSDS releases and try. Soon, the support for old opensds releases will be removed.**

If you are interested to have more magement control on the installaton cofigurations OR you are a developer on SODA Foundation projects, you can refer a detailed installation guide [here](/soda-gettingstarted/installation)

## Quick Installation and experience of SODA releases
### Install SODA v1.0.0 Faroe Release Jun 2020
Quick installation from SODA Faroe Release:

 - **Prerequisite**
	 - OS: Ubuntu 16.04 or Ubuntu 18.04
	 - `root` user rights is REQUIRED 
    -   Make sure the following packages are installed or use the steps to install them.
    - Install Basic Dependency:
	    - apt-get update && apt-get install -y git make curl wget libltdl7 libseccomp2 libffi-dev gawk
    - Install Docker
	    - wget **[https://download.docker.com/linux/ubuntu/dists/xenial/pool/stable/amd64/docker-ce_18.06.1~ce~3-0~ubuntu_amd64.deb](https://download.docker.com/linux/ubuntu/dists/xenial/pool/stable/amd64/docker-ce_18.06.1~ce~3-0~ubuntu_amd64.deb)**
	    - dpkg -i docker-ce_18.06.1ce3-0~ubuntu_amd64.deb
    - Install docker-compose:
	    -   curl -L "https://github.com/docker/compose/releases/download/1.23.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
		-   chmod +x /usr/local/bin/docker-compose
    -   Required golang version: 1.13.x
	    -   Run following command `go version` and check the version
	    -   If the required version is not installed on the system, install golang,1.13.9 using:
		   - wget **[https://storage.googleapis.com/golang/go1.13.9.linux-amd64.tar.gz](https://storage.googleapis.com/golang/go1.13.9.linux-amd64.tar.gz)**
		- tar -C /usr/local -xzf go1.13.9.linux-amd64.tar.gz
		- echo 'export PATH=$PATH:/usr/local/go/bin' >> /etc/profile
		- echo 'export GOPATH=$HOME/gopath' >> /etc/profile
		- source /etc/profile

 - **Get and Install Release Binaries**
	 - wget  **[https://github.com/sodafoundation/installer/releases/download/v1.0.0/installer-v1.0.0.tar.gz](https://github.com/sodafoundation/installer/releases/download/v1.0.0/installer-v1.0.0.tar.gz)**
 **OR** Download the installer binaries from  
 [https://github.com/sodafoundation/installer/releases/tag/v1.0.0](https://github.com/sodafoundation/installer/releases/tag/v1.0.0)

	 - tar xvzf installer-v1.0.0.tar.gz
	 - cd installer-v1.0.0/ansible/
	 - chmod +x ./install_ansible.sh && ./install_ansible.sh
	 - ansible --version # Ansible version 2.4.x is required
	 - The HOST_IP need to be set to the real_host_ip of your host (ex: 192.168.1.10 or 127.0.0.1 for localhost)
		 - export HOST_IP = <your_real_host_ip>
		 - vim group_vars/common.yml # Modify `host_ip` address if needed

 - **Run the installer**
	 - ansible-playbook site.yml -i local.hosts
	 - Note: If you want to clean up and test again, run
		 - ansible-playbook clean.yml -i local.hosts -vvv
	 - and then run:
		 - ansible-playbook site.yml -i local.hosts
 -   **How to do a quick test**
		- Open Your Browser and use the http://< actual host ip>:8088 to access the SODA Dashboard
    (This IP should be the IP Address of the host if you have updated the config file) Ex: [http://127.0.0.1:8088](http://127.0.0.1:8088)
  
	 - Use admin/opensds@123 credentials to login
     -   You will login to the UI Dashboard and you can verify the features through various menu options


### Install SODA v0.20.0 Elba Release Apr 2020
 - Elba Release (First Release of SODA) : Refer the "How to use the Release" section of [Elba Release Notes](https://github.com/sodafoundation/releases/releases/tag/v0.20.0)
 

## How to install Older versions of OpenSDS releases
If you are interested to try old versions of opensds, please follow the below steps. However, please note that we are currently supporting SODA Fondation releases only. You have any queries, please discuss at #general slack channel of [soda foundation slack](https://sodafoundation.io/slack)

## Install OpenSDS  

```bash
chmod +x install_opensds.sh
./install_opensds.sh
```
where `install_opensds.sh` is  file below
```bash
#!/bin/bash -e

# Create file /etc/opensds/opensds.conf
mkdir -p /etc/opensds && sudo cat > /etc/opensds/opensds.conf <<OPENSDS_GLOABL_CONFIG_DOC
[osdsapiserver]
api_endpoint = 0.0.0.0:50040
auth_strategy = keystone
# If https is enabled, the default value of cert file
# is /opt/opensds-security/opensds/opensds-cert.pem,
# and key file is /opt/opensds-security/opensds/opensds-key.pem
https_enabled = False
beego_https_cert_file =
beego_https_key_file =
# Encryption and decryption tool. Default value is aes.
password_decrypt_tool = aes

[keystone_authtoken]
memcached_servers = 127.0.0.1:11211
signing_dir = /var/cache/opensds
cafile = /opt/stack/data/ca-bundle.pem
auth_uri = http://127.0.0.1/identity
project_domain_name = Default
project_name = service
user_domain_name = Default
password = opensds@123
# Whether to encrypt the password. If enabled, the value of the password must be ciphertext.
enable_encrypted = False
# Encryption and decryption tool. Default value is aes. The decryption tool can only decrypt the corresponding ciphertext.
pwd_encrypter = aes
username = opensds
auth_url = http://127.0.0.1/identity
auth_type = password

[osdslet]
api_endpoint = 127.0.0.1:50049

[osdsdock]
api_endpoint = 127.0.0.1:50050
# Choose the type of dock resource, only support 'provisioner' and 'attacher'.
dock_type = provisioner
# Specify which backends should be enabled, sample,ceph,cinder,lvm and so on.
enabled_backends = lvm

[sample]
name = sample
description = Sample Test
driver_name = sample

[lvm]
name = lvm
description = LVM Test
driver_name = lvm
config_path = /etc/opensds/driver/lvm.yaml
host_based_replication_driver = DRBD

[database]
endpoint = 127.0.0.1:2379,127.0.0.1:2380
driver = etcd
OPENSDS_GLOABL_CONFIG_DOC

# Create file /etc/opensds/driver/lvm.yaml
mkdir -p /etc/opensds/driver && sudo cat > /etc/opensds/driver/lvm.yaml <<OPENSDS_DRIVER_CONFIG_DOC
tgtBindIp: 127.0.0.1 # change tgtBindIp to your real host ip, run 'ifconfig' to check
tgtConfDir: /etc/tgt/conf.d
pool:
  opensds-volumes: # change pool name same to vg_name, but don't change it if you choose ceph backend
    storageType: block
    availabilityZone: default
    extras:
      dataStorage:
        provisioningPolicy: Thin
        isSpaceEfficient: false
      ioConnectivity:
        accessProtocol: iscsi
        maxIOPS: 7000000
        maxBWS: 600
      advanced:
        diskType: SSD
        latency: 5ms
OPENSDS_DRIVER_CONFIG_DOC

# Create lvm volume group by executing following commands
modprobe dm_thin_pool

function _create_lvm_volume_group {
    local vg=$1
    local size=$2

    local backing_file=/opt/opensds/opensds-volume.img
    mkdir /opt/opensds -p
    if ! sudo vgs $vg &> /dev/null ; then
        [[ -f $backing_file ]] || truncate -s $size $backing_file
        local vg_dev
        vg_dev=`sudo losetup -f --show $backing_file`

        if ! sudo pvs $vg_dev; then
            sudo pvcreate $vg_dev
        fi

        if ! sudo vgs $vg; then
            sudo vgcreate $vg $vg_dev
        fi
    fi
}

_create_lvm_volume_group opensds-volumes 10G

# Download policy.json file
wget -P /etc/opensds https://raw.githubusercontent.com/opensds/opensds-installer/stable/capri/conf/policy.json

# Download docker-compose file and bring up OpenSDS
wget https://raw.githubusercontent.com/opensds/opensds/stable/capri/docker-compose.yml

docker-compose up -d

```

The above script does following things to install SODA Foundation  

- Create OpenSDS configuration file `/etc/opensds/opensds.conf`  
- Create lvm backend configuration file `/etc/opensds/driver/lvm.yaml`  
- Create lvm volume group `opensds-volumes`  
- Download `/etc/opensds/policy.json` for Authorization  
- Download docker-compose.yml file and bring up OpenSDS docker containers  

## Test  

Either use OpenSDS CLI tool or OpenSDS dashboard for testing

### OpenSDS CLI tool

```bash
chmod +x setup_opensds.sh
source setup_opensds.sh
```
where `setup_opensds.sh` is file below
```bash
#!/bin/bash -e

if [ -f "/usr/local/bin/osdsctl" ]; then
  echo "osdsctl file exists"
else
  # Download OpenSDS CLI tool
  wget https://github.com/opensds/opensds/releases/download/v0.6.0/opensds-hotpot-v0.6.0-linux-amd64.tar.gz
  tar zxvf opensds-hotpot-v0.6.0-linux-amd64.tar.gz
  cp opensds-hotpot-v0.6.0-linux-amd64/bin/* /usr/local/bin
  chmod +x /usr/local/bin/osdsctl
fi

# Export environment variables for CLI
export OPENSDS_ENDPOINT=http://127.0.0.1:50040
export OPENSDS_AUTH_STRATEGY=keystone
export OS_AUTH_URL=http://127.0.0.1/identity
export OS_USERNAME=admin
export OS_PASSWORD=opensds@123
export OS_TENANT_NAME=admin
export OS_PROJECT_NAME=admin
export OS_USER_DOMAIN_ID=default

# Check if the pool resource is available
osdsctl pool list

# Create a default profile
osdsctl profile create '{"name": "default", "description": "default policy", "storageType": "block"}'
```

#### Create/List/Delete a volume using OpenSDS CLI
```bash
osdsctl volume create 1 --name=test-001
osdsctl volume list
osdsctl volume delete <your_volume_id>
```

### OpenSDS UI  

OpenSDS UI dashboard is available at `http://{your_host_ip}:8088`, please login the dashboard using the default admin credentials: `admin/opensds@123`. Create `tenant`, `user`, and `profiles` as admin. Multi-Cloud service is also supported by dashboard.

Logout of the dashboard as admin and login the dashboard again as a non-admin user to manage storage resource:

#### Use Volume Service UI for performing following OpenSDS operations
* Create volume
* Create snapshot
* Expand volume size
* Create volume from snapshot
* Create volume group
