---
title: Storage Service Plan
description: "User guide for Storage Service Plan(SSP) Management."
weight: 10
disableToc: false
tags: ["user guide", "storage service plan", "multi-cloud"]
---

## Introduction to Storage Service Plan(SSP) management
SODA is aimed at addressing the storage integration challenges of both the Cloud Native environment and traditional IT environment. SODA multi-cloud allows service providers(admin) or users to manage distributed cloud and on-premise environments from a single platform.


SSP management allows service providers to abstract actual cloud or on-premise environments(backends) from their users.
In other words, SSP is a policy for the users. A service provider can decide and create different types of SSP policy for different tenants of users.

## Getting Started!
This is a guide that shows how to install, configure, and use SSP management features in a simple SODA setup.
By following this guide users will be able to install SODA multi-cloud and able to create backends, buckets, upload and archive objects.

## Installing SODA multi-cloud

Follow the installation guide for multi-cloud installation.

* To enable SSP feature, and experience through SODA Dashboard modify the "enable_storage_service_plans" variable and then install:

  group_vars/common.yml

  ```
  enable_storage_service_plans: true
  ```

- [SODA Local Cluster Installation through Ansible On Ubuntu](https://github.com/opensds/opensds/wiki/OpenSDS-Cluster-Installation-through-Ansible) (Recommended)


## SODA Dashboard - Experience SODA features with GUI

SODA UI can be accessed via

`http://{your_host_ip}:8088/#/home`

login  using the default admin credentials: `admin/opensds@123`.

![multi-cloud UI image  ](soda_login_page.png?raw=true)

### Create new backend as cloud or on-prem storage: [Admin Operation]

**Note**: When SSP is enabled, registration of storage backends are only allowed for admin. i.e registration of storage backends are not allowed for users or non-admin users. Because, the main use case of SSP is abstracting the storage backends from users.

Click on (+) for registering a storage backend

![multi-cloud backend image  ](register-backend-0.png?raw=true)

and then provide valid region, endpoint, Access and Secret Key parameters

![multi-cloud backend image  ](registerBackend.png?raw=true)

### Create Storage Service Plan: [Admin Operation]

**Note**: Again this is an admin operation and non-admin users are not allowed to create service plans. Non-admin users can only list and select the service plan during bucket creation.

1. Once backends are registered, storage service plans can be created.

  a.  Click on "Storage Service Plan" from the user menu in the top right corner.

  ![SSP image  ](SSP.png?raw=true)

  b. Create the Storage Service Plan

  ![SSP Create image  ](SSP_Create.png?raw=true)

### Create bucket and upload the object using SSP
After creating new backend follow the steps given below to create a bucket and upload an object in that bucket:

1. Launch Resource from SODA home page

2. Create a new bucket by selecting appropriate SSP plan

	![multi-cloud bucket image  ](SSP_CreateBucket.png?raw=true)
3. Click on upload button to upload an object in the selected bucket

	![multi-cloud object image  ](SSP_Upload.png?raw=true)

4. Click on Archive button to upload and archive an object in the  selected bucket

  ![multi-cloud object image  ](SSP_Archive.png?raw=true)

5. Click on Restore and Download for archived objects

  ![multi-cloud object image  ](SSP_Restore.png?raw=true)
