# Opensds Orchestration

## Introduction
OpenSDS is aimed at addressing the storage integration challenges of both the Cloud Native environmnet and traditional IT environment.In a distributed environment, the business processes consist of several interconnected steps which may require streamline the process. OpenSDS provides orchestrating these process to ensure accurate and faster execution with minimal manual intervention. The Orchestration framework provides flexibility to use existing workflows or define customized workflows to get the simplied execution of tasks. 

### Intended Readers
OpenSDS users who plan to orchestrate complex tasks in a distributed environment

### Purpose

### Problem reporting instructions
Please refer to this guide or release notes first for any known issues or workarounds available. Issues related to Orchestration can be raised at https://github.com/opensds/orchestration/issues

## Overview
OpenSDS Capri release provides pre-defined service catalogs. Service catalogs serves specific purpose and abstracts the underlying actions from end-user. End user can create instances of these services and check the status. User can see the entities through OpenSDS dashboard or use OpenSDS CLIs to check it from console.
OpenSDS Orchestration service acts as the facilitator to orchestrate actions between OpenSDS dashboard, Orchestration Manager and the OpenSDS backend. Currently OpenSDS supports StackStorm (https://docs.stackstorm.com/overview.html) as the Orchestration Manager. It uses Mistral workflows in StackStorm.

## Installation
Please refer https://github.com/opensds/orchestration/blob/master/docs/INSTALL.md to install OpenSDS and all the required components of Orchestration.

## Orchestrating workflows
OpenSDS currently have two types of pre-defined services to orchestrate the workflows. Volume Provisioning and Bucket Migration.
User can define their own customized workflows and write the actions to orchestrate it through OpenSDS. Check 'Customized workflows' section below.
Apart from OpenSDS dashboard, user can directly use the REST Apis to achieve the required tasks.
Please refer to the Openapi-specs of Orchestration for more details
http://petstore.swagger.io/?url=https://raw.githubusercontent.com/opensds/orchestration/master/openapi-spec/swagger.yaml

### Prerequisites
    a) OpenSDS is installed and user can log-in into the Dashboard
    b) All the required components are installed and running properly

## Services
OpenSDS installation will provide the services available for orchestrating the tasks.
![Services](orchestration_services.PNG?raw=true "Services")

### Volume Provisioning
To create a volume and attach it to the required Host, user can create an instance of "volume provision" Service under Provisioning.
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

#### Pre-requisites:
    a) All the required cloud backends are added into OpenSDS
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

### Customized workflow
If user writes their own Mistral workflows and corresponding actions they can follow following steps to orchestrate it through OpenSDS dashboard. All these steps need to be executed from the OpenSDS ssh console.
    a) Copy the custom workflow into the '/opt/stackstorm/packs/opensds/actions/workflows/' directory of stackstorm/stackstorm:latest docker container. Ex: docker cp custom_wf.yaml 58d22927c38f:/opt/stackstorm/packs/opensds/actions/workflows/
    b) Copy all corresponding actions and their runner scripts into '/opt/stackstorm/packs/opensds/actions/'.
    c) Go into the bash of StackStorm container (Ex: docker exec -it 85bea886a8c5 /bin/bash)
    d) Run 'st2ctl reload --register-all'
    e) Run 'st2 action list|grep opensds' to check if the custom workflow is loaded successfully
    f) Go the CURL/Postman login and execute /v1beta/{tenant_id}/orchestration/services POST API with required inputs. Check the openapi-specs for details.
Ex: Request body for registering service:
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
Please note that the wfe_type should be 'st2' as OpenSDS supports only 'StackStorm' as Orchestration Manager currently. You can specify any existing group like 'Provisioning' or 'Migration' or create a new group altogether.

Once these steps are done, user can go into the OpenSDS dashboard and create and execute an instance.

### Checking created instacnes
Click on the 'instacnes' button on 'Services' page to get the list of all instances of the services being created and its status.

## Known issues
### Multiple service registration in a loop may fail sometime
Workaround: If service registration is done through CURL/Postman from a script, put a delay of 60 secs between every service registration

### Others:
Please refer to https://github.com/opensds/orchestration/blob/master/docs/INSTALL.md for some of the known issues while installting some dependent components.

## References


