---
title: Docker Registry Setup
description: "Setup In network private docker cache registry"
weight: 23
---

## Docker Registry

The Registry is a stateless, highly scalable server side application
that stores and lets you distribute Docker images. It is a storage and
content delivery system, holding named Docker images, available in
different tagged versions.

Registry ships with a robust notification system, calling webhooks in
response to activity, and both extensive logging and reporting, mostly
useful for large installations that want to collect metrics.

### Features

You should use the Registry if you want to:

- Tightly control where your images are being stored
- Fully own your images distribution pipeline
- Integrate image storage and distribution tightly into your
- in-house development workflow


### Requirements

- The Registry is compatible with Docker engine version 1.6.0 or higher.

### Local lab setup

![img-60][1]

### Quick Setup Guide

**On server**

``` bash
    docker run -d -p 5000:5000 \
    -e REGISTRY_PROXY_REMOTEURL=http://registry-1.docker.io \
    -v ~/docker/images:/var/lib/registry \
    --name registry \
    registry:2
```

- Checking docker registry

    ``` bash
    $ curl http://192.168.x.x:5000/v2/_catalog
    ```

    **where ip(192.168.x.x) is the ip of the server or host machine itself to view all the images in the repository**

    These images which are on the host machine can now be pulled by all other machines (clients) on the same network locally

**On client**

- Add in /etc/docker/daemon.json
    
    ``` json
        {
            "registry-mirrors": ["http://192.168.x.x:5000"] ,
            "live-restore": true,
            "debug": true,
            "dns": "192.169.x.x"
        }
    ```
   
- Provide the ip of the server/host machine in registry-mirrors
    
- Restart docker service to apply changes
        
    ``` bash
    $ sudo systemctl restart docker
    ```

    **_NOTE:_** Each time after editing the daemon.json file After setting these configuration client will be pulling images from docker registry rather than downloading/pulling directly from docker hub

[1]: ../images/docker-registry/dockerRegistry-page001.png
