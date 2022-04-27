---
title: Multi-cloud Local Cluster Installation using Ansible
menuTitle: ""
disableToc: true
tags: ["user guide", "multi-cloud", "ansible"] 
description: "This document describes how to install SODA Multi-cloud project in a local cluster using Ansible. These steps will help you to install / uninstall Multi-Cloud project. After installation using these steps, you can test either through SODA Dashboard UI or CLI"
weight: 50
---

This document describes how to install SODA Multi-cloud project in a local cluster using Ansible. These steps will help you to install / uninstall Multi-Cloud project. After installation using these steps, you can test either through SODA Dashboard UI or CLI.

`Hereafter, Hotpot refers to API, Controller and Dock projects`

{{% notice info %}}
**Ubuntu 16.04 support for SODA is deprecated as of SODA Jerba release v1.4.0.** <br />
**If you have a requirement to install SODA on Ubuntu 16.04, please contact us on slack and we will try to help with the setup.**
{{% /notice %}}

{{% notice info %}}
**Ubuntu 20.04 support for SODA is added as experimental in Lamu v1.6.0 release through branch `ubuntu2004-experimental`.** <br />
**If you have a requirement to install SODA on Ubuntu 20.04, please [refer](https://github.com/sodafoundation/installer/tree/ubuntu2004-experimental) or contact us on slack and we will try to help with the setup.**
{{% /notice %}}

---

### Pre-requisites
- SODA installation is tested on `Ubuntu 18.04`. 
- `root` user is REQUIRED before the installation work starts.

#### Install following packages:

```bash
apt-get update && apt-get install -y git make curl wget libltdl7 libseccomp2 libffi-dev gawk
```
---

#### Install docker:


##### For Ubuntu 18.04

```bash
wget https://download.docker.com/linux/ubuntu/dists/bionic/pool/stable/amd64/docker-ce_18.06.1~ce~3-0~ubuntu_amd64.deb
```

```bash
dpkg -i docker-ce_18.06.1~ce~3-0~ubuntu_amd64.deb
```
---
####  Install docker-compose:

```bash
curl -L "https://github.com/docker/compose/releases/download/1.23.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
```
---
####  Install golang

**golang 1.13.x is supported. To install golang 1.13.9, please follow these steps**

```bash
wget https://storage.googleapis.com/golang/go1.13.9.linux-amd64.tar.gz
tar -C /usr/local -xzf go1.13.9.linux-amd64.tar.gz
echo 'export PATH=$PATH:/usr/local/go/bin' >> /etc/profile
echo 'export GOPATH=$HOME/gopath' >> /etc/profile
source /etc/profile
```
`Check if golang exists`
```bash
go version
```
***

### Download SODA Installer code
```bash
git clone https://github.com/sodafoundation/installer.git
cd installer/ansible
# Checkout the required version. For example, to checkout v1.6.0 follow
git checkout v1.6.0
```

{{% notice note %}}
Checkout the latest stable release. Current stable release: [Lamu (v1.6.0)](https://github.com/sodafoundation/soda/releases/tag/v1.6.0). If you want to get the master branch of all components, you can skip this step. (Master may not be stable or tested fully)
{{% /notice %}}

#### Install ansible

This step is needed to install ansible version 2.5.1 for Ubuntu 18.04 which is required for the "include_tasks" ansible command.

```bash
chmod +x ./install_ansible.sh && ./install_ansible.sh
ansible --version # Ensure Ansible version 2.5.1 for Ubuntu 18.04.
```
--- 

### Configure SODA installer and environment variables

A SODA release conists of various projects which have their own release cycles and versions.
To install SODA  projects and enabled the features following variables have to be enabled in the respective files as below:

#### Set Host IP address

Set the environment variable `HOST_IP` by using the steps below. 

```bash
export HOST_IP={your_real_host_ip}
echo $HOST_IP 
```

In the SODA Installer, modify `host_ip` in `group_vars/common.yml` and change it to the actual machine IP of the host.  
By default the `host_ip` is set to `127.0.0.1` i.e. localhost.  
```bash
# This field indicates local machine host ip
host_ip: 127.0.0.1
```


---

### Select SODA Projects to install
In the same `group_vars/common.yml` file, modify the `deploy_project` variable to select the projects to install. 
Currently the `deploy_project` variable takes `all`, `hotpot` and `gelato` as values. By default it is set to `all`.  
`all` installs SODA On Premise and SODA Multicloud (gelato).  
`hotpot` installs SODA On Premise only.  
`gelato` installs SODA Multicloud only.  

```bash
# This field indicates which project should be deploy
# 'hotpot', 'gelato' or 'all'
deploy_project: all  #all refers to hotpot + gelato
```

### Install SODA
Run SODA installer ansible playbook to start the deployment

Check if the hosts can be reached

```bash
ansible all -m ping -i local.hosts
```

```bash
ansible-playbook site.yml -i local.hosts
# You can use the -vvv or -vv option to enable verbose display and debug mode.
[verbosity level: -vv < -vvv]
ansible-playbook site.yml -i local.hosts -vvv
```

SODA ansible installer supports installation using tags. To install a particular service use the playbook as follows
```bash
# This installs only delfin
ansible-playbook site.yml -i local.hosts -vvv --tags delfin
```
Supported tags: `keystone`, `hotpot`, `dock`, `delfin`, `srm_toolchain`, `gelato`, `sushi`, `dashboard`, `orchestration`


### SODA Dashboard UI

SODA Dashboard UI is available at `http://{your_host_ip}:8088`, please login to the dashboard using the default admin credentials: `admin/opensds@123.` Create `tenant`, `user`, and `profiles` as admin. Multi-Cloud and Delfin are also supported by dashboard.


### Things to Note

{{% notice note %}}
**_To use the multicloud service, an AK/SK must be generated before anything else. To do this you can follow the steps below:_**  <br />
1. Go to AK/SK Management<br />
2. Click on Add AK/SK button.<br />
3. Save the file (Do not forget to save this file and keep it safe.)<br />
{{% /notice %}}


{{% notice note %}}
**_To generate Access Key , Secret Key using ReST APIs, follow the link below:_**
 AK/SK Generation using APIs can be found [here](/guides/user-guides/multi-cloud/aksk/ak-sk-using-api/)
{{% /notice %}}

{{% notice info %}}
**_To use the Block and File service, respective profile must be created before using these services. To do this you can follow the steps below:_**  <br />
1. Go to Profiles<br />
2. Click on Create button.<br />
3. Enter the details and select the Storage type as Block or File. <br />
4. Create one profile for Block type and  name it `default_block`.<br />
5. Create one profile for File type and  name it `default_file`.<br />
6. Save the profile and select it when you are creating a new volume or file share.<br />
7. Make sure you enable the snapshot policy and replication policy in the profile if you intend to create either.<br />
{{% /notice %}}

Logout of the dashboard as admin and login the dashboard again as a non-admin user to manage storage resources.

---

### How to uninstall SODA including purge and clean
Run SODA installer ansible playbook to clean the environment
``` bash
ansible-playbook clean.yml -i local.hosts
# You can use the -vvv option to enable verbose display and debug mode.
ansible-playbook clean.yml -i local.hosts -vvv
```

---



