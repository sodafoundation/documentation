---
title: CSI
description: "A user guide for integrating SODA with CSI Driver via unified Plugin and hotpot project"
weight: 30
disableToc: false
tags: ["user guide", "CSI", "kubernetes CSI", "plug-n-play", "unified plugin"]
---

# SODA Integration with Vendor CSI Drivers via SODA CSI Plug-N-Play

SODA CSI Plug-N-Play is a mechanism by which users can use the heterogeneous storage vendors in a unified way, Users
need to define the requirements while creating SODA Profile, Users need to use this profile ID while creating the PVC's
in the Kubernetes, the soda-csi-provisioner will automatically select the vendor csi-driver and help in provisioning the
Volumes for Pods.

## Prerequisite

- An installation of Kubernetes (V1.17+)
- SODA installation (you can refer to quick start guide
  over [here](https://docs.sodafoundation.io/soda-gettingstarted/installation-using-ansible/)), you need to change the
  ports of etcd in osdsdb.yaml while installing SODA on an existing K8s environment as the ports cause conflict with k8s
  etcd.
- SODA CSI provisioner image to be used based on SODA release version. Refer support matrix over [here](/support-matrix/nbp/csi-pnp/#sidecar-version-support)

## Selecting the vendor CSI driver

You can select the CSI driver supported by SODA Plug-N-Play from [here](https://docs.sodafoundation.io/support-matrix/nbp/csi-pnp/) Once selected follow the instruction
given in the document to deploy the CSI driver in K8s.

##### For this example we are selecting the [CEPH-RBD CSI Driver](https://github.com/ceph/ceph-csi).

Following are the pre-requisites for Ceph CSI Driver.

* Setup CEPH Client Authentication.

```
ceph auth get-or-create client.kube osd 'allow rwx pool=osdsrbd' mon 'allow r' -o /etc/ceph/ceph.client.kube.keyring
```

* Created Data Pool needs to be associated with rbd application.

```
ceph osd pool application enable osdsrbd rbd
```

* Initialize the pool to be used by RBD.

```
rbd pool init osdsrbd
```

* Adjust the tunables on the ceph cluster.

```
ceph osd crush tunables hammer
```

* It will look for rbd default features in this file "/etc/ceph/ceph.conf " if not present it will create one as shown below.
```
grep -q "^rbd default features" /etc/ceph/ceph.conf || sed -i '/\[global\]/arbd default features = 1' /etc/ceph/ceph.conf
```

```
cat /etc/ceph/ceph.conf
[global]
rbd default features = 1
fsid = a40d71a2-82eb-4f36-a81f-f3d5af2f5bcc


mon initial members = ubuntu
mon host = 192.168.1.59
mon allow pool delete = true

public network = 192.168.1.59/24
cluster network = 192.168.1.59/24


[osd]
osd mkfs type = xfs
osd mkfs options xfs = -f -i size=2048
osd mount options xfs = noatime,largeio,inode64,swalloc
osd journal size = 5120

```


#### Deploy CEPH-CSI configmap.

```yaml
apiVersion: v1
kind: ConfigMap
data:
  config.json: |-
    [
      {
        "clusterID": "4ac5251b-114f-4044-9bec-2d27fadad502",
        "monitors": [
          "192.168.1.59:6789"
        ]
      }
    ]
metadata:
  name: ceph-csi-config
```

#### Deploy Ceph RBD CSI driver along with soda-csi-provisioner.

```
kubectl create -f deploy/kubernetes/cephcsi/rbd

kubectl get pods
NAME                                         READY   STATUS    RESTARTS   AGE
csi-rbdplugin-6pw9z                          3/3     Running   0          7s
csi-rbdplugin-provisioner-6b8b9d99fd-x4wn6   7/7     Running   0          7s

```

#### Deploy Secret with userid and userkey of the CEPH user.
`
kubectl create -f deploy/kubernetes/ceph/secret.yaml
`
```yaml

apiVersion: v1
kind: Secret
metadata:
  name: csi-rbd-secret
  namespace: default
stringData:
  userID: kube
  userKey: AQDjZYFgOw/FFxAASWpRJz+H0yI3LU4x6Ct2zA==

```

#### Creating Profile in SODA

We need to create a Profile in SODA which will have the information of CSI driver which needs to be used(eventually this
step will be automatically done by SODA).

```
osdsctl profile create '{"name": "ceph-profile-soda","storageType": "block","description": "string","provisioningProperties": {"dataStorage": {"recoveryTimeObjective": 10,"provisioningPolicy": "Thin","compression": false,"deduplication": false,"characterCodeSet": "ASCII","maxFileNameLengthBytes": 255,"storageAccessCapability": ["Read"] },"ioConnectivity": {"accessProtocol": "rbd","maxIOPS": 150,"minIOPS": 50,"maxBWS": 5,"minBWS": 1,"latency": 1}},"replicationProperties": {},"snapshotProperties": {},"dataProtectionProperties": { },"customProperties": {"driver": "rbd.csi.ceph.com"}}'

```

#### Deploy storage class referencing the secret and profile created above.

`
kubectl create -f deploy/kubernetes/ceph/sc.yaml
`

```yaml
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: csi-rbd-ceph-sc
parameters:
  imageFormat: "2"
  imageFeatures: layering
  attachMode: rw
  profile: f63a7fcc-6e83-49cc-81c1-8627fc8e0f52
  clusterID: 4ac5251b-114f-4044-9bec-2d27fadad502
  pool: osdsrbd
  csi.storage.k8s.io/provisioner-secret-name: csi-rbd-secret
  csi.storage.k8s.io/provisioner-secret-namespace: default
  csi.storage.k8s.io/controller-expand-secret-name: csi-rbd-secret
  csi.storage.k8s.io/controller-expand-secret-namespace: default
  csi.storage.k8s.io/node-stage-secret-name: csi-rbd-secret
  csi.storage.k8s.io/node-stage-secret-namespace: default
  csi.storage.k8s.io/fstype: ext4

volumeBindingMode: Immediate
provisioner: soda-csi
mountOptions:
  - discard
```

#### Deploy an app with pvc.

```
kubectl create -f deploy/kubernetes/ceph/pvc.yaml
kubectl create -f deploy/kubernetes/ceph/pod.yaml
```

```yaml

apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: raw-block-pvc
spec:
  accessModes:
    - ReadWriteOnce
  volumeMode: Block
  resources:
    requests:
      storage: 1Gi
  storageClassName: csi-rbd-ceph-sc

---

apiVersion: v1
kind: Pod
metadata:
  name: pod-with-raw-block-volume
spec:
  containers:
    - name: fc-container
      image: fedora:26
      command: [ "/bin/sh", "-c" ]
      args: [ "tail -f /dev/null" ]
      volumeDevices:
        - name: data
          devicePath: /dev/xvda
  volumes:
    - name: data
      persistentVolumeClaim:
        claimName: raw-block-pvc
```

# SODA Integration with Kubernetes via SODA CSI Plugin

## Prerequisite

### Ubuntu

version information:

```bash
root@proxy:~# cat /etc/issue
Ubuntu 16.04.6 LTS \n \l
```

### Environment packages

```bash
apt-get update && apt-get install -y gcc make libc6-dev
```

### Install Go (v1.15.2)

```bash
wget https://storage.googleapis.com/golang/go1.15.2.linux-amd64.tar.gz
tar -C /usr/local -zxvf go1.15.2.linux-amd64.tar.gz
echo 'export PATH=$PATH:/usr/local/go/bin' >> /etc/profile
echo 'export GOPATH=$HOME/gopath' >> /etc/profile
source /etc/profile
```

### Docker

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

### [Kubernetes](https://github.com/kubernetes/kubernetes) local cluster

You can startup `v1.17+` k8s local cluster by executing commands blow:

```bash
cd $HOME && git clone https://github.com/kubernetes/kubernetes.git
cd $HOME/kubernetes && git checkout v1.20.5
make
echo alias kubectl='$HOME/kubernetes/cluster/kubectl.sh' >> /etc/profile
hack/install-etcd.sh
ENABLE_DAEMON=true ALLOW_PRIVILEGED=true FEATURE_GATES=VolumeSnapshotDataSource=true RUNTIME_CONFIG="storage.k8s.io/v1alpha1=true" LOG_LEVEL=5 hack/local-up-cluster.sh -O
```

### [SODA](https://github.com/sodafoundation/api) local cluster

For testing purposes you can deploy SODA refering
to [SODA Cluster Installation through Ansible](https://github.com/sodafoundation/api/wiki/SODA-Projects-Cluster-Installation-through-Ansible)
.

## Testing steps

##### Following are some additional steps we need to perform for CEPH-RBD CSI Plugin.

* Create a block image/volume inside ceph cluster.

```
rbd create osdsrbd/vol1 --size 100 --order 12
```

* Mount a block image.

```
rbd map osdsrbd/vol1 --id admin
```

* Adjust the tunables on the ceph cluster.

```
ceph osd crush tunables hammer

grep -q "^rbd default features" /etc/ceph/ceph.conf || sed -i '/\[global\]/arbd default features = 1' /etc/ceph/ceph.conf
```

* Change the workplace

  `
  cd /opt/opensds-sushi-linux-amd64
  `


* SODA supports CSI plugin for both block and file storage types

* For CSI block plugin:

  Update `profile` id of StorageClass in csi/examples/kubernetes/block/nginx.yaml according to actual profile you created, it looks like this:

      ```
      apiVersion: storage.k8s.io/v1
      kind: StorageClass
      metadata:
        name: csi-sc-opensdsplugin-block
      provisioner: csi-opensdsplugin-block
      parameters:
        attachMode: rw
        profile: d10ec339-3357-43ff-8626-4ccdb854af3d
      ```
  * Create example nginx application

    ```
    kubectl create -f csi/examples/kubernetes/block/nginx.yaml
    ```


* For CSI file plugin:

  Update `profile` id of StorageClass in csi/examples/kubernetes/file/nginx.yaml according to actual profile you created, it looks like this:

      ```
      apiVersion: storage.k8s.io/v1
      kind: StorageClass
      metadata:
        name: csi-sc-opensdsplugin-file
      provisioner: csi-opensdsplugin-file
      parameters:
        attachMode: rw
        profile: d10ec339-3357-43ff-8626-4ccdb854af3d
      ```

  * Create example nginx application

    ```
    kubectl create -f csi/examples/kubernetes/file/nginx.yaml
    ```
  This example will mount a SODA volume into `/var/lib/www/html`. You can use the following command to inspect into
  nginx container to verify it.

  ```
  kubectl exec -it nginx /bin/bash
  ```

## Clean up steps

Clean up example nginx application and SODA CSI pods by the following commands:

* For csi block plugin:

  ```
  kubectl delete -f csi/examples/kubernetes/block/nginx.yaml
  kubectl delete -f csi/deploy/kubernetes/block
  ```
* For csi file plugin:

  ```
  kubectl delete -f csi/examples/kubernetes/file/nginx.yaml
  kubectl delete -f csi/deploy/kubernetes/file
  ```
