---
title: Ceph Setup
description: "Setup Ceph storage cluster for SODA testing"
weight: 80
---

## Ceph

The power of Ceph can transform your organization’s IT infrastructure and your ability to manage vast amounts of data. If your organization runs applications with different storage interface needs, Ceph is for you! Ceph’s foundation is the Reliable Autonomic Distributed Object Store (RADOS), which provides your applications with object, block, and file system storage in a single unified storage cluster—making Ceph flexible, highly reliable and easy for you to manage.

Ceph’s RADOS provides you with extraordinary data storage scalability—thousands of client hosts or KVMs accessing petabytes to exabytes of data. Each one of your applications can use the object, block or file system interfaces to the same RADOS cluster simultaneously, which means your Ceph storage system serves as a flexible foundation for all of your data storage needs. You can use Ceph for free, and deploy it on economical commodity hardware. Ceph is a better way to store data.

### Architecture Diagram

![img-60](../images/ceph/architecture.png)


### Getting Started

**Pre-requisites**

1. Sudo priviledged user
2. 10GB minimum RAM for 3 VMs
3. Vagrant
4. Vagrant Disk size plugin
5. Vagarnt Persistant volume plugin


**Deploy Cluster VMs**

Follow the steps to get started:

**Install Vagrant**

``` bash
sudo apt install vagrant
```

**Install Vagrat plugins for disk size and Persistant storage**

``` {.bash}
# Vagrant disk size plugin
vagrant plugin install vagrant-disksize

# Vagrant Persistant storage plugin
vagrant plugin install vagrant-persistent-storage
```

*[Download here](../cephadm.zip), ready to deploy ceph storage cluster Vagrant files*

- Start the VMs

    ``` bash
    $ vagrant up
    ```

#### Configure Vagrant VMs

The following are the ubuntu server details

-----------------------------------------------------------------------
Hostname                            IP address
----------------------------------- -----------------------------------
master.ceph.osive.lab               192.168.0.230

node1.ceph.osive.lab                192.168.0.231

node2.ceph.osive.lab                192.168.0.232
-----------------------------------------------------------------------

We are using vagrant to deploy ceph cluster VMs

Follow to steps to get the ceph cluster ready

- Change to root user

 ``` {.bash}
 sudo su -
 ```

- Download the cephadm and ceph-common tools

    ``` {.bash}
    apt install cephadm ceph-common
    ```

- Start the bootstrap process

 ``` {.bash}
 cephadm bootstrap --mon-ip 192.168.0.230 --allow-fqdn-hostname
 ```

- Copy ssh key to nodes

    ``` {.bash}
    ssh-copy-id -f -i /etc/ceph/ceph.pub root@node1.ceph.osive.lab
    ssh-copy-id -f -i /etc/ceph/ceph.pub root@node2.ceph.osive.lab
    ```

- Inform new node is part of the cluster

    ``` {.bash}
    ceph orch host add node1.ceph.osive.lab
    ceph orch host add node2.ceph.osive.lab
    ```

**Donot deploy mon as cephadm automatically deploys it**

To deploy Monitors (2 ways to deploy monitors)

    - *Option-1* Using host Inform

    - Deploy monitors on hosts
    
    ``` {.bash}
    ceph orch apply mon root@node1.ceph.osive.lab,  root@node2.ceph.osive.lab, root@node3.ceph.osive.lab
    ```

    - *Option-2* Using Host labels (Recommended)

    controls which hosts the monitors run on by making use of host labels.
    
    ``` {.bash}
    ceph orch host label add node1.ceph.osive.lab mon
    ceph orch host label add node2.ceph.osive.lab mon
    #ceph orch host label add node3.ceph.osive.lab mon
    ```
 
- To view the current hosts and labels
 
  ``` {.bash}
  ceph orch host ls
  ```
 
- Inform cephadm to deploy monitors based on the label
 
    ``` {.bash}
    ceph orch apply mon label:mon
    ```

- An inventory of storage devices on all cluster hosts can be displayed

    ``` {.bash}
    ceph orch device ls
    ```
 To consume storage device for pool

- For consuming all devices available in the cluster

    ``` {.bash}
    ceph orch apply osd --all-available-devices
    ```

- Consuming specific device from the node

    ``` {.bash}
    ceph orch daemon add osd node1.ceph.osive.lab:/dev/sdb
    ceph orch daemon add osd node2.ceph.osive.lab:/dev/sdb
    ```

### Troubleshooting commands

Additional Cluster commands for troubleshoot

- Present a preview of what will happen without actually creating the OSDs.

 ``` {.bash}
 ceph orch apply osd --all-available-devices --dry-run
 ```

- Display avaiable OSDs

 ``` {.bash}
 ceph orch device ls
 ```