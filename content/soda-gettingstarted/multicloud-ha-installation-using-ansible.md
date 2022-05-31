---
title: Multi-cloud HA Installation
menuTitle: ""
disableToc: true
tags: ["user guide", "multi-cloud", "ha", "high availability"] 
description: "This document describes how to install SODA Multi-cloud project on a pre-configured Kubernetes cluster. These steps will help you to install / uninstall Multi-Cloud project. After installation using these steps, SODA Multi-Cloud Services will be available in HA mode. You can test either through SODA Dashboard UI or CLI"
weight: 50
---

This document describes how to install SODA Multi-cloud project on a pre-configured Kubernetes cluster. These steps will help you to install / uninstall Multi-Cloud project in HA mode. After installation using these steps, SODA Multi-Cloud Services will be available in HA mode. You can test either through SODA Dashboard UI.
For installing SODA in default standalone configuration please refer to the [standalone installation guide](https://docs.sodafoundation.io/soda-gettingstarted/installation-using-ansible/)

## Pre-config for Deploying Multi-Cloud Services on Kubernetes Cluster (Ubuntu 16.04 or Ubuntu 18.04)
All the installation work is tested on `Ubuntu 16.04` and `Ubuntu 18.04`, please make sure you have installed the right one. Also `root` user is REQUIRED before the installation work starts.
The following configurations are required on the Kubernetes Cluster and the SODA installer node. 
  1. A Kubernetes Cluster should be available for deploying the SODA Multi-Cloud Services on it.
  2. The Kubernetes Cluster should have atleast three nodes to deploy the services. 
  3. The Kubernetes Master node should have a user, (say 'k8s_user') configured to access the installer node.
  4. [Passwordless SSH](https://help.ubuntu.com/community/SSH/OpenSSH/Keys) should be setup between the Kubernetes Master node and the SODA Installer node.



Please follow the standalone installation guide for the remaining installation steps. 
Here are the steps that are specific to the HA installation of Multi-Cloud Services on Kubernetes Cluster.


### Configurations for Installing Multi-Cloud in HA mode.     
All the other configurations remain same as the [standalone installation](https://docs.sodafoundation.io/soda-gettingstarted/installation-using-ansible/). The few additional steps required to install Multi-Cloud in HA mode are as follows...

As a root user
#### Download SODA installer code
```bash
git clone https://github.com/sodafoundation/installer.git
cd installer/ansible
# Checkout the required version. For example, to checkout v1.7.0 follow
git checkout v1.7.0
```
{{% notice warning %}}
Checkout the latest stable release. Current stable release: Madagascar (v1.7.0). If you want to get the master branch of all components, you can skip this step. (Master may not be stable or tested fully)
{{% /notice %}}


 -`cd installer/ansible/group_vars`
 - Open the common.yml file
   - Add the IP of the host (which is reachable from the Kubernetes node)
   - export the `HOST_IP=<IP-of-the-Host>`
   - Change `gelato_ha: false` to `gelato_ha: true` to install Multi-Cloud services in HA mode.

 - Open the gelato-ha.yml file
   - Add the user that has access to the Kubernete Cluster to deploy the services.
   - The k8suser should be added to sudoers group.
     - Eg. `k8s_user: <k8suser> `

 - Open the local.hosts file in the <installer/ansible> dir.
   - Add the IP and other details of the Kubernetes Master node under the group
    - Eg. [k8smaster]
          `master ansible_port=22 ansible_user=root ansible_host=192.168.xx.yy`
          The above line is commented out in the file `installer/ansible/local.hosts`.
          Please un-comment it and replace the ansible_host with the correct IP address.
     - Ensure the passwordless ssh is configured between the Installer node and the Kubernetes Master nodes.

  -  Execute the ansible-playbook command as follows, to start the deploy:

```bash
ansible-playbook site.yml -i local.hosts
# You can use the -vvv or -vv option to enable verbose display and debug mode.
[verbosity level: -vv < -vvv]
ansible-playbook site.yml -i local.hosts -vvv
```

Here is a block diagram showing the deployment of SODA multi-cloud services in HA mode. 
{{< figure src="../resources/multicloud-ha-fig1.png" title="Multi Cloud HA Deployment" >}}



The namespace 'soda-multi-cloud' is used to deploy the services in the Kubernetes cluster.
After deploying check the pods, deployments and services deployed in the Kubernetes Cluster. 
Use the command `kubectl get pods -n soda-multi-cloud` to get a list of all the pods deployed on the Kubernetes Cluster. For more kubectl commands please refer to https://kubernetes.io/docs/reference/kubectl/



