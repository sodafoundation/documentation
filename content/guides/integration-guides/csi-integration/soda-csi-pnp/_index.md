---
title: SODA Integration with Vendor CSI Drivers via SODA CSI Plug-N-Play
menuTitle: "SODA CSI Plug-N-Play"
description: "A guide for integrating SODA with Vendor CSI Driver via unified Plugin."
weight: 10
disableToc: false
tags: ["integration guide", "kubernetes csi", "plug-n-play", "unified plugin"] 
---

SODA CSI Plug-N-Play is a mechanism by which users can use the heterogeneous storage vendors in a unified way, 
Users need to define the requirements while creating SODA Profile, 
Users need to use this profile ID while creating the PVC's in the Kubernetes, 
the soda-csi-provisioner will automatically select the vendor csi-driver and help in 
provisioning the Volumes for Pods.
  
## Prerequisite
 - An installation of Kubernetes (V1.17+)  
 - SODA installation (you can refer to quick start guide over [here](https://docs.sodafoundation.io/soda-gettingstarted/installation-using-ansible/)), you need to change the ports of etcd in osdb.yaml while installing SODA on an existing K8s environment as the ports cause conflict with k8s etcd.  
 - Soda-proxy needs to be installed, you can follow the quick start guide over [here](https://github.com/sodafoundation/nbp/blob/master/csi-plug-n-play/sidecars/soda-proxy/Readme.md) to bring up the soda-proxy.

## Selecting the vendor CSI driver
You can select the CSI driver supported by SODA Plug-N-Play from [here](https://docs.sodafoundation.io/guides/user-guides/csi/ceph-csi/) Once selected follow the instruction
given in the document to deploy the CSI driver in K8s.  

## Note
If there are more than one CSI driver from the same storage vendor, it should be deployed in a different namespaces to avoid the soda-csi lock conflicts.

example :
OPENEBS-LVM CSI driver in Kube-system namespace and OPENEBS-ZFS CSI driver in Kube-system-zfs namespace.

CSI drivers from different storage vendors can be deployed in the same namespace without having any conflict.

example :
CEPH-RBD CSI driver and IBM CSI driver both in the default namespace and didn't notice any soda-csi lock conflict issue.


##### For this example we are selecting the [OpenEBS LVM CSI Driver](https://github.com/openebs/lvm-localpv).

```go
kubectl create -f https://raw.githubusercontent.com/asifdxtreme/soda-ucp/main/examples/openebs/driver/lvm-operator.yaml
```
We need to do the additional step to make the lvm group for this plugin
```go
truncate -s 1024G /tmp/disk.img
sudo losetup -f /tmp/disk.img --show
```
Create the Volume group on all the nodes, which will be used by the LVM Driver for provisioning the volumes

```go
sudo pvcreate /dev/loop0
sudo vgcreate lvmvg /dev/loop0
```


## Creating Profile in SODA
We need to create a Profile in SODA which will have the information of csi driver which needs to be used(eventually this step will be automatically done by SODA).

```go
osdsctl profile create '{"name": "openebs-profile-soda","storageType": "block","description": "string","provisioningProperties": {"dataStorage": {"recoveryTimeObjective": 10,"provisioningPolicy": "Thick","compression": false,"deduplication": false,"characterCodeSet": "ASCII","maxFileNameLengthBytes": 255,"storageAccessCapability": ["Read"] },"ioConnectivity": {"accessProtocol": "iscsi","maxIOPS": 150,"minIOPS": 50,"maxBWS": 5,"minBWS": 1,"latency": 1}},"replicationProperties": {},"snapshotProperties": {},"dataProtectionProperties": { },"customProperties": {"driver": "local.csi.openebs.io"}}'

```

## Attach information of ProfileID in Storage Class
Once the Profile ID is created then we need to create a Storage Class in K8s.
```go

apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: openebs-lvmsc-soda
allowVolumeExpansion: true
parameters:
  volgroup: "lvmvg"
  profile: a82980d3-1030-41e5-95f0-b2db5a0c065d     ## SODA PROFILE ID
provisioner: soda-csi
allowedTopologies:
- matchLabelExpressions:
  - key: kubernetes.io/hostname
    values:
      - node-12340                                  ## NODE NAME ON WHICH PROVISIONING NEEDS TO BE DONE
```

## Deploy an App with pvc

```go
kubectl create -f https://raw.githubusercontent.com/asifdxtreme/soda-ucp/main/examples/openebs/app/app.yaml
```

