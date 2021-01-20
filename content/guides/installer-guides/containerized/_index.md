---
title: How to Run Containerized SODA for Testing
menuTitle: Run Containerized SODA
description: "Here is a tutorial guiding users and new contributors to get familiar with SODA by installing a simple containerized local cluster"
weight: 60
tags: ['installer guide', 'containerized']
---
Here is a tutorial guiding users and new contributors to get familiar with [SODA](https://github.com/sodafoundation/soda) by installing a simple containerized local cluster. You can also use the ansible script to install automatically, see detail in [SODA Local Cluster Installation through ansible](/guides/installer-guides/using-ansible/).

### Pre-configuration
Before you start, some configurations are required:
```shell
export BackendType="sample" # 'sample' is the default option, currently also support 'lvm'

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
enabled_backends = $BackendType

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
```

If you choose `lvm` as backend, you need to make sure physical volume and volume group existed. Besides, you need to configure lvm driver.
```
sudo pvdisplay # Check if physical volume existed
sudo vgdisplay # Check if volume group existed

mkdir -p /etc/opensds/driver && sudo cat > /etc/opensds/driver/lvm.yaml <<OPENSDS_DRIVER_CONFIG_DOC
tgtBindIp: 127.0.0.1
tgtConfDir: /etc/tgt/conf.d
pool:
  {{ volume_group_name }}:
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
```

### SODA Service Installation
If you are a lazy one, just like me, you probably want to do this:(`docker-compose` required)
```
wget https://raw.githubusercontent.com/opensds/opensds/development/docker-compose.yml

docker-compose up -d
```

Or you can do this:
```
docker run -d --net=host -v /usr/share/ca-certificates/:/etc/ssl/certs quay.io/coreos/etcd:latest

docker run -d --net=host --privileged=true opensdsio/opensds-authchecker:latest

docker run -d --net=host -v /etc/opensds:/etc/opensds opensdsio/opensds-apiserver:latest

docker run -d --net=host -v /etc/opensds:/etc/opensds opensdsio/opensds-controller:latest

docker run -d --net=host --privileged=true -v /etc/opensds:/etc/opensds -v /dev/:/dev/ -v /run/:/run/:shared -v /etc/localtime:/etc/localtime:ro -v /lib/modules:/lib/modules:ro opensdsio/opensds-dock:latest

docker run -d --net=host opensdsio/dashboard:latest
```

If you are a smart guy, you probably need to configure your service ip and database endpoint:
```
export HostIP="your_real_ip"
docker run -d --net=host -v /usr/share/ca-certificates/:/etc/ssl/certs quay.io/coreos/etcd:latest \
 -name etcd0 \
 -advertise-client-urls http://${HostIP}:2379,http://${HostIP}:4001 \
 -listen-client-urls http://0.0.0.0:2379,http://0.0.0.0:4001 \
 -initial-advertise-peer-urls http://${HostIP}:2380 \
 -listen-peer-urls http://0.0.0.0:2380 \
 -initial-cluster-token etcd-cluster-1 \
 -initial-cluster etcd0=http://${HostIP}:2380 \
 -initial-cluster-state new

docker run -d --net=host --privileged=true --name=opensds-authchecker opensdsio/opensds-authchecker:latest

docker run -d --net=host -v /etc/opensds:/etc/opensds opensdsio/opensds-apiserver:latest /usr/bin/osdsapiserver --api-endpoint=0.0.0.0:50040 --db-endpoint=${HostIP}:2379,${HostIP}:2380

docker run -d --net=host -v /etc/opensds:/etc/opensds opensdsio/opensds-controller:latest /usr/bin/osdslet --api-endpoint=0.0.0.0:50040 --db-endpoint=${HostIP}:2379,${HostIP}:2380

docker run -d --net=host --privileged=true -v /etc/opensds:/etc/opensds -v /dev/:/dev/ -v /run/:/run/:shared -v /etc/localtime:/etc/localtime:ro -v /lib/modules:/lib/modules:ro opensdsio/opensds-dock:latest /usr/bin/osdsdock -logtostderr --api-endpoint=0.0.0.0:50050 --db-endpoint=${HostIP}:2379,${HostIP}:2380

docker run -d --net=host --env OPENSDS_AUTH_URL=http://${HostIP}/identity --env OPENSDS_HOTPOT_URL=http://${HostIP}:50040 OPENSDS_GELATO_URL=http://${HostIP}:8089 opensdsio/dashboard:latest
```

### Test

### SODA CLI tool
Download and configure cli tool.
```
wget https://github.com/opensds/opensds/releases/download/v0.6.0/opensds-hotpot-v0.6.0-linux-amd64.tar.gz
tar zxvf opensds-hotpot-v0.6.0-linux-amd64.tar.gz
cp opensds-hotpot-v0.6.0-linux-amd64/bin/* /usr/local/bin
chmod +x /usr/local/bin/osdsctl

export OPENSDS_ENDPOINT=http://127.0.0.1:50040
export OPENSDS_AUTH_STRATEGY=keystone
export OS_AUTH_URL=http://127.0.0.1/identity
export OS_USERNAME=admin
export OS_PASSWORD=opensds@123
export OS_TENANT_NAME=admin
export OS_PROJECT_NAME=admin
export OS_USER_DOMAIN_ID=default

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

#### List all volumes.
```
osdsctl volume list
```

#### Delete the volume.
```
osdsctl volume delete <your_volume_id>
```

### SODA Dashboard
SODA Dashboard is available at `http://{your_host_ip}:8088`, please login the dashboard using the default admin credentials: `admin/opensds@123`. Create `tenant`, `user`, and `profiles` as admin. Multi-Cloud service is also supported by dashboard.

Logout of the dashboard as admin and login the dashboard again as a non-admin user to manage storage resource:

#### Volume Service
* Create volume
* Create snapshot
* Expand volume size
* Create volume from snapshot
* Create volume group

After this is done, just enjoy it!