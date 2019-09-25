---
title: Orchestration and Automation
description: "Developer Guide for Orchestration and Automation"
weight: 10
disableToc: false
tags: ["developer guide", "orchestration", "automation"] 
---
## Overview
This guide is intended for Orchestration and Automation developers. It provides detailed steps to write new workflows for sequence of actions and Orchestrate them through OpenSDS. To undestand the feature and requirements in detail, please refer to the Orchestration user guide and Orchestration design doc. OpenSDS currently uses StackStorm as the Orchestration manager. It uses Mistral workflows of StackStorm. 

## Workflows and Actions  

Workflows are sequence of actions stitched together to achieve an Orchestrated task.

## Write new workflows  

Before starting to write the workflows, it is required to have basic understanding of YAML syntax.

## How to write the workflows  

Workflows are series of actions definitions put into a YAML file.

### There are three major steps involved:  

1. All workflows goes into the 'opensds' namespace of the StackStorm pack, i.e. `/opt/stackstorm/packs/opensds/actions/workflows/` dir  
2. The corresponding actions are defined in a YAML file in the same namespace, i.e. `/opt/stckstorm/packs/opensds/actions`  
3. For every action there is corresponding runner. These runners can be written in shell/python. The action YAML should specify the runner type.  

#### Example of workflow (provision_volume.yaml):  

```yaml
version: "2.0"
name: "opensds.provision-volume"

workflows:

    main:
        type: direct
        input:
            - ip_addr
            - port
            - tenant_id
            - name
            - description
            - availability_zone
            - size
            - profile_id
            - snapshot_id
            - snapshot_from_cloud
            - mount_point
            - host_info
            - connection_info
            - access_protocol
            - auth_token
            - timeout
        output:
            tagline: "<% $.print_status %>"
        task-defaults:
          on-error:
            - fail
        tasks:
            create_volume:
                action: opensds.create-volume
                input:
                    ip_addr: "<% $.ip_addr %>"
                    port: "<% $.port %>"
                    tenant_id: "<% $.tenant_id %>"
                    name: "<% $.name %>"
                    description: "<% $.description %>"
                    availability_zone: "<% $.availability_zone %>"
                    size: '<% $.size %>'
                    profile_id: "<% $.profile_id %>"
                    snapshot_id: "<% $.snapshot_id %>"
                    snapshot_from_cloud: '<% $.snapshot_from_cloud %>'
                    auth_token: "<% $.auth_token %>"
                publish:
                   volume_id: <% task(create_volume).result.result %>
                on-success:
                    - attach_volume
            attach_volume:
                action: opensds.attach-volume
                input:
                    ip_addr: "<% $.ip_addr %>"
                    port: "<% $.port %>"
                    tenant_id: "<% $.tenant_id %>"
                    volume_id: <% $.volume_id %>
                    mount_point: <% $.mount_point %>
                    host_info: <% $.host_info %>
                    connection_info: <% $.connection_info %>
                    access_protocol: <% $.access_protocol %>
                    auth_token: "<% $.auth_token %>"
                publish:
                    print_status : <% task(attach_volume).result.stdout %>

```  

### Points to remember  

1. `name` should always prefix with `opensds`. Ex: `opensds.provision-volume`  
2. Follow Mistral workflow syntax  
3. All the required parameters for the respective actions should be listed under `input` tag  
4. Actions are defined under `tasks`. Note that the action name should always be prefixed with `opensds`. Ex: `opensds.create-volume`  
5. Every action/tasks will list their own input parameters. This is the subset of the 'input' list defined under 'main'  
6. If the output of one task is input for the other task, provide that variable name under 'publish'  
7. You can define the task being called `on-success` or `on-failure`  
8. If the output needs to be sent to the caller of the workflow, it can be published under `print_status`  

#### Example of action (create_volume.yaml)  

