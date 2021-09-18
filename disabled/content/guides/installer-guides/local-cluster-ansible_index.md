---
title: Using Ansible
description: "A guide for installing OpenSDS on a local cluster using Ansible."
weight: 10
disableToc: false
tags: ["installer guide", "ansible"] 
---
This document describe how to install and use OpenSDS projects by using Ansible Installer. 
This document builds upon installer wiki https://github.com/opensds/opensds/wiki/OpenSDS-Cluster-Installation-through-Ansible
## Installation requirements
* Ubuntu 16.04 and packages
* Docker-ce 18.06
* Ansible 2.4.6
Please refer [wiki page](https://github.com/opensds/opensds/wiki/OpenSDS-Cluster-Installation-through-Ansible) to install above requirements.
## Install OpenSDS using opensds-installer
Clone opensds-installer repository and checkout Capri tag.
```bash
git clone https://github.com/opensds/opensds-installer.git
cd opensds-installer
git checkout v0.6.0
```
### Default installation
Below command will install default OpenSDS configuration and its dependant components in the Host/VM, where installer in running and host_ip set to localhost (127.0.0.1).
```bash
cd ansible
ansible-playbook site.yml -i local.hosts 
```
Using OpenSDS
How to test opensds cluster
### Specific feature configurations and installation
Installer may be configured for specific features using configurations from YML files in path `ansible/group_vars/`.
Following are some of the configurations that may be useful. More details available in [wiki page](https://github.com/opensds/opensds/wiki/OpenSDS-Cluster-Installation-through-Ansible)
#### Common
Specific host: `host_ip` in `ansible/group_vars/common.yml`
```yml
# This field indicates 
host_ip: 127.0.0.1
```
#### Authentication
Authentication strategy: `opensds_auth_strategy` in `ansible/group_vars/auth.yml`
```yml
# OpenSDS authentication strategy, support 'noauth' and 'keystone'.
opensds_auth_strategy: keystone
```
#### Orchestration
Enable Orchestration: `enable_orchestration` in `ansible/group_vars/orchestration.yml`
```yml
# Install Orchestration Manager (true/false)
enable_orchestration: true 
```
### Un-install and Clean-up
Below command will clean OpenSDS and its dependant components
```bash
ansible-playbook clean.yml -i local.hosts 
```
## Using OpenSDS
OpenSDS features are accessible from a CLI or Dashboard
Please refer [wiki](https://github.com/opensds/opensds/wiki/OpenSDS-Cluster-Installation-through-Ansible) Section `How to test opensds cluster` for details of using OpenSDS features using CLI and OpenSDS Dashboard.
## Known issues
### 1. If port 80 is not free, installer will fail. 
This is observed as multi-cloud (gelato) installation failure. Keystone require port 80 to be free and it will not start. Multi-cloud installation will wait for Keystone and timeout with failure.
#### Workaround:
Free up port 80 of the Host/VM for Keystone. 
Example: If Apache2 service is using port 80, disable and stop this service with following steps
```bash
systemctl disable apache2.service
systemctl stop apache2.service
```
### 2. Orchestration not working, installation is success.
Sometimes during multiple installations DB gets corrupt and some StackStorms services may not be running (Eg. mistral-server, mistral.api). Because of this condition orchestration workflows will not run.
To check this, go to StackStorm Installer folder and check st2ctl status as below.
```bash
$ cd /opt/st2-installer-linux-amd64
$ docker-compose exec stackstorm st2ctl status
##### st2 components status #####
st2actionrunner PID: 99
...
st2scheduler PID: 55
mistral-server is not running.     -----------------------------> ERROR condition
mistral.api is not running.        -----------------------------> ERROR condition
```
To Fix this issue, run commands below:
```bash
$ cd /opt/st2-installer-linux-amd64
$ docker-compose exec stackstorm st2ctl stop
$ docker-compose stop postgres
$ docker system prune --volumes
$ docker-compose up -d postgres
$ docker-compose exec stackstorm st2ctl start
...
##### st2 components status #####
st2actionrunner PID: 956
...
mistral-server PID: 1400
mistral.api PID: 1522
```

#### Workaround 
A workaround is suggested in [wiki](https://github.com/opensds/opensds/wiki/OpenSDS-Cluster-Installation-through-Ansible)
## Reference
www.opensds.io
https://github.com/opensds/opensds/wiki/OpenSDS-Cluster-Installation-through-Ansible
https://github.com/opensds/documentation/tree/master/readthedocs/starterguides
## Support/Contact
Mailing list: [opensds-tech-discuss](https://lists.opensds.io/mailman/listinfo/opensds-tech-discuss)
slack: [#opensds](https://opensds.slack.com/)
Ideas/Bugs: [issues](https://github.com/opensds/opensds-installer/issues)




