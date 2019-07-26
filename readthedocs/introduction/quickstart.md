# Quick Start Guide

This is a quickstart guide for users and new contributors to get familiar with [OpenSDS](https://github.com/opensds/opensds) by installing a simple containerized local cluster. More detailed installation steps with full features is provided in [Installation Guide](installation.md)

## Pre-configuration
Ensure following configurations are added:
### 1. Create file /etc/opensds/opensds.conf as below
```ini
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
```

### 2. Create file /etc/opensds/driver/lvm.yaml as below
```yaml
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

```
### 3. Create lvm volume group by executing following commands
```bash
chmod +x create_vg.sh
./create_vg.sh
```
where `create_vg.sh` is file below
```bash
#!/bin/bash
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
modprobe dm_thin_pool
_create_lvm_volume_group opensds-volumes 10G
```
### 4. Download policy.json file to folder /etc/opensds 
```bash
wget -P /etc/opensds https://github.com/opensds/opensds-installer/blob/stable/capri/conf/policy.json
```
## OpenSDS Installation
Use `docker-compose` and bringup OpenSDS as below
```bash
wget https://raw.githubusercontent.com/opensds/opensds/development/docker-compose.yml

docker-compose up -d
```

## Test
Either use OpenSDS CLI tool or OpenSDS dashboard for testing
### 1. OpenSDS CLI tool
#### Download cli tool
```bash
wget https://github.com/opensds/opensds/releases/download/v0.6.0/opensds-hotpot-v0.6.0-linux-amd64.tar.gz
tar zxvf opensds-hotpot-v0.6.0-linux-amd64.tar.gz
cp opensds-hotpot-v0.6.0-linux-amd64/bin/* /usr/local/bin
chmod +x /usr/local/bin/osdsctl
```
#### Export environment variables for CLI
```bash
export OPENSDS_ENDPOINT=http://127.0.0.1:50040
export OPENSDS_AUTH_STRATEGY=keystone
export OS_AUTH_URL=http://127.0.0.1/identity
export OS_USERNAME=admin
export OS_PASSWORD=opensds@123
export OS_TENANT_NAME=admin
export OS_PROJECT_NAME=admin
export OS_USER_DOMAIN_ID=default
```
#### Check if the pool resource is available 
```bash
osdsctl pool list
```
#### Create a default profile
```bash
osdsctl profile create '{"name": "default", "description": "default policy", "storageType": "block"}'
```
#### Create/List/Delete a volume
```bash
osdsctl volume create 1 --name=test-001
osdsctl volume list
osdsctl volume delete <your_volume_id>
```
### 2. OpenSDS UI
OpenSDS UI dashboard is available at `http://{your_host_ip}:8088`, please login the dashboard using the default admin credentials: `admin/opensds@123`. Create `tenant`, `user`, and `profiles` as admin. Multi-Cloud service is also supported by dashboard.

Logout of the dashboard as admin and login the dashboard again as a non-admin user to manage storage resource:

#### Volume Service
* Create volume
* Create snapshot
* Expand volume size
* Create volume from snapshot
* Create volume group
