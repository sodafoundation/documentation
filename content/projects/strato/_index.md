---
title: Strato
description: "The guides of features of strato SODA Project"
weight: 1
disableToc: true
---

This section provides Guides for various features from strato of SODA Foundation. Focuses mainly on the usage of the features in these document. If you are interested to develop/port etc, please refer the developer guides or contact us through any of the technical channels.

- ### SODA Multicloud(Strato)

    SODA Multicloud provides a cloud vendor agnostic data management for hybrid cloud, intercloud, or intracloud. The goal is to provide a unified interface to support file, block,and object services across multiple cloud vendors. It can be hosted on-premise or in the cloud.

    For object data management, it provides a backend manager which is S3 compatible APIs to connect with any cloud vendors. Currently, MS Azure, GCP, AWS, Huawei, IBM, Alibaba backends are supported and getting updated with new backends regularly.

    It also supports Ceph backed to enable on-prem. China Unicom has integrated their YIG project into SODA Multicloud, enabling Ceph to be used as a massively scalable backend object storage.

    SODA multi-cloud also supports creating Storage Service Plans(SSP) for creating tenant based access to multi-cloud storages.

    Basic file service support is added for AWS, Azure, GCP and Huawei and basic block service support is added for AWS EBS and Huawei.

    The technical team is exploring to extend SODA Multicloud and other key layers of SODA into a distributed data store which can support block, file and object data management across the edge, on-premise, and cloud

    [Source Code Repository](https://github.com/sodafoundation/multi-cloud)

    [Support Matrix](https://docs.sodafoundation.io/support-matrix/multi-cloud/)
{{%children style="h3" description="true" %}}
  