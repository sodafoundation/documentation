---
title: SRM using SODA Dashboard
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
- [Storage Device Actions](#storage-device-actions)
    - Update access Info
    - Configure Alert Source
    - Remove Alert Source
    - Sync Storage Device
    - Configure Metric collection
    - Delete Storage Device
- [Storage Device Details](#storage-device-details)
- [Performance Monitor](#performance-monitor)
- [Alertmanager](#alertmanager)




### Register Storage Device  
##### [\[Back to top\]](#delfin-features)  

Currently supported vendors include `Dell EMC`, `Huawei`, `HPE`, `Hitachi`, `IBM`.  
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
**For devices that utilise the REST access mechanism the following parameters are needed:**  
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

This is where you view the storage summary
1. Tree View Widget: all storage devices
2. List all alerts summary widget
3. Array usable capacity widget
4. Array Raw capacity widget
5. Toggle List view / Grid view
6. List view : All storage devices
7. List View : All active alerts

![Delfin User Guide - 1](delfin-user-guide-1.png)
![Delfin User Guide - 2](delfin-user-guide-2.png)
![Delfin User Guide - 3](delfin-user-guide-3.png)
![Delfin User Guide - 4](delfin-user-guide-4.png)
![Delfin User Guide - 5](delfin-user-guide-5.png)

![Delfin User Guide - 8](delfin-user-guide-8.png)
![Delfin User Guide - 9](delfin-user-guide-9.png)
![Delfin User Guide - 10](delfin-user-guide-10.png)
![Delfin User Guide - 11](delfin-user-guide-11.png)
![Delfin User Guide - 12](delfin-user-guide-12.png)
![Delfin User Guide - 13](delfin-user-guide-13.png)
![Delfin User Guide - 14](delfin-user-guide-14.png)
![Delfin User Guide - 15](delfin-user-guide-15.png)


### Storage Device Actions
##### [\[Back to top\]](#delfin-features)  

All the actions that can be performed by the user on storage devices
Actions are available in the right-click menu in tree view and by clicking on "More" under the operations column in the list view table.
1. Update access Info
2. Configure Alert Source
3. Remove Alert Source
4. Sync Storage Device
5. Configure Metric collection
6. Delete Storage Device

![Delfin User Guide - 16](delfin-user-guide-16.png)
![Delfin User Guide - 17](delfin-user-guide-17.png)
![Delfin User Guide - 18](delfin-user-guide-18.png)
![Delfin User Guide - 19](delfin-user-guide-19.png)
![Delfin User Guide - 20](delfin-user-guide-20.png)
![Delfin User Guide - 21](delfin-user-guide-21.png)
![Delfin User Guide - 22](delfin-user-guide-22.png)
![Delfin User Guide - 23](delfin-user-guide-23.png)
![Delfin User Guide - 24](delfin-user-guide-24.png)
![Delfin User Guide - 25](delfin-user-guide-25.png)



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
![Delfin User Guide - 26](delfin-user-guide-26.png)
![Delfin User Guide - 27](delfin-user-guide-27.png)
![Delfin User Guide - 28](delfin-user-guide-28.png)
![Delfin User Guide - 29](delfin-user-guide-29.png)
![Delfin User Guide - 30](delfin-user-guide-30.png)
![Delfin User Guide - 31](delfin-user-guide-31.png)
![Delfin User Guide - 32](delfin-user-guide-32.png)
![Delfin User Guide - 33](delfin-user-guide-33.png)
![Delfin User Guide - 34](delfin-user-guide-34.png)
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

This button launches the Alertmanager UI.
![Delfin User Guide - 40](delfin-user-guide-40.png)






