---
title: Container Storage Interface(CSI) Plug-N-Play provided by SODA
menuTitle: CSI Plug-N-Play
description: "Support Matrix for SODA CSI Plug-N-Play feature"
weight: 10
disableToc: false
tags: ["user guide", "csi", "plug-n-play"] 
---

SODA CSI Plug-N-Play allows users to provision the storage in K8s using SODA way and grab the Data Management capabilities offered by SODA.
SODA CSI PnP let's user to define the profile in SODA and use the profile in the StorageClass of K8s to provision the storage 
dynamically. It allows user to switch between different heterogeneous CSI drivers via Profile.
    
Before we begin we need to create the Profile in SODA using the below command
```go
osdsctl profile create
{
  "name": "openebs-profile-soda",
  "storageType": "block",
  "description": "string",
  "provisioningProperties": {
    "dataStorage": {
      "recoveryTimeObjective": 10,
      "provisioningPolicy": "Thick",
      "compression": false,
      "deduplication": false,
      "characterCodeSet": "ASCII",
      "maxFileNameLengthBytes": 255,
      "storageAccessCapability": [
        "Read"
      ]
    },
    "ioConnectivity": {
      "accessProtocol": "iscsi",
      "maxIOPS": 150,
      "minIOPS": 50,
      "maxBWS": 5,
      "minBWS": 1,
      "latency": 1
    }
  },
  "replicationProperties": {},
  "snapshotProperties": {},
  "dataProtectionProperties": {},
  "customProperties": {
    "driver": "local.csi.openebs.io"            ## YOU NEED TO UPDATE THE DRIVER WITH VENDOR DRIVER NAME
  }
}
```
## Vendor CSI Support
Currently SODA CSI PnP has been tested for the below CSI drivers, this is not the exhaustive list but it will keep growing as other vendors verify the soda-csi-provisioner.


<table>
   <thead>
      <tr>
         <th>Storage Vendor CSI Plugin</th>
         <th>Deployment File</th>
         <th>Sample App File</th>
      </tr>
   </thead>
   <tbody>
      <tr>
         <td><a href="https://github.com/openebs/lvm-localpv">OpenEBS LVM Plugin</a></td>
         <td><a href="https://github.com/asifdxtreme/soda-ucp/blob/main/examples/openebs/driver/lvm-operator.yaml">Operator</a> </td>
         <td><a href="https://github.com/asifdxtreme/soda-ucp/blob/main/examples/openebs/app/app.yaml">Sample Application</a></td>
      </tr>
      <tr>
         <td><a href="https://github.com/openebs/zfs-localpv"> OpenEBS ZFS Plugin</a></td>
         <td><a href="https://github.com/asifdxtreme/soda-ucp/blob/main/examples/openebs/driver/zfs-operator.yaml">Operator</a></td>
         <td><a href="https://github.com/asifdxtreme/soda-ucp/blob/main/examples/openebs/app/app.yaml">Sample Application</a></td>
      </tr>
      <tr>
         <td><a href="https://github.com/IBM/ibm-block-csi-driver"> IBM Block CSI Driver</a></td>
         <td><a href="https://github.com/sodafoundation/examples/tree/master/soda-csi-plug-n-play-poc/deploy/kubernetes/ibm">Operator</a></td>
         <td><a href="https://github.com/sodafoundation/examples/tree/master/soda-csi-plug-n-play-poc/deploy/kubernetes/demo">Demo</a></td>
      </tr>
      <tr>
         <td><a href="https://github.com/ceph/ceph-csi"> Ceph CSI Driver</a></td>
         <td><a href="https://github.com/sodafoundation/examples/tree/master/soda-csi-plug-n-play-poc/deploy/kubernetes/cephcsi/rbd">Operator</a></td>
         <td><a href="https://github.com/sodafoundation/examples/tree/master/soda-csi-plug-n-play-poc/deploy/kubernetes/demo">Demo</a></td>
      </tr>
      <tr>
         <td><a href="https://github.com/wavezhang/k8s-csi-lvm">K8s-csi-lvm</a></td>
         <td><a href="https://github.com/sodafoundation/examples/tree/master/soda-csi-plug-n-play-poc/deploy/kubernetes/lvm">Operator</a></td>
         <td><a href="https://github.com/sodafoundation/examples/tree/master/soda-csi-plug-n-play-poc/deploy/kubernetes/demo">Demo</a></td>
      </tr>
   </tbody>
</table>


## Sidecar Version Support

|  SODA Release version   |            Sidecar Image                     |
|-------------------------|----------------------------------------------|
|Jerba(v1.4.0)            | `sodafoundation/soda-csi-provisioner:v2.2.0` |
|Isabela(v1.3.0)          | `sodafoundation/soda-csi-provisioner:v2.1.0` |
