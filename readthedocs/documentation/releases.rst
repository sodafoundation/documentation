Official Releases
=================

Capri
-----

The OpenSDS Capri release completed June 21, 2019.

Features
>>>>>>>>

The Capri release adds the following functionality:

* Telemetry
   - Integrate with Prometheus and Grafana, and collecting metrics from storage backends.
   - Metrics driver for LVM, Ceph, and OceanStor V3/V5.
* Anomaly detection
   - Detect anomalous data points based on metrics collected from Telemetry.
   - Limitations:
      - Alert generation is not done.
      - E2E testing is not done.
* Automation and orchestration
   - Design orchestration workflow using StackStorm.
   - Use case includes provisioning storage with hooks to add custom actions.
   - Supported workflows include volume provisioning, bucket migration, and user defined workflows.
* Multi-cloud
   - GCP object store backend
   - IBM Cloud object store backend
   - Signature identification with AK/SK
* Object Lifecycle management
   - Provide object lifecycle management mechanism that allows tenants to manage lifecycle configuration policies through APIs.
   - Support migration between on-premise object storage (Ceph or Fusion Storage) and cloud storage (AWS S3, Azure Blob, GCS, Huawei OBS).
   - Support default OpenSDS storage tiers. User defined rules is not supported in Capri.
   - Restore for Glacier is not supported.
   - Support non-versioned bucket only in Capri.
* File share support
   - Profiles design based on Swordfish
   - NFS driver, Manila driver
* Volume Drivers
   - NVMeoF driver (support LVM)
   - HPE Nimble driver
   - Scutech Cloud Migration System (CMS) host-based replication driver
* CSI 1.1.0 support
   - Raw block support
   - Topology support
   - Multi-attach support
   - NVMe TCP support
   - CSI driver support for shared file systems (through file share APIs)
* Installer
   - Enable multi-dock/multi-node and multi-backend installation with Ansible
   - Helm installation with Ceph
   - Salt installer
* Thin OpenSDS (Experimental, documentation pending, Refer PR #888 and branch thin-opensds)
   - A light-weight OpenSDS to serve Cloud Native environment
* Added Fujitsu volume driver. (see #943)
   - This driver is for evaluation purpose only and limited support will be given.
   - This driver has below functions for now.
      - List/Show/Create/Update/Extend/Delete volume.
      - List/Show/Create/Delete volume attachment.
      - Create/Delete snapshot.

The OpenSDS controller (Hotpot), the north bound plugins (Sushi), the multiple cloud(Gelato), 
the opensds dashboard and the installer can be downloaded from here:

`Hotpot <https://github.com/opensds/opensds/releases/tag/v0.6.1>`__
`Sushi <https://github.com/opensds/nbp/releases/tag/v0.6.1>`__
`Gelato <https://github.com/opensds/multi-cloud/releases/tag/v0.6.1>`__
`Dashboard <https://github.com/opensds/opensds-dashboard/releases/tag/v0.6.1>`__
`Installer <https://github.com/opensds/opensds-installer/releases/tag/v0.6.1>`__


Bali
-----

The OpenSDS Bali release completed December 19, 2018.

Features
>>>>>>>>

The Bali release adds the following functionality:

* Introduced management of multiple OpenStack deployments
* Multi-Cloud support
   - S3 API support with AWS, Azure, Huawei Cloud, and local Ceph object store and Fusion Storage backends.
   - Manual and basic policy based migration for AWS, Azure, Huawei Cloud, Ceph, and Fusion Storage.
* Dashboard UI interface has been broken out into separately installed component and integrated with multicloud support.
* Added ability to upload/download snapshot to/from cloud storage
* Updated support for the Container Storage Interface (CSI) v1.0 specification
   - Added support to create snapshot and create volume from snapshot
   - Added support for NodeStageVolume and NodeUnstageVolume.
* Support to provision replicated volumes using OpenSDS CSI plugin
* CSI plugin refactoring and FC support
* Southbound Fusion Storage and OceanStor V3/V5 volume drivers
* Integrated profiles properties definition and selector filtering.
* Support external volumes for VMs or baremetal.
* Add API support for AvailabilityZone.
* Installation with Helm (tested with LVM)

The OpenSDS controller (Hotpot), the north bound plugins (Sushi), the multiple cloud(Gelato), 
the opensds dashboard and the installer can be downloaded from here:

`Hotpot <https://github.com/opensds/opensds/releases/tag/v0.4.0>`__
`Sushi <https://github.com/opensds/nbp/releases/tag/v0.4.0>`__
`Gelato <https://github.com/opensds/multi-cloud/releases/tag/v0.4.0>`__
`Dashboard <https://github.com/opensds/opensds-dashboard/releases/tag/v0.4.0>`__
`Installer <https://github.com/opensds/opensds-installer/releases/tag/v0.4.0>`__


Aruba
-----

The OpenSDS Aruba release completed June 30, 2018.

Features
>>>>>>>>

The Aruba release adds the following functionality:

* Array-based replication
* Cinder compatible API
* Containerized deployment
* Controller API request filter
* Create volume from snapshot
* Dashboard UI interface
* Extend volume support
* Fibre channel protocol support
* Host-based replication
* Multi-tenancy support in the API
* OpenStack Keystone authentication
* Storage backend capabilities reporting
* Storage pool capability reporting
* Volume groups

The OpenSDS controller (Hotpot), the north bound plugins (Sushi), and the
installer can be downloaded from here:

`Hotpot <https://github.com/opensds/opensds/releases/tag/v0.2.0>`__
`Sushi <https://github.com/opensds/nbp/releases/tag/v0.2.0>`__
`Installer <https://github.com/opensds/opensds-installer/releases/tag/v0.2.0>`__
