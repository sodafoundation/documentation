---
title: SODA FrameWork Projects
description: "This page provides the details of SODA Projects"
weight: 3
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

    Delfin (Dolphin in Spanish!), the SODA Infrastructure Manager project is an open source project to provide unified, intelligent and scalable resource management, alert and performance monitoring. It covers the resource management of all the backends & other infrastructures under SODA deployment. It also provides  alert management and metric data (performance/health) for monitoring and further analysis.

    It provides a scalable framework where more and more backends as well as client exporters can be added. This enables to add more storage and infrastructure backends and also support different management clients for monitoring and health prediction.

    It provides unified APIs to access, export and connect with clients as well as a set of interfaces for various driver additions.
    The vision is to build a unified intelligent and scalable infrastructure management framework for resource management (config, add, remove, update), alert management and performance metrics management with standardized APIs across any storage and application platforms with connectors for data analysis and prediction.

    [Source Code Repository](https://github.com/sodafoundation/delfin)

    [Support Matrix](https://docs.sodafoundation.io/support-matrix/delfin/)


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
