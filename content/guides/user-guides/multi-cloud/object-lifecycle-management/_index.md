---
title: Object Lifecycle
description: "User guide for Object Lifecycle Management."
weight: 10
disableToc: false
tags: ["user guide", "object lifecycle", "multi-cloud"]
---

## Introduction to Object lifecycle
SODA is aimed at addressing the storage integration challenges of both the Cloud Native environment and traditional IT environment. SODA multi-cloud allows user to manage distributed cloud environment on a single platform. Object lifecycle management feature gives freedom to user to manage buckets and objects in the cloud using SODA interface.

## Getting Started!
This is a guide that shows how to install, configure, and use Object lifecycle management feature in a simple SODA setup.
By following this guide you will be able to install SODA multi-cloud with creating backends and buckets, uploading object and setting up the lifecycle for those objects.

## Installing SODA multi-cloud

### Download SODA-installer code

```cassandraql
git clone https://github.com/sodafoundation/installer.git
cd installer
# Checkout the latest release, give master by default or specify the branch
git checkout master
```

### How to enable multi-cloud installation

Install docker container to run multi-cloud in container environment.

Update the file : opensds-installer/ansible/group_vars/gelato.yml to install multi-cloud.
```cassandraql
# repository branch
gelato_repo_branch: master
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

## Open SODA Object lifecycle management UI

SODA Object lifecycle management feature specific UI can be accessed via

`http://{your_host_ip}:8088/#/home`

login  using the default admin credentials: `admin/opensds@123`.

![multi-cloud UI image  ](soda_login_page.png?raw=true)

### Create  new backend  using remote cloud bucket
Click on (+) for registering a storage backend

![multi-cloud backend image  ](register-backend-0.png?raw=true)

and then provide valid region, endpoint, Access and Secret Key parameters

##### Note:
For cloud vendors like AWS, Azure, Huawei and GCP remote cloud buckets need not be created manually by user prior to backend registration. Remote cloud buckets can be created from SODA for these cloud vendors

![multi-cloud backend image  ](register-backend.png?raw=true)

For other cloud vendors like IBM, Ceph, YIG and Alibaba, register backend using remote cloud bucket

![multi-cloud backend image  ](opensds_backend.PNG?raw=true)

### Create bucket and upload the object
After creating new backend follow the steps given below to create a bucket and upload an object in that bucket:
1. Launch Resource from SODA home page

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
SODA does not create the rule in the cloud backend (CSP). Once the bucket/object satisfies the rule, SODA will automatically call cloud API and the action will be performed. If there are any errors or issues in rule, user will know at the time of lifecycle action.
