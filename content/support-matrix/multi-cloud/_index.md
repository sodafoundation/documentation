---
title: Multi-cloud support matrix
menuTitle: Multi-cloud
description: "Matrix data for supported cloud vendors and features"
weight: 15
disableToc: false
tags: ["support matrix", "multi-cloud", "cloud vendors"] 
---
This section provides the matrix about the supported cloud providers and the features for SODA multi-cloud.

{{%children style="h3" description="true" %}}  

## Supported Backends
<table>
    <thead>
       <tr>
          <th>Vendor</th>
          <th>Object</th>
          <th>File</th>
          <th>Block</th>
       </tr>
    </thead>
    <tbody>
       <tr>
          <td> AWS</td>
          <td> Y </td>
          <td> Y </td>
          <td> Y </td>
       </tr>
       <tr>
          <td> Azure</td>
          <td> Y </td>
          <td> Y </td>
          <td> N </td>
       </tr>
       <tr>
          <td> GCP</td>
          <td> Y </td>
          <td> Y </td>
          <td> N </td>
       </tr>
       <tr>
          <td> Huawei</td>
          <td> Y </td>
          <td> Y </td>
          <td> Y </td>
       </tr>
       <tr>
          <td> IBM COS</td>
          <td> Y </td>
          <td> N</td>
          <td> N </td>
       </tr>
       <tr>
          <td> Ceph S3 (on-premise)</td>
          <td> Y </td>
          <td> N </td>
          <td> N </td>
       </tr>
       <tr>
          <td> YiG S3 (on-premise)</td>
          <td> Y </td>
          <td> N/A </td>
          <td> N/A </td>
       </tr>
       <tr>
          <td> Alibaba</td>
          <td> Y </td>
          <td> N </td>
          <td> N </td>
       </tr>
    </tbody>
</table>
(Y -Yes | N - No | N/A - Not Applicable)  

## Supported Frontends (REST based)
* SODA UI
* Postman
* cURL
