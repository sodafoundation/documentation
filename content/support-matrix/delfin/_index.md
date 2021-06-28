---
title: Delfin
menuTitle: Delfin
description: "Support matrix data for drivers of Delfin project"
weight: 10
disableToc: false
tags: ["support matrix", "delfin", "drivers"] 
---

Delfin project aims to overcome a challenge to manage heterogeneous storage devices on a single platform.
Delfin has standardized common API services. 

| vendor                                              | model                     | Version ( Device Manager )         | Access Mechanism (IPV4) | Type    | Basic Device Information | Storage Pool | LUN | Controller | Port | Disk | Qtree | Quota | File system | Share | Capacity Information | SNMP Trap | Alarm Query | Alarm Clearance | Performance Metrics | Remarks/Constraints                                                                                                                                                                                     |   |
|-----------------------------------------------------|---------------------------|------------------------------------|-------------------------|---------|--------------------------|--------------|-----|------------|------|------|-------|-------|-------------|-------|----------------------|-----------|-------------|-----------------|---------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---|
| Dell EMC                                            | VMAX3, VMAX AFA, PowerMax | Unisphere 8.4 or later             | REST                    | Block   | √                        | √            | √   | ×          | ×    | ×    | NA    | NA    | NA          | NA    | √                    | ×         | ×           | ×               | √                   | 1.The Embedded Management suite needs to be installed on the VMAX array to support Embedded Unisphere. 2\. Performance metric collection is only Alpha version and supports only device level metrics . |   |
| Dell EMC                                            | Unity                     | 4.3–5.3                            | REST                    | Unified | √                        | √            | √   | √          | √    | √    | √     | √     | √           | √     | √                    | √         | √           | ×               | ×                   |                                                                                                                                                                                                         |   |
| Dell EMC                                            | VNX (Block)               | 4.30 or later                      | CLI                     | Block   | √                        | √            | √   | √          | √    | √    | NA    | NA    | NA          | NA    | √                    | √         | ×           | ×               | ×                   | 1\. Before connecting a Dell EMC VNX Block storage device, install Navisphere Secure CLI on delfin installed node.                                                                                      |   |
| Dell EMC                                            | VPLEX                     | 5.5–6.1                            | REST                    | Block   | √                        | √            | √   | √          | √    | ×    | NA    | NA    | NA          | NA    | √                    | √         | ×           | ×               | ×                   | 1\. Only the VPLEX local mode is supported.                                                                                                                                                             |   |
| HPE                                                 | 3PAR                      | 3.1.2 or later, WSAPI 1.2 or later | REST + SSH              | Unified | √                        | √            | √   | √          | √    | √    | ×     | ×     | ×           | ×     | √                    | √         | √           | √               | ×                   |                                                                                                                                                                                                         |   |
| IBM                                                 | Storewize, SVC            | 6.2–7.8                            | SSH                     | Block   | √                        | √            | √   | √          | √    | √    | NA    | NA    | NA          | NA    | √                    | √         | √           | √               | ×                   |                                                                                                                                                                                                         |   |
| Hitachi                                             | VSP                       | 88-01-0X-XX/XX or later            | REST                    | Block   | √                        | √            | √   | √          | √    | √    | NA    | NA    | NA          | NA    | √                    | √         | √           | ×               | ×                   | 1\. The Configuration Manager REST service needs to be installed on the VSP devices.                                                                                                                    |   |
| Huawei                                              | OceanStor                 | V3/V5                              | REST                    | Unified | √                        | √            | √   | √          | √    | √    | √     | √     | √           | √     | √                    | √         | √           | √               | √                   |                                                                                                                                                                                                         |   |
| NetApp                                              | Cluster mode              | ONTAP 9.X                          | SSH                     | Unified | √                        | √            | √   | √          | √    | √    | √     | √     | √           | √     | √                    | √         | √           | √               | ×                   |                                                                                                                                                                                                         |   |
| Simulated Sample Driver (for testing the framework) | NA                        | NA                                 | NA                      | NA      | √                        | √            | √   | √          | √    | √    | √     | √     | √           | √     | √                    | √         | √           | √               | √                   | 1\. Used only for framework testing purpose                                                                                                                                                             |   |                                                           |                                                          |

Support matrix of each storage drivers are grouped by their vendor name.
Each driver support matrix includes below topics.


1. Model and management software versions supported:- List of storage models and required management software versions.  
2. Access information to register storage: Table illustrates what all access protocol supported and parameters required to register the storage device.  
3. Alert management information : Type of alert sourcing and clearing supported
4. Performance registration information: Table illustrates the resources, and their default interval supported for performance collection.
5. Resource data matrix: Table illustrates the resources supported along with their available attributes.
6. Alert data matrix : Table illustrates fields available in the alert data
7. Performance metric data: Table illustrates performance metrics supported for each resource.

{{% notice note %}}
Support matrix of drivers for Dell EMC VNX/VPLEX/Unity, IBM Storwize/SVC, Hitachi VSP, HPE 3PAR are currently not updated here. 
For details on any of these drivers, please contact slack channel [here](https://app.slack.com/client/T2YSV6N2J/C01FW6Y7YTD/thread/C01D1L72Z8D-1613845945.021400?cdn_fallback=1)  
{{% /notice %}}

{{%children style="h3" description="true" %}}  
