---
title: Quick Start Guide
description: "The quickstart guide is for users and new contributors to get familiar with SODA Foundation, by installing a simple containerized local cluster. It also gives the installation steps for old OpenSDS versions"
weight: 20
---

This is a quickstart guide for users and new contributors to try and get familiar with [SODA Foundation Release](https://github.com/sodafoundation/releases) and its [projects](https://github.com/sodafoundation). It will help to install and try out the SODA Releases using the binaries with minimum configurations or settings.

{{% notice note %}}
At present, this document also provides the installation steps to try out older OpenSDS releases. 
Soon, the support for old opensds releases shall be deprecated.
{{% /notice %}}

To have more control of the installaton cofigurations, or try out various configurations refer a detailed installation guide [here](/soda-gettingstarted/installation)

### Supported SODA releases

- The following releases are supported using the installation steps given below.

	|**RELEASE NAME** | **RELEASE TAG**|
	|-----------------|----------------|
	|Hawaii           | v1.2.0         |
	|Greenland        | v1.1.0         |
	|Faroe            | v1.0.0         |
	|Elba             | v0.20.0        |

Use the **RELEASE TAG** in the commands below wherever `RELEASE_TAG` is mentioned.

### Quick Installation and experience of SODA releases

This procedure applies to Ubuntu 16.04 and 18.04 Linux distributions.

### Prerequisite  
 
- Get superuser priviledges:
    
	`sudo -s`
    
- Install Basic Dependencies:
      
	`apt-get update && apt-get install -y git make curl wget libltdl7 libseccomp2 libffi-dev gawk`
	    
- Install Docker:
	- Ubuntu 16.04:

		`wget https://download.docker.com/linux/ubuntu/dists/xenial/pool/stable/amd64/docker-ce_18.06.1~ce~3-0~ubuntu_amd64.deb && dpkg -i docker-ce_18.06.1~ce~3-0~ubuntu_amd64.deb`
	
	- Ubuntu 18.04:

    	`wget https://download.docker.com/linux/ubuntu/dists/bionic/pool/stable/amd64/docker-ce_18.06.1~ce~3-0~ubuntu_amd64.deb && dpkg -i docker-ce_18.06.1~ce~3-0~ubuntu_amd64.deb`
    
    - Install docker-compose:

		- `curl -L https://github.com/docker/compose/releases/download/1.23.1/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose`
		- `chmod +x /usr/local/bin/docker-compose`
    - Required golang version: 1.13.x
	    - Run following command `go version` and check the version
	    - If the required version is not installed on the system, install golang,1.13.9 using:
		   - `wget https://storage.googleapis.com/golang/go1.13.9.linux-amd64.tar.gz`
		- `tar -C /usr/local -xzf go1.13.9.linux-amd64.tar.gz`
		- `echo export PATH=$PATH:/usr/local/go/bin >> /etc/profile`
		- `echo export GOPATH=$HOME/gopath >> /etc/profile`
		- `source /etc/profile`

### Get and Install Release Binaries  
	
{{% notice info %}}
Please replace RELEASE_TAG with the corresponding value from [Supported SODA Releases](#supported-soda-releases) table above (ex: v1.2.0 etc)
{{% /notice %}}

- `wget  https://github.com/sodafoundation/installer/releases/download/<RELEASE_TAG>/installer-<RELEASE_TAG>.tar.gz`  
 **OR**  
 Download the installer binaries from [https://github.com/sodafoundation/installer/releases/tag/<RELEASE_TAG>](https://github.com/sodafoundation/installer/releases/tag/<RELEASE_TAG>)

- `tar xvzf installer-<RELEASE_TAG>.tar.gz`
- `cd installer-<RELEASE_TAG>/ansible/`
- `chmod +x ./install_ansible.sh && ./install_ansible.sh`
- `ansible --version` # Ansible version 2.4.x is required
- The HOST_IP needs to be set to the real host IP of your host (ex: 192.168.1.10 or 127.0.0.1 for localhost)
	- `export HOST_IP = <your_real_host_ip>`
	- `vim group_vars/common.yml` to modify `host_ip` address if needed

{{% notice info %}}
For the release with RELEASE_TAG `v1.2.0`  
`tar xvzf installer-v1.2.0.tar.gz`  
`cd installer-v1.2.0/ansible/`  
`chmod +x ./install_ansible.sh && ./install_ansible.sh`  
`ansible --version`  
{{% /notice %}}

 ### Run the installer  
- `ansible-playbook site.yml -i local.hosts` 
- Note: If you want to clean up and test again, run
	- `ansible-playbook clean.yml -i local.hosts -vvv`
- and then run:
	- `ansible-playbook site.yml -i local.hosts`

 ### How to do a quick test  

- Open Your Browser and use the http://<your_real_host_ip>:8088 to access the SODA Dashboard (this IP should be the IP Address of the host if you have updated the config file) Example: [http://127.0.0.1:8088](http://127.0.0.1:8088)

- Use admin/opensds@123 credentials to login

- You will login to the UI Dashboard and you can verify the features through various menu options


### Previous Release

{{% notice note %}}
We are currently not supporting the older versions before Elba. However, if you have specific reasons to use older versions, please contact at #general  slack channel of [soda foundation slack](https://sodafoundation.io/slack)
{{% /notice %}}

