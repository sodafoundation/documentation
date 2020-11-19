---
title: Vagrant Setup
description: "Setup Vagrant setup for SODA testing of multiple scenarios"
weight: 60
---

## Introduction to Vagrant

[Vagrant] is a tool for building and managing virtual machine
environments in a single workflow. With an easy-to-use workflow and
focus on automation, Vagrant lowers development environment setup time,
increases production parity, and makes the \"works on my machine\"
excuse a relic of the past.

Vagrant provides easy to configure, reproducible, and portable work
environments built on top of industry-standard technology and controlled
by a single consistent workflow to help maximize the productivity and
flexibility of you and your team.

### Requirements

-   VirtualBox installed on machine


## Gettiing Started

Follow the below mentioned steps to get quickly started with vagrant enviroment


- Install from the apt repository
    
    ``` bash
        $ sudo apt install vagrant
    ```

### Install required plugins

Required Vagrant plugins are:

| Sno | Plugin Name                | Description                                                    |
|-----|----------------------------|----------------------------------------------------------------|
| 1   | vagrant-env                | Plugin to load environment variables from .env into ENV        |
| 2   | vagrant-disksize           | Plugin to resize root disk                                     |
| 3   | vagrant-persistent-storage | Creates a persistent storage and attaches it to guest machine. |


-   Vagrant plugin to load environment variables from .env into ENV

    ``` bash
    $ vagrant plugin install vagrant-env
    ```

-   Vagrant disk size plugin to resize root disk

    ``` bash
        $ vagrant plugin install vagrant-disksize
    ```

    <div class="note">
    <div class="title">

    Note

    </div>

    *Example*

    `config.disksize.size = '50GB'`

    </div>

    -   Vagrant plugin that creates a persistent storage and attaches it to
        guest machine.

    ``` bash
    $ vagrant plugin install vagrant-persistent-storage
    ```

    <div class="note">

    <div class="title">

    <b>Note:</b>
    </div>

    *Example Usage*
    <br>
    <br>config.persistent_storage.enabled = true
    <br>config.persistent_storage.location = "\~/development/sourcehdd.vdi"
    <br>config.persistent_storage.size = 5000
    <br>config.persistent_storage.mountname = 'mysql'
    <br>config.persistent_storage.filesystem = 'ext4'
    <br>config.persistent_storage.mountpoint = '/var/lib/mysql'
    <br>config.persistent_storage.volgroupname = 'myvolgroup'

    </div>

    <div class="important">

    <div class="title">

    Important

    </div>

    After installing you can set the location and size of the persistent
    storage.

    The following options will create a persistent storage with 5000 MB,
    named `docker`, mounted on `/var/lib/docker`, in a volume group called
    `'myvolgroup'` [Persistent storage][]

    ![image][]

    </div>

## Setup Demo Vagrant Project 


-   Make a directory for vagrant using mkdir

    ``` bash
        $ mkdir vagrant
        $ cd vagrant/
    ```

-   Make a directory inside Vagrant and give the name of VM & cd into it

    ``` bash
        $ mkdir ubuntu
        $ cd ubuntu/
    ```

    <div class="important">

    <div class="title">

    Important

    </div>

    Discover [Vagrant Boxes][]

    Search your required image

    </div>

-   Download the image of ubuntu-20.04 in directory

    Open the same directory in the terminal & use the following command for downloading the image of the VM

    ``` bash
        $ vagrant init bento/ubuntu-20.04
    ```

-   Replace generated vagrant file with the below:

    ``` bash
    # -*- mode: ruby -*-
    # vi: set ft=ruby :

    # All Vagrant configuration is done below. The "2" in Vagrant.configure
    # configures the configuration version (we support older styles for
    # backwards compatibility). Please don't change it unless you know what
    # you're doing.
    Vagrant.configure("1") do |config|
        config.vm.box = "bento/ubuntu-20.04"
        config.vm.host_name = "saki"
        config.vm.network "public_network", bridge: "Intel(R) 82579LM Gigabit Network Connection"

        config.persistent_storage.enabled = true
        config.persistent_storage.location = "~/development/sourcehdd.vdi"
        config.persistent_storage.size = 5000
        config.persistent_storage.mountname = 'docker'
        config.persistent_storage.filesystem = 'ext4'
        config.persistent_storage.mountpoint = '/var/lib/docker'
        config.persistent_storage.volgroupname = 'myvolgroup'

        config.disksize.size = '50GB'
    ```

-   Set the size you want for one disk in your Vagrantfile. Open the
    vagrant file inside your VM directory

-   Provide Host Name & give network as bridge

    ``` bash
        config.vm.host_name ="saki"
    ```
    
    & network to be bridged
    
    ``` bash
        config.vm.network "public_network", ip: "192.168.0.245"
        default_router = "192.168.0.1"
        config.vm.provision :shell, :inline => "ip route delete default 2>&1 >/dev/null || true; ip route add default via #{default_router}"
    ```

-   The script.sh file here will be uploaded & executed via Vagrant shell provisioner-

    Use script file below to get started with your Project
    
    ``` bash
    #!/bin/bash
    
    # install docker in the virtual machine
    sudo apt-get update
    #SET UP THE REPOSITORY
    sudo apt-get install \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg-agent \
        software-properties-common
    #docker install     
    sudo apt-get install docker.io
    # adding docker registry in the vagrant script.sh
    sudo mkdir /etc/docker
    ls -l /etc/docker/
    echo " registry-mirrors" | sudo tee /etc/docker/daemon.json
    echo "\"registry-mirrors\": [\"http://192.168.0.244:5000\"]," | sudo tee -a /etc/docker/daemon.json ;cat /etc/docker/daemon.json
    
    ```
        Execute `script.sh` within the guest machine
    
    ![image-1][]
    
    **Script Contents:**
    
    Adding docker registry in the guest virtual machine
    
    ``` bash
    sudo mkdir /etc/docker
    ls -l /etc/docker/
    echo " registry-mirrors" | sudo tee /etc/docker/daemon.json
    echo "\"registry-mirrors\": [\"http://192.168.0.244:5000\"]," | sudo tee -a /etc/docker/daemon.json ;cat /etc/docker/daemon.json
     ```
    
    -   Hit command in the terminal
    
    ``` bash
        $ vagrant up
    ```

  [image-1]: ../images/vagrant/addingScript.png
  [Vagrant Boxes]: https://app.vagrantup.com/boxes/search
  [Persistent storage]: https://github.com/kusnier/vagrant-persistent-storage
  [image]: ../images/vagrant/presistentStorage.png
  [Vagrant]: https://www.vagrantup.com/