```yaml
---
description: Create Volume
enabled: true
entry_point: create_volume.py
name: create-volume
parameters:
  ip_addr:
    type: string
    required: true
  port:
    type: string
    required: true
  tenant_id:
    type: string
    required: true
  name:
    type: string
    required: true
  description:
    type: string
    required: false
  availability_zone:
    type: string
    required: false
  size:
    type: integer
    required: true
  profile_id:
    type: string
    required: false
  snapshot_id:
    type: string
    required: false
  snapshot_from_cloud:
    type: string
    required: false
  auth_token:
    type: string
    required: false
runner_type: "python-script"
```  

### Points to remember  

1. For every action/task, there should be an entry point. entry_point is the script to execute this action. This can either be a python script or a shell script. OpenSDS prefers python script for using the rich python libraries, as required
2. All the parameters of this actions are detailed here. It should define the `type` of the parameter, whether this parameter is `required` or not and if the pramaeter can have some `default` value
3. The action should specify `runner_type`. Ex: `runner_type: "python_script`

#### Example of python runner script (create_volume.py)  

```python
import requests
import json

from st2common.runners.base_action import Action


class CreateVolumeAction(Action):
    def run(self,
            ip_addr="",
            port="",
            tenant_id="",
            name="",
            description="Volume",
            availability_zone="default",
            profile_id="",
            snapshot_id="",
            snapshot_from_cloud="",
            auth_token="",
            size=1):
        data = {
            "Name": name,
            "Description": description,
            "AvailabilityZone": availability_zone,
            "ProfileId": profile_id,
            "SnapshotId": snapshot_id,
            "SnapshotFromCloud": snapshot_from_cloud,
            "Size": size
            }
        if profile_id:
            data["ProfileId"] = profile_id

        url = "http://" + \
            ip_addr + ":" + \
            port + "/v1beta/" + \
            tenant_id + "/block/volumes"

        headers = {
            'content-type': 'application/json',
            'x-auth-token': auth_token
        }
        r = requests.post(url=url, data=json.dumps(data), headers=headers)
        r.raise_for_status()
        resp = r.json()
        return resp["id"]
```

### Points to remember  

1. Every python script need to import `Action` from `st2common.eunners.base_action`
2. Define your action class which inherits from `Action` base class
3. This class must define the `run` function
4. All the business logic to execute the action goes into this `run` method
5. Parameters for the `run` method is the class object (`self` here) and all the required parameters for this action. These parameters are same that was defined in the corresponding action YAML

## How to load it into the Orchestration Manager  

Once the workflows, actions and runners are defined, these workflows need to be registered into the Orchestration Manager, StackStorm.
If StackStorm is installed using Docker image then Go to the interactive bash cell of the StackStorm docker instance and follow the steps below
Else
Go to the command prompt and execute:
### register service command  

```bash
$ st2ctl reload --register-all
```

This will register the new workflows and actions into the StackStorm DB

Once it has been loaded successfully, it can be checked using:  

### list action command  

```bash
$ st2 action list 
``` 

or 

```bash
$ st2 action list | grep opensds
# to check all the opensds pack workflows and actions
```

#### Example for listing all actions  

```bash
$ st2 action list | grep opensds
| opensds.attach-volume            | opensds | Attach Volume                                 |
| opensds.create-bucket            | opensds | Create Bucket for s3 interface of multi-cloud |
| opensds.create-bucket-migration  | opensds | Create Bucket Migration Dataflow Plan for s3  |
| opensds.create-volume            | opensds | Create Volume                                 |
| opensds.delete-attachment        | opensds | Delete Attachment                             |
| opensds.delete-volume            | opensds | Delete Volume                                 |
| opensds.execute-bucket-migration | opensds | Run Bucket Migration Dataflow Plan            |
| opensds.get-bucket               | opensds | Get Bucket information                        |
| opensds.get-bucket-migration     | opensds | Get Information about Bucket Migration Job    |
| opensds.list-volume              | opensds | List Volume                                   |
| opensds.migration-bucket         | opensds | Bucket Migration Multi-Cloud Service          |
| opensds.provision-volume         | opensds | Provision an OpenSDS Volume                   |
```

## Verify if the workflows are working fine  

