---
title: SODA Projects
description: "This page provides the details of SODA Projects"
weight: 4
disableToc: false
---
[SODA Foundation](https://sodafoundation.io) is a home for multiple projects for building a unified data framework to support various data and storage solutions. Here is a brief description of all the projects maintained by SODA Foundation. 

<!-- Soda Project Architecutre Diagram -->
![SODA Projects Architecture](soda-project-architecture.png)

- ### SODA Dashboard 
    SODA Dashboard provides a unified interface to the underlying capabilities from the SODA Framework components. This dashboard is built mainly to illustrate/showcase various use cases that could run on SODA ecosystem projects.

    Technically, it is a direct client to SODA API and other projects which are getting integrated to SODA Ecosystem. It will be reference integration of all the underlying projects to realize various use cases.

    Every SODA release will have the SODA Dashboard with new use cases integrated based on the new features or projects integrated to SODA project ecosystem.

    [Source Code Repository](https://github.com/sodafoundation/dashboard)

- ### SODA Delfin
    delfin (Dolphin in Spanish!), the SODA Infrastructure Manager project is an open source project to provide unified, intelligent and scalable resource management, alert and performance monitoring. It covers the resource management of all the backends & other infrastructures under SODA deployment. It also provides  alert management and metric data (performance/health) for monitoring and further analysis.

    It provides a scalable framework where more and more backends as well as client exporters can be added. This enables to add more storage and infrastructure backends and also support different management clients for monitoring and health prediction.

    It provides unified APIs to access, export and connect with clients as well as a set of interfaces for various driver additions.
    The vision is to build a unified intelligent and scalable infrastructure management framework for resource management (config, add, remove, update), alert management and performance metrics management with standardized APIs across any storage and application platforms with connectors for data analysis and prediction.

    [Source Code Repository](https://github.com/sodafoundation/delfin)
    
    [Support Matrix](https://docs.sodafoundation.io/support-matrix/delfin/)

- ### SODA API
     The SODA API, Provides the standardization for Data / Storage Management APIs. At present, block and file APIs for key features of data management (provisioning, migration, fileshare, etc) are supported. 

    This is the key external interface to platforms which can do a seamless integration with heterogeneous storage backends. 

    Users can develop SODA North-Bound Plugins (SODA NBP) under SODA NBP project to connect any platform or application solutions to SODA API from north for all storage/data requirements.

    This is envisioned to be the reference implementation of SODA Data Standard API Specification, with contributions from industry partners and standards bodies. At that stage, this layer will upgraded to support Block, File and Object APIs across the Edge, Core and Cloud.

    [Source Code Repository](https://github.com/sodafoundation/api)

- ### SODA Controller
    The SODA Controller, provides metadata management, control/configurations, scheduler and all such book-keeping features and utilities. In the API flow from SODA API to SODA Dock, controller plays a critical role for all the API flow management and tracking to handle all the state machine and metadata management requirements. This is a layer to keep addons to new facilities or utilities for the SODA platform.

    At present, this layer can be optional or similar modules can be used from users(if they have such software components). However, users need to integrate the Controller modules with SODA API and SODA Dock.

    The Controller interfaces with SODA API and SODA Dock.

    [Source Code Repository](https://github.com/sodafoundation/controller)

- ### SODA Dock
    SODA Dock is a docking station for heterogeneous storage backends! This is where all the different storage vendors drivers for various storage backend models get attached.

    The goal is to make most of the protocols and backends supported as close as ‘plug n play’. Currently, each storage backend needs a thin, easy to develop SODA Driver Plugin to connect the storage backend to the Dock. SODA Driver Plugin and Storage vendor driver together it can be called SODA Driver for xxx vendor yy model storage.SODA Driver can support one or more or multiple classes of storage backends.

    To connect more and more cloud-native storages seamlessly with the SODA Platform,there is an experimental feature for CSI PlugNPlay is developed. This will immediately enable any CSI driver to work with SODA using a single SODA CSI plugin for the application platform (like Kubernetes), in turn, support all the storage vendors supporting CSI.

    SODA Dock can interface directly to SODA API or via Controller. However, it is recommended through the controller for a complete end to end solution, as it can provide the metadata management, handling multiple docks, etc.

    The roadmap is to have multiple instances, multi-driver docks to support multi-cluster, multi-platform, or multi-cloud scenarios in the future.

    [Source Code Repository](https://github.com/sodafoundation/dock)

- ### SODA Plugin
    SODA Plugins enable awareness and seamless integration between SODA and compute platforms or application frameworks.

    SODA provides plugins for Kubernetes, OpenStack and VMWare.
    
     [SODA Cloud Native Storage For Kubernetes CSI](https://sodafoundation.io/projects/soda-plugins/kubernetes/)

     [SODA Cinder Block & Manila File Services For OpenStack](https://sodafoundation.io/projects/soda-plugins/openstack/)

     [SODA VASA For Vmware](https://sodafoundation.io/projects/soda-plugins/vmware/)

     [Support Matrix](https://docs.sodafoundation.io/support-matrix/nbp/)

- ### SODA Multicloud
    SODA Multicloud provides a cloud vendor agnostic data management for hybrid cloud, intercloud, or intracloud. The goal is to provide a unified interface to support file, block,and object services across multiple cloud vendors. It can be hosted on-premise or in the cloud.

    For object data management, it provides a backend manager which is S3 compatible APIs to connect with any cloud vendors. Currently, MS Azure, GCP, AWS, Huawei, IBM, Alibaba backends are supported and getting updated with new backends regularly.

    It also supports Ceph backed to enable on-prem. China Unicom has integrated their YIG project into SODA Multicloud, enabling Ceph to be used as a massively scalable backend object storage.

    SODA multi-cloud also supports creating Storage Service Plans(SSP) for creating tenant based access to multi-cloud storages.

    Basic file service support is added for AWS, Azure, GCP and Huawei and basic block service support is added for AWS EBS and Huawei.

    The technical team is exploring to extend SODA Multicloud and other key layers of SODA into a distributed data store which can support block, file and object data management across the edge, on-premise, and cloud 

    [Source Code Repository](https://github.com/sodafoundation/multi-cloud)

    [Support Matrix](https://docs.sodafoundation.io/support-matrix/multi-cloud/)

 - Source code for other projects are maintained under [SODA Foundation github organization](https://github.com/sodafoundation)
 
