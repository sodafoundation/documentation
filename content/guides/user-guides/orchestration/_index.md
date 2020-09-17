---
title: Orchestration
description: "User guide for Orchestration and automation."
weight: 10
disableToc: false
tags: ["user guide", "orchestration"] 
---

## Introduction
SODA is aimed at addressing the storage integration challenges of both the Cloud Native environmnet and traditional IT environment.In a distributed environment, the business processes consist of several interconnected steps which may require streamline the process. SODA provides orchestrating these process to ensure accurate and faster execution with minimal manual intervention. The Orchestration framework provides flexibility to use existing workflows or define customized workflows to get the simplied execution of tasks. 

## Intended Readers
SODA users who plan to orchestrate complex tasks in a distributed environment

## Purpose

## Problem reporting instructions
Please refer to this guide or release notes first for any known issues or workarounds available. Issues related to Orchestration can be raised at https://github.com/sodafoundation/orchestration/issues

## Overview
SODA Capri release provides pre-defined service catalogs. Service catalogs serves specific purpose and abstracts the underlying actions from end-user. End user can create instances of these services and check the status. User can see the entities through SODA dashboard or use SODA CLIs to check it from console.
SODA Orchestration service acts as the facilitator to orchestrate actions between SODA dashboard, Orchestration Manager and the SODA backend. Currently SODA supports StackStorm (https://docs.stackstorm.com/overview.html) as the Orchestration Manager. It uses Mistral workflows in StackStorm.

## Installation
Please refer https://github.com/sodafoundation/orchestration/blob/master/docs/INSTALL.md to install SODA and all the required components of Orchestration.

## Orchestrating workflows
SODA currently have two types of pre-defined services to orchestrate the workflows. Volume Provisioning and Bucket Migration.
User can define their own customized workflows and write the actions to orchestrate it through SODA. Check 'Customized workflows' section below.
Apart from SODA dashboard, user can directly use the REST Apis to achieve the required tasks.

{{% notice note %}}
Please refer to the OpenAPI-specs of Orchestration for more details. [Click Here <i class="fas fa-external-link-alt"></i>](http://petstore.swagger.io/?url=https://raw.githubusercontent.com/opensds/orchestration/master/openapi-spec/swagger.yaml)
{{% /notice%}}

#### Prerequisites
    a) SODA is installed and user can log-in into the Dashboard
    b) All the required components are installed and running properly

## Services
SODA installation will provide the services available for orchestrating the tasks.
![Services](orchestration_services.PNG?raw=true "Services")

### Volume Provisioning
To create a volume and attach it to the required Host, user can create an instance of "volume provision" Service under Provisioning.

###  Creating an instance
    a) Click on 'Create' button to provide required inputs
    b) In 'Instance Details', provide the Name and Description of this service instance
    c) Provide the 'Parameters' required for the volume provisioning
        * 'Host IP': IP of the Host to which the volume being created will be attached
        * 'Name': Name of the volume to be created
        * 'Profile Id': Select one of the Profile which has got the 'Block' Storage connectivity
        * 'Size': Size of the volume to be created
    d) Once the fields are filled, click on 'ok' button to initiate the workflow execution
    e) This will take you to the 'instances' page where the status can be tracked for the instance execution
    f) Once the status is 'success', user can navigate to 'Resource->Volumes' to verify the volume created and it's status being 'inUse'. 'inUse' status signifies that the volume is attached

![volume provision](volume_provision.PNG?raw=true "volume provision")

### Bucket Migration
To move objects from bucket of one cloud provider to the other, user can create an instance of "migration bucket" Service under Migration.

#### Prerequisites:
    a) All the required cloud backends are added into SODA
    b) Required buckets are created in the respective cloud backends. Check this under 'Resource->Buckets'

