---
title: Quick Start Guide
description: "The quickstart guide is for users and new contributors to get familiar with SODA Foundation, by installing a simple containerized local cluster. It also gives the installation steps for old OpenSDS versions"
weight: 20
---

This is a quickstart guide for users and new contributors to try and get familiar with [SODA Foundation Release](https://github.com/sodafoundation/releases) and its [projects](https://github.com/sodafoundation). It will help to install and try out the SODA Releases using the binaries with minimum configurations or settings.

***Note**: *At present, this document also provides the installation steps to try out older OpenSDS releases. Soon, the support for old opensds releases shall be removed.**

To have more control of the installation configurations, or try out various configurations refer a detailed installation guide [here](/soda-gettingstarted/installation)

## Supported SODA releases

 - The following releases are supported using the installation steps given below.

	|**RELEASE NAME** | **RELEASE TAG**|
	|-----------------|----------------|
	|Navarino         | v1.8.0         |
	|Madagascar       | v1.7.0         |
	|Lamu             | v1.6.0         |
	|Kalpeni          | v1.5.0         |
	|Jerba            | v1.4.0         |
	|Isabela          | v1.3.0         |
	|Hawaii           | v1.2.0         |
	|Greenland        | v1.1.0         |
	|Faroe            | v1.0.0         |
	|Elba             | v0.20.0        |


## Quick Installation and experience of SODA releases

This procedure applies to Ubuntu 18.04 & 20.04 Linux distributions.

- **Prerequisite**

	- Install Basic Dependencies:
		
		`sudo apt-get update && sudo apt-get install -y git`

- **Install SODA**  

{{% notice info %}}  

We can install SODA by using Release Binary or Installer from GitHub\
Please replace **RELEASE_TAG** with the corresponding value from Release Tag table above (ex: v1.8.0 etc).  

{{% /notice %}}  

- Get Release Binary  
	`wget  https://github.com/sodafoundation/installer/releases/download/[RELEASE_TAG]/installer-[RELEASE_TAG].tar.gz`  
	`tar xvzf installer-[RELEASE_TAG].tar.gz`  
	`cd installer-[RELEASE_TAG]/ansible/`
- Get Installer from GitHub  
	`git clone https://github.com/sodafoundation/installer.git`  
	`cd installer/ansible/`\
	`git checkout [RELEASE_TAG]`
      
         
```bash
chmod +x install_dependencies.sh && source install_dependencies.sh
export PATH=$PATH:/home/$USER/.local/bin
#The HOST_IP need to be set to the real_host_ip of your host (ex: 192.168.1.10 or 127.0.0.1 for localhost)
export HOST_IP = <your_real_host_ip>
vim group_vars/common.yml # Modify `host_ip` address if needed
```

- **Enable configurations to install SODA Products**
	- **DELFIN**  
		- In file installer/ansible/group_vars/delfin.yml  `enable_delfin: true`
		- In file installer/ansible/group_vars/srm-toolchain.yml `install_srm_toolchain: true`
		- In file installer/ansible/group_vars/dashboard.yml `enable_dashboard: true`

	- **STRATO (SODA Multicloud)**  
		- In file installer/ansible/group_vars/gelato.yml  `enable_gelato: true`  
		- In file installer/ansible/group_vars/dashboard.yml `enable_dashboard: true`  
	
	- **Terra (SODA Hotpot)**  
		- In file installer/ansible/group_vars/hotpop.yml  `enable_hotpot: true`  
		- In file installer/ansible/group_vars/dashboard.yml `enable_dashboard: true`  



	
 - **Run the installer**  
	- `sudo -E env "PATH=$PATH" ansible-playbook site.yml -i local.hosts -v`
	- Note: If you want to clean up and test again, run
		- `sudo -E env "PATH=$PATH" ansible-playbook clean.yml -i local.hosts -vvv`
	- and then run:
		- `sudo -E env "PATH=$PATH" ansible-playbook site.yml -i local.hosts`

 -   **How to do a quick test**

      - Open Your Browser and use the http://< actual host ip>:8088 to access the SODA Dashboard (this IP should be the IP Address of the host if you have updated the config file) Example: [http://127.0.0.1:8088](http://127.0.0.1:8088)
  
      - Use admin/opensds@123 credentials to login
      
      - You will login to the UI Dashboard and you can verify the features through various menu options


### Previous Release

Note: We are currently not supporting the older versions before Elba. However, if you have specific reasons to use older versions, please contact at #general  slack channel of [soda foundation slack](https://sodafoundation.io/slack)