To verify you can login into the StackStorm UI and execute the workflow by provising the required inputs.
Alternatively, you can use StackStorm CLI to verify:  

### St2 command to verify  

```
$ st2 action execute opensds.<Your workflow name>  <All input parameters separated by space>
```

## Adding Services into OpenSDS
OpenSDS has different Services for Orchestrating the tasks. These services are grouped under a category. Ex: provision-volume Service is grouped under 'Provisioning'.  
Each service consists of workflow. Like the provision-volume service under the 'Provisioning' group consist of `opensds.provision-volume`. bucket-migration service under the 'Migration' group consist of `opensds.bucket-migration` workflow
Developer can define their own 'Group' and Service name.
To Add a service for a workflow in OpenSDS, orchestration cli `orchctl`
Check `orchctl` help options for register a service
```
$ orchctl service add <service_reg_data>
```

#### Example of service_reg_data:
```json
{
     "name":"volume provision",
     "description":"Volume Service",
     "tenant_id": <OpenSDS tenant id>,
     "user_id": <OpenSDS user id>,
     "input":"",
     "constraint":"",
     "group":"provisioning",
     "workflows":[
         {
             "definition_source":"opensds.provision-volume",
             "wfe_type":"st2"
         }
     ]
 }
```

## Check Services from OpenSDS  

Once the Services are registered properly, it can verified from the API or from the OpenSDS UI under services tab.
#### Example of service listing from API:  

`http://<OpenSDS IP>:5000/v1beta/<tenant_id>/orchestration/services`

```json

[
    {
        "constraint": "",
        "created_at": "Wed, 19 Jun 2019 07:35:44 GMT",
        "description": "Volume Service",
        "group": "provisioning",
        "id": "f7be1a87-fb57-43d9-8a90-bc59109a043a",
        "input": {
            "access_protocol": {
                "description": "Access protocol for attach volume",
                "required": false,
                "type": "string"
            },
            "auth_token": {
                "description": "Authentication Token",
                "required": false,
                "type": "string"
            },
            "availability_zone": {
                "description": "Availablity Zone to create volume",
                "required": false,
                "type": "string"
            },
            "connection_info": {
                "description": "Connectin info JSON to attach volume",
                "required": false,
                "type": "object"
            },
            "description": {
                "description": "Description in any",
                "required": false,
                "type": "string"
            },
            "host_info": {
                "description": "Host info JSON to attach volume",
                "required": false,
                "type": "object"
            },
            "ip_addr": {
                "description": "Host IP for the OpenSDS",
                "required": true,
                "type": "string"
            },
            "mount_point": {
                "description": "Mount point to attach volume",
                "required": false,
                "type": "string"
            },
            "name": {
                "description": "Name of volume for provision",
                "required": true,
                "type": "string"
            },
            "port": {
                "description": "Port number for the service",
                "required": true,
                "type": "string"
            },
            "profile_id": {
                "description": "Profile ID to create volume",
                "required": false,
                "type": "string"
            },
            "size": {
                "description": "Size of volume in GB",
                "required": true,
                "type": "integer"
            },
            "snapshot_from_cloud": {
                "description": "Snapshot from cloud to create volume",
                "required": false,
                "type": "string"
            },
            "snapshot_id": {
                "description": "Snapshot ID to create volume",
                "required": false,
                "type": "string"
            },
            "tenant_id": {
                "description": "Tenant ID or Project ID",
                "required": true,
                "type": "string"
            },
            "timeout": {
                "default": 60,
                "description": "Failure timeout",
                "type": "integer"
            }
        },
        "name": "volume provision",
        "tenant_id": "94b280022d0c4401bcf3b0ea85870519",
        "updated_at": "Wed, 19 Jun 2019 07:35:44 GMT",
        "user_id": "558057c4256545bd8a307c37464003c9",
        "workflows": [
        ]
    }
]
```

## How to Orchestrate the tasks:
Once the Service is registerd, user can create and instance of the Service to get desired orchestrated output. Please refer to the user guide for more on this.

