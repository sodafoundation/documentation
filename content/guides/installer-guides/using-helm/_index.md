---
title: Installation Guide using Helm
menuTitle: Using Helm
description: "This document describes how to install SODA projects in a local cluster with detailed configuration options. These steps will help you to enable / disable projects. After installation using these steps, you can get the features of all the enabled projects. You can test either through SODA Dashboard UI or CLI"
weight: 50
---
### Pre-requisites

**Ubuntu**  
version information:
```bash
root@proxy:~# cat /etc/issue
Ubuntu 16.04.2 LTS \n \l
```

**Environment packages**  
```bash
apt-get update && apt-get install -y gcc make libc6-dev socat gcc make libc-dev
apt-get install -y git curl wget libltdl7 libseccomp2 python-pip 
```

**Install Go (v1.12.1)**  
```bash
wget https://storage.googleapis.com/golang/go1.12.1.linux-amd64.tar.gz
tar -C /usr/local -zxvf go1.12.1.linux-amd64.tar.gz   
echo 'export PATH=$PATH:/usr/local/go/bin' >> /etc/profile  
echo 'export GOPATH=$HOME/gopath' >> /etc/profile  
source /etc/profile
```

**Docker**  
version information:
```bash
root@ubuntu:~# docker version
Client:
 Version:           18.06.1-ce
 API version:       1.38
 Go version:        go1.10.3
 Git commit:        e68fc7a
 Built:             Tue Aug 21 17:24:56 2018
 OS/Arch:           linux/amd64
 Experimental:      false

Server:
 Engine:
  Version:          18.06.1-ce
  API version:      1.38 (minimum version 1.12)
  Go version:       go1.10.3
  Git commit:       e68fc7a
  Built:            Tue Aug 21 17:23:21 2018
  OS/Arch:          linux/amd64
  Experimental:     false
```

You can install docker using these commands below:
```bash
wget https://download.docker.com/linux/ubuntu/dists/xenial/pool/stable/amd64/docker-ce_18.06.1~ce~3-0~ubuntu_amd64.deb
dpkg -i docker-ce_18.06.1~ce~3-0~ubuntu_amd64.deb 
```

### Kubernetes local cluster
You can startup `v1.14.0` k8s local cluster by executing commands blow:
```bash
cd $HOME && git clone https://github.com/kubernetes/kubernetes.git
cd $HOME/kubernetes && git checkout v1.14.0
make
echo alias kubectl='$HOME/kubernetes/cluster/kubectl.sh' >> /etc/profile
hack/install-etcd.sh
ENABLE_DAEMON=true ALLOW_PRIVILEGED=true FEATURE_GATES=VolumeSnapshotDataSource=true RUNTIME_CONFIG="storage.k8s.io/v1alpha1=true" LOG_LEVEL=5 hack/local-up-cluster.sh -O
```