####  Creating an instance
    a) Click on 'Create' button to provide required inputs
    b) In 'Instance Details', provide the Name and Description of this service instance
    c) Provide the 'Parameters' required for the bucket migration
        * 'Description': Provide description of this instance being created
        * 'Destination Backend': Destination cloud backend  
        * 'Destination Bucket Name': Name of the destination cloud bucket to which objects will be migrated
        * 'Name': Name of the migration
        * 'Remain Source': Select one 
        * 'Source Bucket Name': Name of the Source cloud bucket from which objects will be migrated
    d) Once the fields are filled, click on 'ok' button to initiate the workflow execution
    e) This will take you to the 'instances' page where the status can be tracked for the instance execution
    f) Once the status is 'success', user can navigate to the 'Dataflow' and check the migration and also check 'Resource->Buckets' to          check if the objects has been migrated to the destination cloud bucket

![migration bucket](migration_bucket.PNG?raw=true "migration bucket")

## Orchestration using CLI (orchctl)
CLI for Orchestration


### Steps to run CLI:

* [Deploy SODA](https://docs.sodafoundation.io/soda-gettingstarted/quickstart/)
* Deploy StackStorm with [SODA packs](https://github.com/sodafoundation/orchestration/blob/master/docs/INSTALL.md)
* [Start Orchestrator](https://github.com/opensds/orchestration/blob/master/docs/INSTALL.md)
* Update input parameters in util.py file (OPENSDS_IP, ORCHESTRATOR_IP, etc.)
* Also, if the StackStorm is installed using Docker image, 
    * go to /opt/st2-installer-linux-amd64/conf
    * copy the ST2_PASSWORD from stackstorm.env file
    * replace above password in util.py of Orchestration
    

Orchestration CLI can be used for registering service, Querying service, creating/deleting instance, querying instance

### CLI for SODA Orchestration Manager:
    usage: orchctl [-h] [-a ADDRESS] [-u USER] [-p PASSWORD] [-t PROJECT_ID]
                [--orch_ip ORCH_IP] [--orch_port ORCH_PORT]
                {service,instance,workflow,task} ...


    positional arguments:
    {service,instance,workflow,task}
        service             Registers/Shows services in Orchestrator
        instance            Executes/Shows/Deletes workflow instances
        workflow            Shows workflow definitions in Orchestrator
        task                Status of the task in Orchestrator

    optional arguments:
    -h, --help            show this help message and exit
    -a ADDRESS, --address ADDRESS
                            ip address of SODA hotpot
    -u USER, --user USER  username for SODA hotpot
    -p PASSWORD, --password PASSWORD
                            password for SODA hotpot
    -t PROJECT_ID, --project_id PROJECT_ID
                            project_id for SODA hotpot
    --orch_ip ORCH_IP     Orchestration server ip address
    --orch_port ORCH_PORT
                            Orchestration server port

```bash
#For Example:  

    ./orchctl --help
    ./orchctl service list
    ./orchctl service add --data '{"name":"volume provision","description":"Volume Service","tenant_id":"94b280022d0c4401bcf3b0ea85870519","user_id":"558057c4256545bd8a307c37464003c9","input":"","constraint":"","group":"provisioning","workflows":[{"definition_source":"opensds.provision-volume","wfe_type":"st2"},{"definition_source":"opensds.snapshot-volume","wfe_type":"st2"}]}'
    ./orchctl service get --id d8360a8a-6c5e-4533-a18a-b446db8caac8
    ./orchctl instance list
    ./orchctl instance get --id 2723347b-9af8-451a-a7f8-62d40b10ad6f
    ./orchctl instance delete --id 2723347b-9af8-451a-a7f8-62d40b10ad6f
    ./orchctl instance run --data '{"service_id":"08e8a8a3-7a78-43d3-9ab1-45fe7a60d4eb","action":"opensds.provision-volume","name":"Volume Provision name","description":"Volume Provision description","user_id":"558057c4256545bd8a307c37464003c9","parameters":{"ip_addr":"127.0.0.1","port":"50040","tenant_id":"94b280022d0c4401bcf3b0ea85870519","size":1,"name":"test"}}'
```
### Services

#### List all the services:
```
./orchctl service list
```

#### Register a service:  
```
./orchctl service add --data <All required params in JSON format>

# for example:  

./orchctl service add --data '{"name":"volume provision","description":"Volume Service","tenant_id":"94b280022d0c4401bcf3b0ea85870519","user_id":"558057c4256545bd8a307c37464003c9","input":"","constraint":"","group":"provisioning","workflows":[{"definition_source":"opensds.provision-volume","wfe_type":"st2"},{"definition_source":"opensds.snapshot-volume","wfe_type":"st2"}]}'
```

#### Query a registered service by id:
```
./orchctl service get --id <service id>

# for example:  

./orchctl service get --id d8360a8a-6c5e-4533-a18a-b446db8caac8
```

### Instances

#### List all instances:
```
./orchctl instance list
``` 

#### Create an instance of the service:  

    * Get the service id of the service whose instance is being created. Say the service id is: `08e8a8a3-7a78-43d3-9ab1-45fe7a60d4eb`  
    * Service instance creation will need the parameter values required to execute.
    * The values are accepted as key value in JSON format.  

```
./orchctl instance run --data <Input parameters>

# for example:  

./orchctl instance run --data '{"service_id":"08e8a8a3-7a78-43d3-9ab1-45fe7a60d4eb","action":"opensds.provision-volume","name":"Volume Provision name","description":"Volume Provision description","user_id":"558057c4256545bd8a307c37464003c9","parameters":{"ip_addr":"127.0.0.1","port":"50040","tenant_id":"94b280022d0c4401bcf3b0ea85870519","size":1,"name":"test"}}'
```

#### Get an instance by instance id:  

```
./orchctl instance get --id <instance id>

# for example:  

./orchctl instance get --id 2723347b-9af8-451a-a7f8-62d40b10ad6f
```

#### Delete an instance:  

```
./orchctl instance delete --id <instance id to be deleted>

# for example:  

./orchctl instance delete --id 2723347b-9af8-451a-a7f8-62d40b10ad6f
```

### Customized workflow
If user writes their own Mistral workflows and corresponding actions they can follow following steps to orchestrate it through SODA dashboard. All these steps need to be executed from the SODA ssh console.

### Steps to follow:
    a) Copy the custom workflow into the '/opt/stackstorm/packs/opensds/actions/workflows/' directory of stackstorm/stackstorm:latest docker container. Ex: docker cp custom_wf.yaml 58d22927c38f:/opt/stackstorm/packs/opensds/actions/workflows/
    b) Copy all corresponding actions and their runner scripts into '/opt/stackstorm/packs/opensds/actions/'.
    c) Go into the bash of StackStorm container (Ex: docker exec -it 85bea886a8c5 /bin/bash)
    d) Run 'st2ctl reload --register-all'
    e) Run 'st2 action list|grep opensds' to check if the custom workflow is loaded successfully
    f) Go the CURL/Postman login and execute /v1beta/{tenant_id}/orchestration/services POST API with required inputs. Check the openapi-specs for details. Ex: Request body for registering service:
    {
        "name": "custom workflow",
        "description": "Create and Resize a volume",
        "tenant_id": "94bhajo8988",
        "user_id": "558057",
        "input": "",
        "constraint": "",
        "group": "Custom",
        "workflows": [
            {
                "definition_source": "opensds.custom-wf",
                "wfe_type": "st2"
            }
        ]
    }
{{% notice note %}}
Please note that the **`wfe_type`** should be **`st2`** as SODA supports only **StackStorm** as Orchestration Manager currently. You can specify any existing group like 'Provisioning' or 'Migration' or create a new group altogether.
{{% /notice %}}
Once these steps are done, user can go into the SODA dashboard and create and execute an instance.

### Checking created instances
Click on the 'Instances' button on 'Services' page to get the list of all instances of the services being created and its status.

## Known issues  

    1. Multiple service registration in a loop may fail sometime
    Workaround: If service registration is done through CURL/Postman from a script, put a delay of 60 secs between every service registration

### Others:  

Please refer to https://github.com/opensds/orchestration/blob/master/docs/INSTALL.md for some of the known issues while installing some dependent components.

## References
[TODO: Add developer guide reference]
