---
title: Guide for installing SODA on Red Hat Enterprise Linux
menuTitle: Install on Red Hat
description: "This document describes how to install SODA projects in a local cluster on Red Hat Enterprise Linux"
weight: 70
tags: ['installer guide', 'rhel']
---
### Install SODA in Redhat 7.5 manually

### Pre-config (Redhat 7.5)
All the installation work is tested on `Redhat 7.5`, please make sure you have installed the right one. Also `root` user is suggested before the installation work starts.

* packages

Install following packages:
```bash
yum install librados2-devel
yum install librbd1-devel
```
* etcd

Install etcd:
```bash
wget https://github.com/etcd-io/etcd/releases/download/v3.3.9/etcd-v3.3.9-linux-amd64.tar.gz
cp etcd-v3.3.9-linux-amd64/etcd* /usr/local/bin/
```

### Install SODA 


#### Download binary
```
# OpenSDS
wget https://github.com/opensds/opensds/releases/download/v0.5.0/opensds-hotpot-v0.5.0-linux-amd64.tar.gz 
tar xvf opensds-hotpot-v0.5.0-linux-amd64.tar.gz 
cp opensds-hotpot-v0.5.0-linux-amd64/bin/* /usr/local/bin 
```

#### Create LVM volume group


vi  create_vg.sh 
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

Then, execute command
```
chmod +x create_vg.sh
./create_vg.sh
```

#### Configure OpenSDS

We assume that the IP address of your Redhat linux is "192.168.0.2".

```
mkdir -p /etc/opensds/driver/
```

vi /etc/opensds/opensds.conf
```
[osdslet]
api_endpoint = 0.0.0.0:50040
graceful = True
log_file = /var/log/opensds/osdslet.log
socket_order = inc
auth_strategy = noauth

[osdsdock]
api_endpoint = 192.168.0.2:50050
log_file = /var/log/opensds/osdsdock.log
# Choose the type of dock resource, only support 'provisioner' and 'attacher'.
dock_type = provisioner
# Specify which backends should be enabled, sample,ceph,cinder,lvm and so on.
enabled_backends = lvm

[database]
endpoint = 192.168.0.2:2479,192.168.0.2:2480
driver = etcd

[lvm]
name = lvm backend 
description = This is a lvm backend service
driver_name = lvm
config_path = /etc/opensds/driver/lvm.yaml
```

vi /etc/opensds/driver/lvm.yaml
```
tgtBindIp: 192.168.0.2
pool:
  vg001:
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

#### Startup service.
```
mkdir /opt/opensds/etcd/ -p
nohup etcd --advertise-client-urls http://192.168.0.2:2479 --listen-client-urls http://192.168.0.2:2479 --listen-peer-urls http://192.168.0.2:2480 --data-dir /opt/opensds/etcd/data --debug &
osdslet --daemon
osdsdock --daemon
```


### How to test SODA cluster

**SODA CLI**  
Firstly configure SODA CLI tool:
```bash
export OPENSDS_ENDPOINT=http://192.168.0.2:50040
export OPENSDS_AUTH_STRATEGY=noauth

osdsctl pool list # Check if the pool resource is available
```

Then create a default profile:
```
osdsctl profile create '{"name": "default", "description": "default policy"}'
```

Create a volume:
```
osdsctl volume create 1 --name=test-001
```

List all volumes:
```
osdsctl volume list
```

Delete the volume:
```
osdsctl volume delete <your_volume_id>
```

