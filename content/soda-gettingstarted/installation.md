---
title: Installation Guide
description: "This guide explains how to configure and install the SODA Foundation Projects with its components and test basic features."
weight: 30
---

This guide lists the installation steps for the SODA Foundation Projects and its components. It provides the configuration steps and enable users to test the basic features.

SODA Foundation Projects can be installed, deployed and tested using multiple tools, such as Ansible, Salt, Helm, bash scripts etc. The [SODA-installer](https://github.com/sodafoundation/installer) project contains resources and tools listed in this guide.

*Note : All the methods described below may not be verified for all the releases. We recommend the ansible install method and ensure to test it in all the releases.*

## 1. Installation using Ansible

The recommended method of installation is using ansible in Ubuntu 16.04 or Ubuntu 18.04. Detailed steps are provided below.

* [Local Cluster installation using ansible](https://docs.sodafoundation.io/soda-gettingstarted/installation-using-ansible/)
* [Multitenant installation](https://github.com/sodafoundation/api/wiki/SODA-core-projects-Local-Cluster-with-Multi-tenants-Installation)
* [Multi-Cloud HA installation using ansible](https://docs.sodafoundation.io/soda-gettingstarted/multicloud-ha-installation-using-ansible/)
  
## 2. Installation using Salt

* [https://github.com/sodafoundation/installer/tree/master/salt](https://github.com/sodafoundation/installer/tree/master/salt)
* [https://github.com/sodafoundation/installer/blob/master/salt/HACKING.md](https://github.com/sodafoundation/installer/blob/master/salt/HACKING.md)
  ( https://gitlab.com/cdli/framework )
  
## 3. Deploy SODA Foundation projects using Helm

* [https://github.com/sodafoundation/installer/tree/master/charts](https://github.com/sodafoundation/installer/tree/master/charts)
* [https://github.com/sodafoundation/installer/blob/master/charts/OpenSDS Installation using Helm.md](https://github.com/sodafoundation/installer/blob/master/charts/OpenSDS%20Installation%20using%20Helm.md)

## 4. Local cluster installation using Bash

* [https://github.com/sodafoundation/api/wiki/SODA-core-projects-Local-Cluster-with-Multi-tenants-Installation](https://github.com/sodafoundation/api/wiki/SODA-core-projects-Local-Cluster-with-Multi-tenants-Installation)

## 5. Miscellaneous

* [https://github.com/sodafoundation/api/wiki/OpenSDS-Cluster-Installation-On-Red-Hat-Enterprise-Linux](https://github.com/sodafoundation/api/wiki/OpenSDS-Cluster-Installation-On-Red-Hat-Enterprise-Linux)
* [https://github.com/sodafoundation/api/wiki/How-to-Run-Containerized-OpenSDS-for-Testing-Work](https://github.com/sodafoundation/api/wiki/How-to-Run-Containerized-OpenSDS-for-Testing-Work)

## Reference

* [https://github.com/sodafoundation/api/wiki](https://github.com/sodafoundation/api/wiki)
