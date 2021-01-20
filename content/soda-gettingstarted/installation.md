---
title: Installation Guides
description: "This guide explains how to configure and install the SODA Foundation Projects with its components and test basic features."
weight: 30
---

This guide lists the installation steps for the SODA Foundation Projects and its components.It provides the cofiguration steps and enable users to test the basic features.

SODA Foundation Projects can be installed, deployed and tested using multiple tools, such as Ansible, Salt, Helm, bash scripts etc. The [SODA-installer](https://github.com/sodafoundation/installer) project contains resources and tools listed in this guide.

*Note : All the methods described below may not be verified for all the releases. We recommend the ansible install method and ensure to test it in all the releases.*

## 1. Installation using Ansible

The recommended method of installation is using ansible in Ubuntu 16.04 or Ubuntu 18.04. Detailed steps are provided below.

* [Local Cluster installation using ansible (Recommended)](/guides/installer-guides/using-ansible/)

## 2. Installation using Salt

* [Installation using Salt](/guides/installer-guides/using-salt/)
* [Hacking - Deployment values ](/guides/installer-guides/using-salt/hacking)
  ( https://gitlab.com/cdli/framework )
  
## 3. Deploy SODA Foundation projects using Helm

* [SODA Installation using Helm](/guides/installer-guides/using-helm/)
* [Helm Charts](/guides/installer-guides/using-helm/charts)



## 4. Local cluster installation using Bash

* [SODA core projects Local Cluster with Multi-tenants Installation](/guides/installer-guides/using-devsds/)

## 5. Miscellaneous

* [SODA Cluster Installation On Red Hat Enterprise Linux](/guides/installer-guides/for-rhel/)
* [How to Run Containerized SODA for Testing Work](/guides/installer-guides/containerized/)
* [SODA Integration with Kubernetes CSI](/guides/integration-guides/kubernetes-csi-integration/)

