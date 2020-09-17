---
title: Object Lifecycle Management
description: "Developer guide for Object Lifecycle Management."
weight: 40
disableToc: false
tags: ["developer guide", "object lifecycle"] 
---
## Overview

This guide is intended for Object Lifecycle feature developers. It provides detailed steps to write new API using SODA. To understand the feature and requirements in detail, please refer to the Object Lifecycle Management [user guide](/guides/user-guides/object-lifecycle-management/) and Object Lifecycle [design spec](https://github.com/sodafoundation/design-specs/blob/master/specs/capri/object_lifecycle_management.md). 


## APIs
APIs are a set of functions and procedures that allow for the creation of applications that access data and features of other applications, services or operating system. In SODA lifecycle management feature we are using APIs to communicate with different storage backend.


### Write new API
Before starting to write the APIs, it is required to have basic understanding of XML and JSON syntax.

#### There are three major steps involved:
    a) All APIs go into the 's3' module of the SODA multi-cloud package, i,e. sodafoundation/multi-cloud/api/pkg/s3 directory
=======
## Write new API
Before starting to write the APIs, it is required to have basic understanding of XML and JSON syntax.

## How to write the APIs

### There are three major steps involved:
    a) All APIs goes into the 's3' module of the SODA multi-cloud package, i,e. sodafoundation/multi-cloud/api/pkg/s3 directory
    b) The corresponding router for the API are defined same directory.
    c) For every API there must be a function defined in proto file.
Example of adding API router (router.go):
```
func RegisterRouter(ws *restful.WebService) {
	handler := NewAPIService(client.DefaultClient)
	ws.Route(ws.POST("/{tenantId}/backends/{id}").To(handler.postBackend)).
		Doc("post backend details")
```

#### Points to remember:
   a) After adding a router to API just create the API file in the same directory.   
   b) Try to call the API using curl or postman to see if the API is been called successfully.          
   c) If your API has XML struct in Request body then unmarshal it into json struct

Example of xml (xmlstruct.go):
```
type Rule struct {
	ID                             string                         `xml:"ID"`
	param1                         int32                          `xml:"param1"`
	param2                         string                         `xml:"param2"`
}
```
Example of json struct (in protobuf):
```
type LifecycleRule struct {
	Id                             string              `protobuf:"bytes,1,opt,name=id,proto3" json:"id,omitempty"`
	param1                         int32               `protobuf:"bytes,2,opt,name=param1,proto3" json:"param1,omitempty"`
	param2                         string              `protobuf:"bytes,3,opt,name=param2,proto3" json:"param2,omitempty"`
}
```
### Points to remember:
    a) After unmarshalling into json struct and populating the fields, call the respective function from the s3 client and also in database.
    b) Validate all the functions using log messages.
    c) The API should successfully return and all the changes to be reflected in database should be seen in database client(for lifecycle feature the database is MongoDB)

## How to start multi-cloud into the Docker container
To start testing multi-cloud lifecycle feature, you need to first start multi-cloud service using steps below in the docker container.

```
docker-compose up -d
docker ps
```
#### Check if multi-cloud api service and mongo is running:
```
CONTAINER ID        IMAGE                             COMMAND                  CREATED             STATUS              PORTS                                                NAMES
c245b39b9a7d        opensdsio/multi-cloud-dataflow    "/dataflow"              6 hours ago         Up 6 hours                                                               multi-cloud_dataflow_1_b4432dc97238
6bff89fd48b6        opensdsio/multi-cloud-datamover   "/datamover"             6 hours ago         Up 6 hours                                                               multi-cloud_datamover_1_6aa7bb101f33
561d334d2ca8        opensdsio/multi-cloud-s3          "/s3"                    6 hours ago         Up 6 hours                                                               multi-cloud_s3_1_84b4c3f135b2
a7288d668842        opensdsio/multi-cloud-api         "/api"                   6 hours ago         Up 6 hours          0.0.0.0:8089->8089/tcp                               multi-cloud_api_1_783889b02933
247d70f62574        wurstmeister/kafka:2.11-2.0.1     "start-kafka.sh"         12 days ago         Up 6 hours          0.0.0.0:9092->9092/tcp                               multi-cloud_kafka_1_e666cc1a0f3b
a2c136ae7421        opensdsio/multi-cloud-backend     "/backend"               12 days ago         Up 6 hours                                                               multi-cloud_backend_1_1983cccd8ac9
eea40a48de97        wurstmeister/zookeeper            "/bin/sh -c '/usr/sb…"   12 days ago         Up 6 hours          22/tcp, 2888/tcp, 3888/tcp, 0.0.0.0:2181->2181/tcp   multi-cloud_zookeeper_1_6643a83ddcdd
5dbac9cca10e        mongo                             "docker-entrypoint.s…"   12 days ago         Up 6 hours          0.0.0.0:27017->27017/tcp                             multi-cloud_datastore_1_a0281d684ef3
```

To check if the API changes are reflected in database, install mongoDB compass and check the metadata of the buckets


![mongo connection image  ](opensds_mongo.png?raw=true)


#### The postman request for API call:

Here is a sample API call using postman, it contains request body information as well as response.

![postman api call image  ](postman.png?raw=true)

Check log files of multi-cloud api service for more details and debug information
