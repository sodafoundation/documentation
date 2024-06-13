---
title: Kubernetes Setup
description: "Setup Kubernetes testing lab for SODA enviroment"
weight: 70
---

## Kubernetes

Kubernetes (K8s) is an open-source system for automating deployment,
scaling, and management of containerized applications.

Kubernetes is a portable, extensible, open-source platform for managing
containerized workloads and services, that facilitates both declarative
configuration and automation. It has a large, rapidly growing ecosystem.
Kubernetes services, support, and tools are widely available.

### Features

-   Service discovery and load balancing
-   Storage orchestration
-   Automated rollouts and rollbacks
-   Automatic bin packing
-   Self-healing

### Local Lab View

![image][]

source: [Rancher Documentation][]

## Getting Started

![image][0]

### Section:1


Final vagrant and script files for the various nodes to get quickly started (Ready to go files)

| Sno | Hostname         |
|-----|------------------|
| 1   | master.osive.lab |
| 2   | node1.osive.lab  |
| 3   | node2.osive.lab  |

[Download files here](../soda-lab-setup/k8s-scripts.zip)

**Scripts**

Follow the steps below to get started with local kubernetes cluster using rancher docker containers

-   Make a new directory *K8s* in that make 3 more sub directories

    1.  master
    2.  node1
    3.  node2
    
    ``` bash
    $ mkdir k8s
    $ mkdir master node1 node2
    $ ls
    ```
    
    ![image][1]

 -   Now `vagrant init bento/ubuntu-20.04` in the master node

    ``` bash
        $ vagrant init bento/ubuntu-20.04
    ```

 -  Download and replace the scripts from the above into directories

`Move to Section:3, if no changes are required`

### Section:2

Steps Explaination (Change according to requirements):

- Open the vagrantfile of the master node and give the disksize, give the hostname master, set the network to dhcp

``` bash
    Vagrant.configure("2") do |config|
        config.vm.box = "bento/ubuntu-20.04"
        config.vm.host_name = "master"
        config.vm.network "public_network",
        use_dhcp_assigned_default_route: true
        config.disksize.size = '100GB'
```

- Vagrant plugin that creates a persistent storage and attaches it to guest machine

- Change the persistent storage:-

    ``` bash
    config.persistent_storage.diskdevice = '/dev/sdb'
    config.persistent_storage.enabled = true
    config.persistent_storage.location = "~/development/ceph-disk.vdi"
    config.persistent_storage.size = 100000
    config.persistent_storage.use_lvm = false
    config.persistent_storage.partition = false          
    ```

 -   Customize the amount of memory on the VM

``` bash
vb.memory = "8192"
vb.cpus = "2"
vb.name = "master"
# Prevent VirtualBox from interfering with host audio stack
vb.customize ["modifyvm", :id, "--audio", "none"]
end
```

**Look at the current path. Output (commented for easier copying and pasting of commands)**

``` bash
$ vboxmanage list systemproperties | grep machine

Default machine folder:          /home/---/VirtualBox VMs
```

-   Set it to a different folder in your home, If you user has access to the path and can create files/folders, then the folder doesn't need to exist beforehand, Virtualbox will create it

 ``` bash
 $ vboxmanage setproperty machinefolder ~/VirtualMachines
 ```

-   No output produced

    ``` bash
    $ vboxmanage list systemproperties | grep machine
    ```

### Section:3

Provision VMs for kubernetes

-   For Vagrant up in all nodes run the script `Initial-setup.sh`

    ``` bash
    date >> ~/log.txt 
    cd master1
    vagrant up
    cd ../node1
    vagrant up
    cd ../node2
    vagrant up
    date >> ~/log.txt
    echo "started"  | tee -a  ~/log.txt
    ```

-   Apply permission and run the Script to up all the nodes

    ``` bash
    $ ./Initial-setup.sh
    ```

-   SSH into the master node

    ``` bash
    cd ~/vagrant/k8s/master
    vagrant ssh
    ```

-   Now run the Rancher OS container in the master node:-

    ``` bash
    $ docker run  --name rancher -d --restart=always -p 192.168.0.245:8000:80 -p 443:443 rancher/rancher
    ```

-   Then open up your browser and open web app of rancher os by using master node ip address.

    -   Click `Add Cluster`
    
        ![image](../images/k8s/k1.png)
    
    -   Select `From existing nodes`
    
         ![image](../images/k8s/k2.png)
    
    -   Provide name to your cluster
    
         ![image][2]
    
    -   Always select `weave` network provider.
    
         ![image][3]
    
    -   Press `next`
    
         ![image][4]

-   Choose what roles the node will have in the cluster

    ![image][5]

-   Copy and paste the generated command in the master node

    ![image][6]

-   Now in Node options select only worker and give them IP for Worker node1 & node2 then copy and paste the generated command in the worker nodes

    ![image][7]

-   for IP ...211 run the command in the node1 & for IP ...212 run the command in container node2

    ![image][8]

-   You have to wait for few minutes for the cluster to be active.

    ![image][9]


  [2]: ../images/k8s/k3.png
  [3]: ../images/k8s/k4.png
  [4]: ../images/k8s/k5.png
  [5]: ../images/k8s/k6.png
  [6]: ../images/k8s/k6-1.png
  [7]: ../images/k8s/k-node.png
  [8]: ../images/k8s/k-node1.png
  [9]: ../images/k8s/k7.png



  [image]: ../images/k8s/rancher-architecture-cluster-controller.svg
  [0]: ../images/k8s/k8s-steps.png
  [1]: ../images/k8s/k8s1.png
  [Rancher Documentation]: https://rancher.com/docs/img/rancher/rancher-architecture-rancher-api-server.svg

