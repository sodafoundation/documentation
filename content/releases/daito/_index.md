---
title: Daito (v0.10.1)
description: "This is the v0.10.1 release of OpenSDS"
weight: 4
---


The OpenSDS Daito release was completed on January 10, 2020.

## Features  

This is an incremental stable release after v0.6.1 (Capri with fix). All the features of Capri are expected to work unless otherwise mentioned. This release is named as Daito. This release has improved E2E tests along with Basic tests on all features. This release can be used for trials; however not yet production ready.  
We are continuing to test with some of the real hardware and environments needed. If you are interested to help in providing any support please contact us. Also if you are planning to do a product integration, our community can support you directly. 
[Email](mailto:lfopensds@gmail.com) OR [Slack](https://www.opensds.io/slack/) OR on Twitter [@opensds_io](https://twitter.com/opensds_io)

## Release Information
### Opensds Changes

- Hotpot API updates for basic data provisioning
- Hotpot API additional parameters added
- Swagger API validation added

### What's new

- Host Management APIs initial version integrated
- updated to openapi 3.0
- New South Bound Driver added (Beta)
- NetApp ONTAP Select
- IBM Spectrum Scale

### NBP Changes

- CSI Block and File Separation
- Hostname and Host attachment changes for CSI
- Bug fixes

### What's new

- VMWare support (Initial support for NGC and vRO)
- Hostname and Host attachments for NGC and vRO

### Known issues

- FlexVol is not supported in this version

## Multicloud Changes

- Integration with YIG to enhance multicloud
- Architecture and Design updates to handle YIG integration and optimization
- Bug fixes and performance improvements

### What's new

- Support for YIG Storage backend as on-premise cloud
- Copy object
- ACL (custom) for Buckets [public-read, public-read-write and private (private is the default)]
- ACL (custom) for Objects [public-read and private (private is the default)]
- Multipart upload and download for non encrypted buckets (except Ceph and GCP backends)
- SSE with Server Managed Keys (put and get using only normal upload(non-multipart) and download. Please use API interface)

### Known issues

- Bucket lifecycle is not fully verified for Ceph and GCS

## Opensds Dashboard Changes

_The dashboard is mainly intended to showcase the features of opensds. It is only for demo purpose currently.
[For the complete feature and advanced capabilities of opensds please refer/use backend API /documentations]_

- profile page updates for API changes

## What's new

- Host Management support
- Volume attach/detach support in OpenSDS UI
- Multicloud feature support for SSE, ACL, Copy/Paste Object

## Opensds-installer Changes

- Installer script optimized for better install experience

## Bug fixes
- Modular and more controlled installation script for different projects
- CSI changes for Block and File Separation

## What's new

- Multicloud installation to support YIG integration and YIG Storage Backend
- Install support for NetApp ONTAP select driver

**Note:** For VMWare NBP installations, please refer to VMWare NBP Documentation. It is not part of installer

## Documentation Changes

- Redesign and updates on the documentation

## What's new

- New repo for documentation and migration

## Orchestration Changes

- Changes in the Volume Provisioning action for host attachment

## Anomaly Detection

- No Changes

## How to use the Release:  

### From Release Binaries of OpenSDS Installer

#### Steps:


1. Download the installer binaries from [here](https://github.com/opensds/opensds-installer/releases/tag/v0.10.0) (Use wget or direct download using browser)  

```
wget https://github.com/opensds/opensds-installer/releases/download/v0.10.0/opensds-installer-v0.10.0.tar.gz
```

2. Extract the downloaded file and change directory to opensds-installer/ansible  

```
tar xvzf opensds-installer-v0.10.0.tar.gz
cd opensds-installer/ansible
```  

3. Change the permission of the Ansible install script. 

```
chmod +x ./install_ansible.sh
```
4. Run the Ansible install script. This will install Ansible.  

```
./install_ansible.sh
# Ansible version 2.4.x is required.
ansible --version 
```  

5. Modify IP address, if needed, to the IP of the host machine.  

```
vim group_vars/common.yml 
```  

6. Run the Ansible playbook to install OpenSDS  

```
ansible-playbook site.yml -i local.hosts
```  

### Configuration & Installation
If you want more config control, you can follow these steps:

[Try OpenSDS / Installation](https://docs.opensds.io/try-opensds/installation/) (Using Ansible - Recommended)

### Advanced Usages or Development
Please refer our detailed [documentation](https://docs.opensds.io/)

[Installer Guides](https://docs.opensds.io/guides/installer-guides/)  
[User Guides](https://docs.opensds.io/guides/user-guides/)  
[Developer Guides](https://docs.opensds.io/guides/developer-guides/)  

## Issues and Suggestions
Please raise the issues, ideas and suggestions in the respective repository under issues section.

## OpenAPI Spec
* [Daito](/guides/api-spec/daito/)

## Downloads  

The OpenSDS controller (Hotpot), the north bound plugins (Sushi), the multiple cloud(Gelato), 
the opensds dashboard and the installer can be downloaded from here:

[Hotpot](https://github.com/opensds/opensds/releases/tag/v0.10.1)  
[Sushi](https://github.com/opensds/nbp/releases/tag/v0.10.0)  
[Gelato](https://github.com/opensds/multi-cloud/releases/tag/v0.10.0)  
[Dashboard](https://github.com/opensds/opensds-dashboard/releases/tag/v0.10.0)  
[Installer](https://github.com/opensds/opensds-installer/releases/tag/v0.10.0)  