Note: If there is some DNS problems with your Kubernetes cluster, please refer to [here](https://kubernetes.io/docs/tasks/administer-cluster/dns-debugging-resolution/) for debugging resolution.

### Helm Installation ###
* This will fetch the latest version of helm :
```
curl https://raw.githubusercontent.com/helm/helm/master/scripts/get >get_helm.sh
chmod 700 get_helm.sh
./get_helm.sh
helm init
```

### Ceph Installation
* Here we are creating only 1 ceph-osd node and Ceph luminous version ( For more details please refer [link](http://docs.ceph.com/ceph-ansible/master/)  )
* Clone Ceph repository  
    `cd $HOME && git clone -b stable-3.0 https://github.com/ceph/ceph-ansible.git`

* Configure `ceph-ansible/group_vars/all.yml` by appending below portion:

    ```
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
* Install Ansible and Ceph
    ```
    # Download ansible tool
    cd $HOME && git clone https://github.com/opensds/opensds-installer.git
    cd opensds-installer/ansible
    chmod +x ./install_ansible.sh && ./install_ansible.sh

    # Install Ceph using ansible tool
    cd $HOME && cp opensds-installer/ansible/group_vars/ceph/ceph.hosts ceph-ansible/
    ansible-playbook ceph-ansible/site.yml -i ceph-ansible/ceph.hosts

    # Create pools if not available
    ceph osd crush tunables hammer
    grep -q "^rbd default features" /etc/ceph/ceph.conf || sed -i '/\[global\]/arbd default features = 1' /etc/ceph/ceph.conf
    ceph osd pool create rbd 100 && ceph osd pool set rbd size 1 
    ```

### SODA Helm chart installation
#### Configuration
Firstly, you need to configure some global files with command below:
```
export BackendType="lvm" # 'lvm' is the default option, currently also support 'ceph'

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
memcached_servers = authchecker.opensds.svc.cluster.local:11211
signing_dir = /var/cache/opensds
cafile = /opt/stack/data/ca-bundle.pem
auth_uri = http://authchecker.opensds.svc.cluster.local/identity
project_domain_name = Default
project_name = service
user_domain_name = Default
password = opensds@123
# Whether to encrypt the password. If enabled, the value of the password must be ciphertext.
enable_encrypted = False
# Encryption and decryption tool. Default value is aes. The decryption tool can only decrypt the corresponding ciphertext.
pwd_encrypter = aes
username = opensds
auth_url = http://authchecker.opensds.svc.cluster.local/identity
auth_type = password

[osdslet]
api_endpoint = controller.opensds.svc.cluster.local:50049

[osdsdock]
api_endpoint = dock.opensds.svc.cluster.local:50050
# Choose the type of dock resource, only support 'provisioner' and 'attacher'.
dock_type = provisioner
# Specify which backends should be enabled, sample,ceph,cinder,lvm and so on.
enabled_backends = $BackendType

[lvm]
name = lvm
description = LVM Test
driver_name = lvm
config_path = /etc/opensds/driver/lvm.yaml
host_based_replication_driver = DRBD

[ceph]
name = ceph
description = Ceph Test
driver_name = ceph
config_path = /etc/opensds/driver/ceph.yaml

[database]
endpoint = db.opensds.svc.cluster.local:2379,db.opensds.svc.cluster.local:2380
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
        compression: false
        deduplication: false
      ioConnectivity:
        accessProtocol: iscsi
        maxIOPS: 7000000
        minIOPS: 1000000
        maxBWS: 600
        minBWS: 100
        latency: 100
      advanced:
        diskType: SSD
        latency: 5ms
OPENSDS_DRIVER_CONFIG_DOC
```

If you choose `ceph` as backend, you need to configure ceph driver.
```
mkdir -p /etc/opensds/driver && sudo cat > /etc/opensds/driver/ceph.yaml <<OPENSDS_DRIVER_CONFIG_DOC
configFile: /etc/ceph/ceph.conf
pool:
  {{ ceph_pool_name }}: # change pool name same to ceph pool, but don't change it if you choose lvm backend
    storageType: block
    availabilityZone: default
    extras:
      dataStorage:
        provisioningPolicy: Thin
        compression: true
        deduplication: true
      ioConnectivity:
        accessProtocol: rbd
        maxIOPS: 6000000
        minIOPS: 1000000
        maxBWS: 500
        minBWS: 100
        latency: 100
      advanced:
        diskType: SSD
        latency: 5ms
OPENSDS_DRIVER_CONFIG_DOC
```

### Run SODA and CSI-Plugin Helm Charts

* Tiller Permissions

    Tiller is the in-cluster server component of Helm. By default, `helm init` installs the Tiller pod into the `kube-system` namespace, and configures Tiller to use the `default` service account:

    ```console
    kubectl create clusterrolebinding tiller-cluster-admin \
        --clusterrole=cluster-admin \
        --serviceaccount=kube-system:default
    ```

* Then run opensds helm chart in `opensds` namespace:

    ```
    kubectl create ns opensds
    cd $HOME/opensds-installer/charts
    helm install opensds/ --name={ opensds_service_name } --namespace=opensds
    ```

* After that, check the result using `kubectl get po -n opensds`
    ```$xslt
    NAME                                                   READY   STATUS    RESTARTS   AGE
    opensds-service-opensds-apiserver-54f9dc9776-6zwhv     1/1     Running   0          1h40m
    opensds-service-opensds-authchecker-68c487c885-9zcf6   1/1     Running   0          1h40m
    opensds-service-opensds-controller-9d7b89c7c-4qln8     1/1     Running   0          1h40m
    opensds-service-opensds-dashboard-5f6c5d958b-ddv7d     1/1     Running   0          1h40m
    opensds-service-opensds-db-6cfcd45598-jxx2f            1/1     Running   0          1h40m
    opensds-service-opensds-dock-76b95bf9dd-78smj          1/1     Running   0          1h40m
    ```

* Now you are ready to run csiplugin helm chart

    For using csi block plugin:
    
    ```$xslt
    # Please update csiplugin-block/values.yaml before running csiplugin helm chart
    vim csiplugin-block/values.yaml # Change the opensds endpoint to { opensds_cluster_ip }
    helm install csiplugin-block/ --name={ csiplugin_service_name }
    ````

* For using csi file plugin:
    
    ```
    # Please update csiplugin-file/values.yaml before running csiplugin helm chart
    vim csiplugin-file/values.yaml # Change the opensds endpoint to { opensds_cluster_ip }
    helm install csiplugin-file/ --name={ csiplugin_service_name }
    ```

### Testing steps

**Download and configure SODA cli tool**  

```
wget https://github.com/sodafoundation/api/releases/download/v1.0.0/soda-api-v1.0.0-linux-amd64.tar.gz
tar zxvf soda-api-v1.0.0-linux-amd64.tar.gz
cp soda-api-v1.0.0-linux-amd64/bin/* /usr/local/bin
chmod 755 /usr/local/bin/osdsctl

export OPENSDS_ENDPOINT=http://{{ apiserver_cluster_ip }}:50040
export OPENSDS_AUTH_STRATEGY=keystone
export OS_AUTH_URL=http://{{ authchecker_cluster_ip }}/identity
export OS_USERNAME=admin
export OS_PASSWORD=opensds@123
export OS_TENANT_NAME=admin
export OS_PROJECT_NAME=admin
export OS_USER_DOMAIN_ID=default

osdsctl pool list
```

#### Create a default profile
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
SODA Dashboard is available at `http://{your_host_ip}:31975`, please login the dashboard using the default admin credentials: `admin/opensds@123`. Create `tenant`, `user`, and `profiles` as admin. Multi-Cloud service is also supported by dashboard.

Logout of the dashboard as admin and login the dashboard again as a non-admin user to manage storage resource:


### For CSI Plugin
```
wget https://github.com/sodafoundation/nbp/releases/download/v1.2.0/opensds-sushi-v1.2.0-linux-amd64.tar.gz
tar zxvf opensds-sushi-v1.2.0-linux-amd64.tar.gz
cd /opensds-sushi-linux-amd64
```

* To create example nginx application using csi block plugin, use below command  
    `kubectl create -f csi/examples/kubernetes/block/nginx.yaml`

* To create example nginx application using csi file plugin, use below command  
    `kubectl create -f csi/examples/kubernetes/file/nginx.yaml`


This example will mount a opensds volume into `/var/lib/www/html`.

### Clean up steps

Clean up example nginx application and opensds CSI pods by the following commands:
```bash
kubectl delete -f csi/examples/kubernetes/block/nginx.yaml
kubectl delete -f csi/examples/kubernetes/file/nginx.yaml
```

If you want to remove the existing cluster, please run the command below:
```bash
helm delete { csiplugin_service_name } --purge 
helm delete { opensds_service_name } --purge
```

