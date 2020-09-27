---
title: File Share 
description: "Installation & Developer Guide for File Share"
weight: 10
disableToc: false
tags: ["developer guide", "file share"] 
---

This tutorial guides users and new contributors to get familiar with SODA by installing a simple local cluster and enabling NFS to use file share feature. You can also use the ansible script to install automatically. See details in SODA Local Cluster Installation through ansible.

### Prerequisite
Make sure you have all the following:
* Ubuntu environment (suggest v16.04+).
* More than 30GB remaining disk.
* Make sure have access to the Internet.
* Some tools (git, make and gcc) prepared.

### Step by Step Installation
There are two projects provided to user, if user only wants file share feature, they need to have github.com/sodafoundation/api, github.com/sodafoundation/controller, github.com/sodafoundation/dock and github.com/sodafoundation/dashboard (if you need GUI). 

#### SODA Bootstrap
First you need to download bootstrap script and run it locally with root access.
```
curl -sSL https://raw.githubusercontent.com/opensds/opensds/master/install/devsds/bootstrap.sh | sudo bash
```
If there is no error reported, you have all dependency packages installed.

#### Authentication configuration
Default authentication strategy is noauth, so if you want to enable multi-tenants feature or want to use Dashboard, please set the field OPENSDS_AUTH_STRATEGY=keystone in local.conf file:
```
cd $GOPATH/src/github.com/opensds/opensds
vim install/devsds/local.conf
```
#### Run all services in one command!
Run below in single line or you can split and run the same command
```
cd $GOPATH/src/github.com/opensds/opensds && install/devsds/install.sh
```

If everything goes well, you will get some connection messages at the console output:
Execute commands blow to set up ENVs which are needed by OpenSDS CLI:
```
------------------------------------------------------------------
export OPENSDS_AUTH_STRATEGY=keystone
export OPENSDS_ENDPOINT=http://localhost:50040
export OS_AUTH_URL=http://10.10.3.150/identity
export OS_USERNAME=admin
export OS_PASSWORD=opensds@123
export OS_TENANT_NAME=admin
export OS_PROJECT_NAME=admin
export OS_USER_DOMAIN_ID=default
------------------------------------------------------------------
Enjoy it !!
```
### Test the environment
#### Test local cluster using dashboard
Open your browser and input dashboard URL: http://$HOST_IP:8088 to enter OpenSDS dashboard. The following is the initial account for administrator user:
```
Username: admin
Password: opensds@123
```
#### Testing OpenSDS(Hotpot) using CLI
We have provided CLI for OpenSDS(HotPot), if you simply want to test OpenSDS(Hotpot) and do not want to deploy dashboard, CLI is a good choice.
Config osdsctl tool
```
sudo cp $GOPATH/src/github.com/opensds/opensds/build/out/bin/osdsctl /usr/local/bin
```
#### Set some environment variables
```
export OPENSDS_ENDPOINT=http://127.0.0.1:50040
export OPENSDS_AUTH_STRATEGY=noauth # Set the value to keystone for multi-tenants.
```
If you choose keystone for authentication strategy, you need to execute different Commands for logging in as different roles:
* For admin role
```
export OPENSDS_AUTH_STRATEGY=keystone
export OPENSDS_ENDPOINT=http://localhost:50040
export OS_AUTH_URL=http://$HOST_IP/identity
export OS_USERNAME=admin
export OS_PASSWORD=opensds@123
export OS_TENANT_NAME=admin
export OS_PROJECT_NAME=admin
export OS_USER_DOMAIN_ID=default
```

#### Create a profile for file share
```
osdsctl profile create '{"name":"default", "description":"default policy for fileshare", "storageType":"file"}'
```
#### Create a file share
```
osdsctl fileshare create 1 –n <fileshare_name> -p <profile_id>
```
#### List all file shares
```
osdsctl fileshare list
```
#### Set access for file share
```
osdsctl fileshare acl create <fileshare_id> -a <client_ip> -c
 <list_of_accessCapabilities> -t "ip"
```
#### Create snapshot of file share
```
osdsctl fileshare snapshot create <fileshare_id> -n <snapshot_name> -d "test snapshot"
```

#### Delete the file share
```
osdsctl fileshare delete <fileshare_id>
```
#### Uninstall the local cluster
OpenSDS(Hotpot)
It's also nice to uninstall the cluster with one command:
```
cd $GOPATH/src/github.com/opensds/opensds && install/devsds/uninstall.sh
```
If you want to destroy the cluster, please run the command below instead:
```
cd $GOPATH/src/github.com/opensds/opensds && install/devsds/uninstall.sh -purge
```
### Dashboard
```
docker stop opensds-dashboard
docker rm opensds-dashboard
```
Hope you enjoyed it! Any suggestions are welcome.
