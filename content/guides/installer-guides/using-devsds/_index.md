---
title: Installation Guide for simple Local Cluster using devsds
menuTitle: Using Devsds
description: "This document describes how to install SODA projects in a local cluster with detailed configuration options. These steps will help you to enable / disable projects. After installation using these steps, you can get the features of all the enabled projects. You can test either through SODA Dashboard UI or CLI"
weight: 20
tags: ['installer guide', 'devsds']
---

Here is a tutorial guiding users and new contributors to get familiar with [SODA Projects](https://github.com/sodafoundation/<projects>) by installing a simple local cluster and managing lvm device. You can also use the ansible script to install automatically. See details in [OpenSDS Local Cluster Installation through ansible](https://github.com/sodafoundation/api/wiki/SODA-Projects-Cluster-Installation-through-Ansible).

## Prepare
Before you start, please make sure you have all the following:
- Ubuntu environment (suggest v16.04+).
- More than 30GB remaining disk.
- Make sure have access to the Internet.
- Some tools (`git`, `make` and `gcc`) prepared.

## Step by Step Installation
These are the  projects provided to user: 
a) api
b) controller
c) dock
d) Multi-Cloud(Gelato)
e) Dashboard.

### SODA Projects (Hotpot)
#### Bootstrap
First you need to download [bootstrap](https://github.com/sodafoundation/api/blob/master/install/devsds/bootstrap.sh) script and run it locally with root access.
```shell
curl -sSL https://raw.githubusercontent.com/sodafoundation/api/master/install/devsds/bootstrap.sh | sudo bash
```
If there is no error reported, you have all dependency packages installed.

#### Authentication configuration
Because the default authentication strategy is `noauth`, so if you want to enable multi-tenants feature or want to use Dashboard, please set the field `OPENSDS_AUTH_STRATEGY=keystone` in local.conf file:
```shell
cd $GOPATH/src/github.com/sodafoundation/api
vim install/devsds/local.conf
```

#### Run all services in one command!
Don't be surprised, you could do it in one command:
```
cd $GOPATH/src/github.com/sodafoundation/api && install/devsds/install.sh
```
If everything goes well, you will get some connection messages at the console output:
```shell
Execute commands blow to set up ENVs which are needed by SODA CLI:
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

### Multi-Cloud (Gelato)
Run command below to bootstrap multi-cloud.
```shell
curl -sSL https://raw.githubusercontent.com/sodafoundation/multi-cloud/master/script/bootstrap.sh | sudo bash
```
It will take a 10~15 minutes depending on the speed of your internet connection. After this docker and docker-compose which is needed by multi-cloud will be installed, and multi-cloud service will be started up too. If  OPENSDS_AUTH_STRATEGY was set as `keystone`, the script will create user, service, endpoint in keystone for multi-cloud automatically.

### Dashboard

```
export HOST_IP={ your_host_ip }
docker run -d --net=host --name opensds-dashboard -e OPENSDS_AUTH_URL=http://$HOST_IP/identity -e OPENSDS_HOTPOT_URL=http://$HOST_IP:50040 -e OPENSDS_GELATO_URL=http://$HOST_IP:8089 opensdsio/dashboard:latest
```

## Testing
### Testing local cluster using dashboard
Open your browser and input dashboard URL: http://$HOST_IP:8088 to enter OpenSDS dashboard. The following is the initial account for administrator user:
```
Username: admin
Password: opensds@123
```
### Testing SODA core projects api, controller and dock using CLI.
We have provided CLI for SODA, if you simply want to test SODA api+controller+dock, and do not want to deploy dashboard, CLI is a good choice.

#### Config osdsctl tool
```shell
sudo cp $GOPATH/src/github.com/sodafoundation/api/build/out/bin/osdsctl /usr/local/bin
```

#### Set some environment variables
```shell
export OPENSDS_ENDPOINT=http://127.0.0.1:50040
export OPENSDS_AUTH_STRATEGY=noauth # Set the value to keystone for multi-tenants.
```

If you choose keystone for authentication strategy, you need to execute different commands for logging in as different roles:
* For admin role
```shell
export OPENSDS_AUTH_STRATEGY=keystone
export OPENSDS_ENDPOINT=http://localhost:50040
export OS_AUTH_URL=http://$HOST_IP/identity
export OS_USERNAME=admin
export OS_PASSWORD=opensds@123
export OS_TENANT_NAME=admin
export OS_PROJECT_NAME=admin
export OS_USER_DOMAIN_ID=default

NOTE: **Export HOST_IP env variable ex: export HOST_IP=127.0.0.1**
```

#### Create a volume of size 1 GB
```
osdsctl volume create 1 --name=test-001
```

#### List all volumes
```
osdsctl volume list
```

#### Delete the volume
```
osdsctl volume delete <your_volume_id>
```

## Uninstall the local cluster
### OpenSDS(Hotpot)
It's also nice to uninstall the cluster with one command:
```
cd $GOPATH/src/github.com/sodafoundation/api && install/devsds/uninstall.sh
```

If you want to destroy the cluster, please run the command below instead:
```
cd $GOPATH/src/github.com/sodafoundation/api && install/devsds/uninstall.sh --purge
```
### Multi-Cloud
```
cd $GOPATH/src/github.com/sodafoundation/multi-cloud
docker-compose down
```
### Dashboard
```
docker stop opensds-dashboard
docker rm opensds-dashboard
```

Hope you enjoyed it! Any suggestions are welcome.