---
title: Object Lifecycle Management
description: "User guide for Object Lifecycle Management."
weight: 40
disableToc: false
tags: ["user guide", "object lifecycle"] 
---

## Introduction to Object lifecycle
OpenSDS is aimed at addressing the storage integration challenges of both the Cloud Native environment and traditional IT environment. OpenSDS multi-cloud allows user to manage distributed cloud environment on a single platform. Object lifecycle management feature gives freedom to user to manage buckets and objects in the cloud using OpenSDS interface.

## Getting Started!
This guide is a tutorial which shows how to install, configure, and use Object lifecycle management feature in a simple OpenSDS setup.
By following this guide you will be able to install OpenSDS multi-cloud with creating backends and buckets, uploading object and setting up the lifecycle for those objects.

## Installing Opensds multi-cloud

###Download opensds-installer code

```cassandraql
git clone https://github.com/opensds/opensds-installer.git
cd opensds-installer
# Checkout the latest release, give master by default or specify the branch 
git checkout master
```
####How to enable multi-cloud installation
  
Install docker container to run multi-cloud in container environment.
 
Update the file : opensds-installer/ansible/group_vars/gelato.yml to install multi-cloud.
```cassandraql
# repository branch
gelato_repo_branch: master
```
Detailed instruction is in this link

- [OpenSDS Local Cluster Installation through Ansible On Ubuntu](https://github.com/opensds/opensds/wiki/OpenSDS-Cluster-Installation-through-Ansible) (Recommended)

#####export required OPENSDS  environment variables
```
export HOST_IP={your_real_host_ip}
export OPENSDS_ENDPOINT=http://{{ apiserver_cluster_ip }}:50040
export OPENSDS_AUTH_STRATEGY=keystone
export OS_AUTH_URL=http://{{ authchecker_cluster_ip }}/identity
```
#####run OPENSDS multi-cloud in docker container**
```
docker-compose up -d
docker ps 
   ```
Note: check if multi-cloud services are running in the docker container.

## Open OpenSDS Object lifecycle management UI

OpenSDS Object lifecycle management feature specific UI can be accessed via

`http://{your_host_ip}:8088/#/home`

login  using the default admin credentials: `admin/opensds@123`. 

![multi-cloud UI image  ](opensds_home.PNG?raw=true)

### Create  new backend  using remote cloud bucket
Click on (+) for registering a storage backend

![multi-cloud backend image  ](opensds_backend.PNG?raw=true)

### Create bucket and upload the object
After creating new backend follow the steps given below to create a bucket and upload an object in that bucket:
1. Launch Resource from OpenSDS home page

2. Create a new bucket with appropriate backend

	![multi-cloud bucket image  ](opensds_bucket.PNG?raw=true)
3. Click on upload button to upload an object in the selected bucket

	![multi-cloud object image  ](opensds_object.PNG?raw=true)
4. Click on lifecycle tab and create a new lifecycle rule

	![multi-cloud lifecycle image  ](opensds_lifecycle.PNG?raw=true)

After creating the lifecycle rule user will be able to see the lifecycle configuration on bucket.

![multi-cloud lifecycle config image  ](opensds_lifecycle_config.PNG?raw=true)

Save dashboard and return.
### Check lifecycle in remote cloud service provider
After configuring lifecycle in dashboard, a routine scheduler will run and it will wait till the date lifecycle rule comes in-effect. Once the action is performed user can log in to remote cloud ( backend cloud service provider) and check the object status.

### FAQ
1. How to check if the lifecycle rule is applied on bucket/object ?

Ans: 
OpenSDS does not create the rule in the cloud backend (CSP) , so once the bucket/object satisfies the rule OpenSDS will automatically call cloud API and the action will be taken place. If there are any sort of errors or issues in rule, user will know at the time of lifecycle action.
