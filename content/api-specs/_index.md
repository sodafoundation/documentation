---
title: SODA API Standards for Data and Storage
description: "Provides all the API Specifications of SODA Foundation."
weight: 5
disableToc: false
---

## SODA API Specificaiton
The first draft for RFC, v0.0.1 is available [here](https://github.com/sodafoundation/documentation/blob/master/content/api-specs/SODA_API_Standards_for_Data_and_Storage.pdf)


## SODA API Standards  Swagger files
This section provides the latest API Swagger files from github. We are in the process of updating the API Specifications. (In the mean time, if you are looking for specific versions, you can either pick using the release tag or specific commit id from the respective files as given below)

### Block and File APIs (on-prem)
- [SODA Block and File on prem API Swagger](https://github.com/sodafoundation/api/blob/master/openapi-spec/swagger.yaml) : Provides the file and block data management across various storage backends from Application platforms or clients in an on prem environment.

### Object, File(experimental) and Block(experimental) for Multicloud
- [SODA Multicloud API Swagger for Object, File and Block](https://github.com/sodafoundation/multi-cloud/blob/master/openapi-spec/swagger.yaml) : Provides the s3 compatible object APIs. Along with this currently the file and block service APIs (limited APIs and experimental support for only specific cloud backends). For s3, v4 auth is supported. This set of APIs support to connect to multiple cloud backends from client applications.

### Resource Management, Alarm and Telemetry (On Prem)
- [SODA Infrastructure Management API Swagger](https://github.com/sodafoundation/sim) : Provides the APIs to manage storage resources, alarms and performance monitoring. It is getting developed incrementally. The clients can connect using these unified APIs to heterogeneous storage backends. The backend support is getting added incrementally.

_Note: Please check the project page under docs.sodafoundation.io or github.com/sodafoundation/<project> to get the latest supported features._
