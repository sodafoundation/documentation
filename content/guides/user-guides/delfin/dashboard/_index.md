---
title: Storage Infrastructure Management(SIM) using SODA Dashboard
menuTitle: SIM using SODA Dashboard
description: "User guide for Monitoring through Delfin integrated SODA Dashboard"
weight: 10
disableToc: false
tags: ["user guide", "delfin", "dashboard"] 
---

delfin (Dolphin in Spanish!), the SODA Infrastructure Manager project is an open source project to provide unified, intelligent and scalable resource management, alert and performance monitoring. It covers the resource management of all the storage backends & other infrastructures under SODA deployment. It also provides the alert management and metric data(performance/health) for monitoring and further analysis.

It provides unified APIs to access, export and connect with clients as well as a set of interfaces for various driver additions. These APIs combined with the SODA Dashboard provide a graphical interface that allows users to manage storage backends and visualize the metrics and health.

### Delfin Features
- [Register a Storage Device](#register-storage-device)
    - [REST Access](#rest-access)
    - [SSH Access](#ssh-access)
- [Storage Summary](#storage-summary)
    - [Grid View](#grid-view)
        - [Tree View Widget](#storage-array-tree-view-widget)
        - [Active Alerts Widget](#active-alerts-widget)
        - [Array Usable Capacity Widget](#array-usable-capacity-widget)
        - [Array Raw Capacity Widget](#array-raw-capacity-widget)
    - [List View](#list-view)
- [Storage Device Actions](#storage-device-actions)
    - [Update access Info](#update-access-info)
    - [Configure Alert Source](#configure-alert-source)
    - [Remove Alert Source](#remove-alert-source)
    - [Sync Storage Device](#sync-storage-device)
    - [Configure Metric collection](#configure-metric-collection)
    - [Delete Storage Device](#delete-storage-device)
- [Storage Device Details](#storage-device-details)
    - [Storage Device Basic Details](#storage-device-basic-details)
    - [Storage Device Capacity Summary](#storage-device-capacity-summary)
    - [Storage Device Alerts](#storage-device-alerts)
    - [Storage Device Performance Monitoring](#storage-device-performance-monitoring)
- [Performance Monitor](#performance-monitor)
- [Alertmanager](#alertmanager)




### Register Storage Device  
##### [\[Back to top\]](#delfin-features)  

Currently supported vendors include `Dell EMC`, `Huawei`, `HPE`, `Hitachi`, `IBM`, `Fujitsu`, `NetApp`, `Pure Storage`.  
To register a storage device select one of the Vendor and one of the models listed.
![Select vendor and model](delfin-user-guide-6.png)

Depending on the vendor and model enter the access info. Delfin supports both REST and SSH methods.  

#### REST Access
##### [\[Back to top\]](#delfin-features)  



{{% notice tip %}}
**For devices that utilise the REST access mechanism the following parameters are needed:**  
    - **Host IP**: IP address of the storage device  
    - **Port**: Port on the device which is accessible  
    - **Username**: Valid username  
    - **Password**: Valid Password  
{{% /notice %}}
![Delfin User Guide - 7](delfin-user-guide-7.png)

#### SSH Access
##### [\[Back to top\]](#delfin-features)  

{{% notice tip %}}
**For devices that utilise the SSH access mechanism the following parameters are needed:**  
    - **Host IP**: IP address of the storage device  
    - **Port**: Port on the device which is accessible  
    - **Username**: Valid username  
    - **Password**: Valid Password  
    - **Public Key Type**: Delfin supports public key authentication of SSH. Valid Pub key types are `ssh-ed25519`, `ecdsa-sha2-nistp256`, `ecdsa-sha2-nistp384`, `ecdsa-sha2-nistp521`, `ssh-rsa`, `ssh-dss`.   
    - **Public Key**: valid public key based on the type selected.  
{{% /notice %}}
![Delfin User Guide - 41](delfin-user-guide-41.png)


### Storage Summary 
##### [\[Back to top\]](#delfin-features)  

The storage summary page is an aggregated view of all the storage devices, alerts, usable and raw capacities.
This page contains a default *Grid View* and an alternate *List View*.  

This is where you view the storage summary
1. Tree View Widget: all storage devices
2. List all alerts summary widget
3. Array usable capacity widget
4. Array Raw capacity widget
5. Toggle List view / Grid view
6. List view : All storage devices
7. List View : All active alerts

#### Grid View  
##### [\[Back to top\]](#delfin-features)  
The *Grid View* has 4 different widgets:  
- Storage Arrays - Tree view
- Active alerts on Storage Devices
- Array Usable Capacity Summary
- Array Raw Capacity Summary

![Delfin User Guide - 1](delfin-user-guide-1.png)

#### Storage Array Tree View Widget  
##### [\[Back to top\]](#delfin-features)  
The tree view widget displays all the registered storage arrays categorised by Vendor and Model.  

**Model Overview**  

Hovering on the model name of the storage device shows an overview panel with quick information about the model of storage device and aggregated stats of all the storage devices of that model as follows;
- Vendor
- Number of Devices
- Total Raw Capacity
- Total Subscribed Capacity
- Total System Used 
- Usable capacity summary

![Delfin User Guide - 42](delfin-user-guide-42.png)

**Device Overview**  

Hovering on the device name in the tree view shows an overview panel with quick information about the storage device. The following information is shown:
- Name of the Device
- Status
- Vendor
- Model
- Raw capacity
- Subscribed Capacity
- System used
- Usable Capacity Summary

![Delfin User Guide - 8](delfin-user-guide-8.png)

On clicking the  `>` symbol to the left the tree view expands to show the resources of a Storage Array. The following resources and the counts can be seen:
- Volumes
- Storage Pools
- Controllers
- Ports
- Disks  


![Delfin User Guide - 9](delfin-user-guide-9.png)
![Delfin User Guide - 10](delfin-user-guide-10.png)

Hovering on the Volumes parent element will show a quick overview panel with the follwoing information:
- Number of volumes
- Usable capacity summary (aggregated)

![Delfin User Guide - 11](delfin-user-guide-11.png)

Hovering on the Storage pools parent element will show a quick overview panel with the following information:
- Number of Storage pools
- Usable capacity summary (aggregated)

![Delfin User Guide - 12](delfin-user-guide-12.png)

Expanding the Volumes, Storage Pools, Controllers, Ports and Disks parent nodes will display the respective list of individual nodes.  
Hovering on them will show a quick overview panel with relevant information (as shown below)

**Volume Quick Overview**
![Delfin User Guide - 43](delfin-user-guide-43.png)
**Storage Pool Quick Overview**
![Delfin User Guide - 44](delfin-user-guide-44.png)

**Controller Quick Overview**
![Delfin User Guide - 45](delfin-user-guide-45.png)

**Port Quick Overview**
![Delfin User Guide - 14](delfin-user-guide-14.png)

**Disk Quick Overview**
![Delfin User Guide - 15](delfin-user-guide-15.png)

#### Active Alerts Widget  
##### [\[Back to top\]](#delfin-features)  

This widget displays a table with the latest active alerts that are reported by delfin and generated by the Prometheus / Alertmanager rules.  
![Delfin User Guide - 48](delfin-user-guide-48.png)

#### Array Usable Capacity Widget
##### [\[Back to top\]](#delfin-features)  

This widget lists the storage arrays and displays the usable capacity summary for each device.
![Delfin User Guide - 49](delfin-user-guide-49.png)

#### Array Raw Capacity Widget
##### [\[Back to top\]](#delfin-features)  

This widget lists the storage arrays and displays the raw capacity summary for each device.
![Delfin User Guide - 50](delfin-user-guide-50.png)

#### List View
##### [\[Back to top\]](#delfin-features)  
Switching to the list view displays all the storage devices and alerts ina tabular way.

**All Storage Devices**
![Delfin User Guide - 2](delfin-user-guide-2.png)

**Storage Device Details - Expanded**
![Delfin User Guide - 51](delfin-user-guide-51.png)

**All Active Alerts**
![Delfin User Guide - 3](delfin-user-guide-3.png)

**Alert Details - Expanded**
![Delfin User Guide - 4](delfin-user-guide-4.png)



### Storage Device Actions
##### [\[Back to top\]](#delfin-features)  


Actions are available in the right-click menu in tree view and by clicking on "More" under the operations column in the list view table.  
The following actions are supported:  
1. Update access Info
2. Configure Alert Source
3. Remove Alert Source
4. Sync Storage Device
5. Configure Metric collection
6. Delete Storage Device

**List View Actions**
![Delfin User Guide - 5](delfin-user-guide-5.png)

**Tree View Actions**
![Delfin User Guide - 16](delfin-user-guide-16.png)

### Update Access Info
##### [\[Back to top\]](#delfin-features)  
![Delfin User Guide - 18](delfin-user-guide-18.png)

### Configure Alert Source 
##### [\[Back to top\]](#delfin-features)  

**SNMPV2C**  

{{% notice tip %}}
**The parameters that are needed for Registering a SNMPV2C alert source**  
    - **Host**: IP address of the Host  
    - **Commnity String**:   Community string. This should be filled if version is V2C  
    - **Port**:  Port for connecting to alert source By default, set to 161  
    - **Max retries**: Maximum number of retries while connecting to alert source By default, set to 1  
    - **Context name**:  Context name of the alert source  
    - **Expiration time (sec)**  : Expiration time (in sec) for one alert source connect request By default, set to 2  
{{% /notice %}}

![Delfin User Guide - 19](delfin-user-guide-19.png)

**SNMPV3**

{{% notice tip %}}
**The parameters that are needed for registering a SNMPV3 alert source**  
    - **Host**: IP address of the Host  
    - **Username**:   SNMPV3 username.  
    - **Engine ID**: Engind ID of the device which will be sending the traps. Must be a hexadecimal octet string.  
    - **Security Level**: Security level for the user. Supported Security levels are `noAuthnoPriv`, `authNoPriv`, `authPriv`.  
    - **Auth Protocol**: Enabled if security level is `authNoPriv` or `authPriv`. Supported protocols are `HMACSHA`, `HMACMD5`, `HMCSHA2224`, `HMCSHA2256`, `HMCSHA2384`, `HMCSHA2512`.  
    - **Auth Key**: The appropriate authentication key based on the selected auth protocol.  
    - **Privacy Protocol**: Enabled if security level is `authPriv`. Supported protocols are `DES`, `AES`, `AES192`, `AES256`, `3DES`.  
    - **Privacy Key**: The appropriate privacy key based on the selected privacy protocol.  
    - **Port**:  Port for connecting to alert source By default, set to 161  
    - **Max retries**: Maximum number of retries while connecting to alert source By default, set to 1  
    - **Context name**:  Context name of the alert source  
    - **Expiration time (sec)**  : Expiration time (in sec) for one alert source connect request By default, set to 2  
{{% /notice %}}

![Delfin User Guide - 20](delfin-user-guide-20.png)
![Delfin User Guide - 21](delfin-user-guide-21.png)
![Delfin User Guide - 21](delfin-user-guide-21-1.png)

### Remove Alert Source
##### [\[Back to top\]](#delfin-features)  
![Delfin User Guide - 22](delfin-user-guide-22.png)

### Sync Storage Device
##### [\[Back to top\]](#delfin-features)  
![Delfin User Guide - 23](delfin-user-guide-23.png)

### Configure Metric Collection
##### [\[Back to top\]](#delfin-features)  
![Delfin User Guide - 24](delfin-user-guide-24.png)
![Delfin User Guide - 25](delfin-user-guide-25.png)

### Delete Storage Device
##### [\[Back to top\]](#delfin-features)  
![Delfin User Guide - 52](delfin-user-guide-52.png)

### Storage Device Details
##### [\[Back to top\]](#delfin-features)  

This is where you view the storage device details
1. Configuration :  Basic details
    - Volumes
    - Storage Pools
    - Controllers
    - Ports
    - Disks
2. Capacity: Capacity summary for the storage device
3. Alerts: All generated alerts for the storage device if alert source is specified.
4. Performance Monitoring: Visualization of metrics using graphs if performance monitoring is enabled.

#### Storage Device Basic Details
##### [\[Back to top\]](#delfin-features)  
![Delfin User Guide - 26](delfin-user-guide-26.png)

**Storage Device Details - Volume List**
![Delfin User Guide - 27](delfin-user-guide-27.png)
**Storage Device Details - Volume Expanded**
![Delfin User Guide - 27-1](delfin-user-guide-27-1.png)

**Storage Device Details - Storage Pool List**
![Delfin User Guide - 28](delfin-user-guide-28.png)
**Storage Device Details - Storage Pool Expanded**
![Delfin User Guide - 28-1](delfin-user-guide-28-1.png)

**Storage Device Details - Controller List**
![Delfin User Guide - 29](delfin-user-guide-29.png)
**Storage Device Details - Controller Expanded**
![Delfin User Guide - 29-1](delfin-user-guide-29-1.png)

**Storage Device Details - Ports List**
![Delfin User Guide - 30](delfin-user-guide-30.png)
**Storage Device Details - Ports Expanded**
![Delfin User Guide - 30-1](delfin-user-guide-30-1.png)

**Storage Device Details - Disks List**
![Delfin User Guide - 31](delfin-user-guide-31.png)
**Storage Device Details - Disks Expanded**
![Delfin User Guide - 31-1](delfin-user-guide-31-1.png)

#### Storage Device Capacity Summary
##### [\[Back to top\]](#delfin-features)  
![Delfin User Guide - 32](delfin-user-guide-32.png)
![Delfin User Guide - 33](delfin-user-guide-33.png)

#### Storage Device Alerts
##### [\[Back to top\]](#delfin-features)  
![Delfin User Guide - 34](delfin-user-guide-34.png)

#### Storage Device Performance Monitoring
##### [\[Back to top\]](#delfin-features)  
![Delfin User Guide - 35](delfin-user-guide-35.png)
![Delfin User Guide - 36](delfin-user-guide-36.png)


### Performance Monitor
##### [\[Back to top\]](#delfin-features)  

This is where you view the performance monitoring information across the storage devices
![Delfin User Guide - 37](delfin-user-guide-37.png)
![Delfin User Guide - 38](delfin-user-guide-38.png)
![Delfin User Guide - 39](delfin-user-guide-39.png)


### Alertmanager
##### [\[Back to top\]](#delfin-features)  

This Alertmanager link in the sidebar menu launches the Alertmanager UI.

![Delfin User Guide - 40](delfin-user-guide-40.png)






