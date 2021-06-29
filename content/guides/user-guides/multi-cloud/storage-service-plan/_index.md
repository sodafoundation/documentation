---
title: Storage Service Plan
description: "User guide for Storage Service Plan(SSP) Management."
weight: 10
disableToc: false
tags: ["user guide", "storage service plan", "multi-cloud"]
---

## Introduction to Storage Service Plan(SSP) management
SODA is aimed at addressing the storage integration challenges of both the Cloud Native environment and traditional IT environment. SODA multi-cloud allows service providers(admin) or users to manage distributed cloud and on-premise environments on a single platform.


SSP management allows service providers to abstract actual cloud or on-premise environments(backends) from their users.
In other words, SSP is a policy for the users. A service provider can decide and create different types of SSP policy for different tenants of users.

## Getting Started!
This is a guide that shows how to install, configure, and use SSP management feature in a simple SODA setup.
By following this guide you will be able to install SODA multi-cloud with creating backends and buckets, uploading and archiving objects.

## Installing SODA multi-cloud

### Download SODA-installer code

```cassandraql
git clone https://github.com/sodafoundation/installer.git
cd installer/ansible
# Checkout the latest release, give master by default or specify the branch
git checkout master
```

### How to enable multi-cloud installation with SSP feature

Install docker container to run multi-cloud in container environment.

Update the file :

a. group_vars/gelato.yml to install multi-cloud.
```cassandraql
# repository branch
gelato_repo_branch: master
```

b. group_vars/common.yml to enable SSP feature

```
enable_storage_service_plans: true
```
Detailed instruction is in this link

- [SODA Local Cluster Installation through Ansible On Ubuntu](https://github.com/opensds/opensds/wiki/OpenSDS-Cluster-Installation-through-Ansible) (Recommended)

#### Export required SODA  environment variables
```
export HOST_IP={your_real_host_ip}
export OPENSDS_ENDPOINT=http://{{ apiserver_cluster_ip }}:50040
export OPENSDS_AUTH_STRATEGY=keystone
export OS_AUTH_URL=http://{{ authchecker_cluster_ip }}/identity
```
#### Run SODA multi-cloud in docker container
```
docker-compose up -d
docker ps
   ```
Note: check if multi-cloud services are running in the docker container.
```cassandraql
# docker ps
CONTAINER ID        IMAGE                             COMMAND                  CREATED             STATUS              PORTS                                                NAMES
3222f0b4c25d        opensdsio/multi-cloud-dataflow    "/dataflow"              2 minutes ago       Up 2 minutes                                                             multi-cloud_dataflow_1_4a975c39f8ff
33de3d47b1ef        opensdsio/multi-cloud-datamover   "/datamover"             2 minutes ago       Up 2 minutes                                                             multi-cloud_datamover_1_8ccb3d34f551
3d3661466b3d        wurstmeister/kafka:2.11-2.0.1     "start-kafka.sh"         2 minutes ago       Up 2 minutes        0.0.0.0:9092->9092/tcp                               multi-cloud_kafka_1_e399b2c2167a
e370acd6c922        mongo                             "docker-entrypoint.s…"   2 minutes ago       Up 2 minutes        0.0.0.0:27017->27017/tcp                             multi-cloud_datastore_1_a8c5edcc4e62
6d5239b01503        wurstmeister/zookeeper            "/bin/sh -c '/usr/sb…"   2 minutes ago       Up 2 minutes        22/tcp, 2888/tcp, 3888/tcp, 0.0.0.0:2181->2181/tcp   multi-cloud_zookeeper_1_82daeecd7252
7d9f01911356        opensdsio/multi-cloud-backend     "/backend"               2 minutes ago       Up 2 minutes                                                             multi-cloud_backend_1_b9cbaa8bcf83
f139d2e383ab        opensdsio/multi-cloud-s3          "/s3"                    2 minutes ago       Up 2 minutes                                                             multi-cloud_s3_1_3c7878089fa4
```

## Open SODA User Interface Dashboard

SODA UI can be accessed via

`http://{your_host_ip}:8088/#/home`

login  using the default admin credentials: `admin/opensds@123`.

![multi-cloud UI image  ](soda_login_page.png?raw=true)

### Create new backend as cloud or on-prem storage: [Admin Operation]

Note: When SSP is enabled, registration of storage backends are only allowed for admin. i.e registration of storage backends are not allowed for users or non-admin users. Because, the main use case of SSP is abstracting the storage backends from users.

Click on (+) for registering a storage backend

![multi-cloud backend image  ](register-backend-0.png?raw=true)

and then provide valid region, endpoint, Access and Secret Key parameters

![multi-cloud backend image  ](register-backend.png?raw=true)

### Create Storage Service Plan: [Admin Operation]

Note: Again this is an admin operation and non-admin users are not allowed to create service plans. Non-admin users can only list and select the service plan during bucket creation.

1. Once backends are registered, storage service plans can be created.

  a.  Select the Storage Service Plan

  ![SSP image  ](SSP.png?raw=true)

  b. Create the Storage Service Plan

  ![SSP Create image  ](SSP_create.png?raw=true)

### Create bucket and upload the object using SSP
After creating new backend follow the steps given below to create a bucket and upload an object in that bucket:

1. Launch Resource from SODA home page

2. Create a new bucket by selecting appropriate SSP plan

	![multi-cloud bucket image  ](SSP_CreateBucket.png?raw=true)
3. Click on upload button to upload an object in the selected bucket

	![multi-cloud object image  ](SSP_Upload.png?raw=true)

4. Click on Archive button to upload and archive an object in the selected bucket

  ![multi-cloud object image  ](SSP_Archive.png?raw=true)

5. Click on Restore and Download for archived objects

  ![multi-cloud object image  ](SSP_Restore.png?raw=true)
