---
title: SODA Foundation project Features
description: ""
weight: 0
disableToc: true
---

{{% notice note %}}
All the SODA features are listed here. More information  will be updated here shortly. Keep checking this space.
{{% /notice %}}

## File Share  

File share in sodafoundation facilitates the user to create file share, set access permission for that file share and user can also create snapshot. Opensds provides both CLI and Dashboard to operate or play with file share feature. Goals of file share in sodafoundation are Facilitating File Share Service by providing Standard API to manage multiple vendors, simplify File Share API definition File share across the users based on access capability File share facilitates with profiling Scope for now is to support only NFS, SMB file share protocols.

{{% button href="/guides/user-guides/file-share" target="_self" icon="fas fa-file-alt" icon-position="right" %}}User Guide{{% /button %}}
{{% button href="/guides/developer-guides/file-share" icon="fas fa-file-code" icon-position="right" %}}Developer Guide{{% /button %}}

## Orchestration & Automation  

SODA Foundation project is aimed at addressing the storage integration challenges of both the Cloud Native environment and traditional IT environment.In a distributed environment, the business processes consist of several interconnected steps which may require streamline the process. SODA Foundation provides orchestrating these processes to ensure accurate and faster execution with minimal manual intervention. The Orchestration framework provides flexibility to use existing workflows or define customized workflows to get the simplified execution of tasks.

{{% button href="/guides/user-guides/orchestration" target="_self" icon="fas fa-file-alt" icon-position="right" %}}User Guide{{% /button %}}
{{% button href="/guides/developer-guides/orchestration" icon="fas fa-file-code" icon-position="right" %}}Developer Guide{{% /button %}}

## Telemetry  

Install SODA Foundation with telemetry tools, create test volumes, create sample grafana dashboard, create sample alert rules and view dashboards.

{{% button href="/guides/user-guides/telemetry" target="_self" icon="fas fa-file-alt" icon-position="right" %}}User Guide{{% /button %}}

## Migration  

Migrate data to the appropriate storage tier throughout different stages of its lifecycle

## Replication  

The Replication feature is to provide support for volume level and group level replications. For group level replication and snapshot, the design will adopt the generic volume groups concept from OpenStack Cinder.  APIs will be provided for volume level and group level replications.

## Multi Cloud  

Multi-cloud data engine provides policy-based data mobility across public and private clouds. This can be used in the following cases:  

- User may want to upload some datasets to the public cloud for data analysis and delete the data after the work is complete.
- User can leverage multi-cloud data engine to move data to the public cloud for high CPU computing when that is required for a period of time.
- User can use multi-cloud data engine to move data to a location near to where it is needed for convenience.
- Multi-cloud data engine allows data to be available and accessible all the time. In the case where one cloud is down, user can still have access to data in another cloud that is up and running.
- Frequently accessed data can be stored on-premise. Data not accessed for a long time can be stored in archival storage in public cloud. Data can be moved to different location depending on usage, age, access frequency.

## Lifecycle Management  

- A lifecycle configuration is a set of rules that define actions that applies to a group of objects.
- Enforcing Lifecycle policies using S3 API is a great way of ensuring your data is managed safely (without experiencing unnecessary costs) and that your data is cleanly deleted once it is no longer required.
- Lifecycle policies allow you to automatically review your buckets and have them moved either to different cloud service provider or in the same cloud but to other storage class or have them deleted . You may want to do this for security, legislative compliance, internal policy compliance, or general housekeeping.
- Object versioning is also supported in lifecycle configuration to customize your data retention approach and control storage costs

## Anomaly Detection  

In Telemetry, volume metrics will be collected to reflect the state of the storage systems. The next step is to interpret these metrics and figure out if something goes wrong and trigger alerts. Once users are notified with the alerts, they can take actions to fix the problems and keep the storage systems healthy  





