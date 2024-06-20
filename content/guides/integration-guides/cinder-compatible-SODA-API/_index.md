---
title: Cinder Compatible 
menuTitle: "SODA API"
description: "A guide for enable Cinder Compatible SODA API."
weight: 1
disableToc: false
tags: ["Cinder Compatible SODA API"] 
---
## Install SODA

### Pre-requisite 
* Ubuntu 18.04
* Ram 16GB
* CPU minimum 4Core

Install SODA using ansible script following the steps given in the [link](https://docs.sodafoundation.io/soda-gettingstarted/installation-using-ansible/)

Or install using [devsds script](https://docs.sodafoundation.io/guides/developer-guides/file-share/)


After installation of SODA check all the services are up before installation of Openstack.
Follow below steps to install Openstack Cinder compatible API.

## Devstack(openstack) Deployment

### Install Openstack using devstack

The Cinder Compatible API only supports cinder’s current API(V3). 
You can use devstack to install cinder when testing, but in order to use cinder’s current API(V3) branch for devstack must be stable/queens.

You can reference this document [link](https://docs.openstack.org/devstack/latest/) to install devstack(Openstack).
 
#### Configure Cinder Compatible API in OpenSDS

Cinder Compatible API adapter is not built in as part of the ansible deployment tool. 
Please Confirm that the OS user is root, not stack.


## Follow below instructions to install Cinder Compatible SODA API

* Initialize Openstack environment variables.

	```
	source /opt/stack/devstack/openrc admin admin
    export OS_VOLUME_API_VERSION=3
	```
* Change the “cinderv3” endpoint so that Openstack can access the cinder compatible api. Then export OPENSDS_ENDPOINT and CINDER_ENDPOINT.
    
    ```
        # Find the <endpoint-id> of cinderv3
        openstack endpoint list
        
        # Update cinderv3 endpoint, the ip is the actual ip address of host2
        openstack endpoint set <endpoint-id> --url ‘http://192.168.2.3:8777/v3/$(project_id)s’
        
        # Export OPENSDS_ENDPOINT and CINDER_ENDPOINT
        export OPENSDS_ENDPOINT=http://192.168.2.3:50040
        export CINDER_ENDPOINT=http://192.168.2.3:8777/v3

    ```
  
* Compatible api code, build and run it.

	```
	    cd $GOPATH/src/github.com/opensds/
        
        # Get Opensds nbp source code
        git clone https://github.com/opensds/nbp.git -b stable/bali
        
        # Building
        cd nbp
        make
            
        # Run cinder compatible api service
        setsid ./build/out/cindercompatibleapi

	```
* Check cinder compatible api.

		```
		cinder type-list
		```
		