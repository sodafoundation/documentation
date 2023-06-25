---
title: OceanStor
menuTitle: OceanStor
description: "OceanStor Support Matrix"
weight: 20
disableToc: false
tags: ["support matrix", "delfin", "drivers", "huawei"]
---

### Model and versions supported

<table>
   <thead>
      <tr>
         <th>Models</th>
         <th>Management Software Versions</th>
      </tr>
   </thead>
   <tbody>
      <tr>
         <td>Storage Management Software</td>
         <td>OceanStor DeviceManager V100R002C20SPC100 or later</td>
      </tr>
   </tbody>
</table>

### Access information to register storage device

<table>
   <thead>
      <tr>
         <th>Access Type</th>
         <th>Attributes</th>
         <th>Additional information</th>
      </tr>
   </thead>
   <tbody>
      <tr>
         <td rowspan="4">REST</td>
         <td>Host</td>
         <td>OceanStor device manager host name supported with ipv4/ipv6</td>
      </tr>
      <tr>
         <td>Port</td>
         <td>OceanStor device manager port</td>
      </tr>
      <tr>
         <td>Username</td>
         <td>OceanStor device manager username</td>
      </tr>
      <tr>
         <td>Password</td>
         <td>OceanStor device manager password</td>
      </tr>
   </tbody>
</table>

### Alert management information

<table>
   <tbody>
      <tr>
          <th>SNMP trap processing</th> 
          <td>Supported</td> 
      </tr>
      <tr>
         <th>Query backend alert</th>
         <td>Supported</td>
      </tr>
      <tr>
         <th>Clear backend alert</th>
         <td>Supported</td>
      </tr>
      <tr>
         <th>SNMP versions for trap</th>
         <td>V1/V2/V3</td>
      </tr>
      <tr>
         <th>SNMP trap source</th>
         <td>OceanStor Device</td>
      </tr>
      <tr>
         <th>Query alert source</th>
         <td>OceanStor Device Manager</td>
      </tr>
   </tbody>
</table>

### Resource data matrix

<table>
   <thead>
      <tr>
         <th>Resource</th>
         <th>Attribute</th>
         <th>Additional information</th>
      </tr>
   </thead>
   <tbody>
      <tr>
         <td rowspan=12>Device</td>
         <td>Name</td>
         <td>Name of storage resource</td>
      </tr>
      <tr>
         <td>Vendor</td>
         <td>Vendor</td>
      </tr>
      <tr>
         <td>Description</td>
         <td>Description</td>
      </tr>
      <tr>
         <td>Model</td>
         <td>Model</td>
      </tr>
      <tr>
         <td>Status</td>
         <td>Status</td>
      </tr>
      <tr>
         <td>Serial Number</td>
         <td>It is serial number id</td>
      </tr>
      <tr>
         <td>Firmware Version</td>
         <td>Firmware Version</td>
      </tr>
      <tr>
         <td>Location</td>
         <td>Device Location</td>
      </tr>
      <tr>
         <td>Total Capacity</td>
         <td>Storage total capacity(bytes)</td>
      </tr>
      <tr>
         <td>Used Capacity</td>
         <td>It is measured in bytes</td>
      </tr>
      <tr>
         <td>Free Capacity</td>
         <td>It is measured in bytes</td>
      </tr>
      <tr>
         <td>Raw Capacity</td>
         <td>Member disk capacity(bytes)</td>
      </tr>
      <tr>
         <td rowspan="9">Pool</td>
         <td>Name</td>
         <td>Name of the pool</td>
      </tr>
      <tr>
         <td>Storage Id</td>
         <td>Id in the delfin system for storage device</td>
      </tr>
      <tr>
         <td>Storage pool id</td>
         <td>Actual storage pool id received from backend</td>
      </tr>
      <tr>
         <td>Description</td>
         <td>Description</td>
      </tr>
      <tr>
         <td>Status</td>
         <td>Status of the pool. Ex: available</td>
      </tr>
      <tr>
         <td>Storage Type</td>
         <td>Type of storage. Ex: Block, file, hybrid</td>
      </tr>
      <tr>
         <td>Total Capacity</td>
         <td>User total capacity(bytes)</td>
      </tr>
      <tr>
         <td>Used Capacity</td>
         <td>User consumed capacity(bytes)</td>
      </tr>
      <tr>
         <td>Free Capacity</td>
         <td>User free capacity(bytes)</td>
      </tr>
      <tr>
         <td rowspan=14>Volume</td>
         <td>Id</td>
         <td>It represents system resource id</td>
      </tr>
      <tr>
         <td>Name</td>
         <td>Volume Name</td>
      </tr>
      <tr>
         <td>Storage Id</td>
         <td>It is id in the delfin system for storage device</td>
      </tr>
      <tr>
         <td>Volume Id</td>
         <td>Actual volume id received from backend</td>
      </tr>
      <tr>
         <td>Storage pool id</td>
         <td>Original pool id received from backend</td>
      </tr>
      <tr>
         <td>Description</td>
         <td>Description</td>
      </tr>
      <tr>
         <td>Type</td>
         <td>Logical Type. Ex:Thick, Thin</td>
      </tr>
      <tr>
         <td>Status</td>
         <td>Status</td>
      </tr>
      <tr>
         <td>WWN</td>
         <td>WWN</td>
      </tr>
      <tr>
         <td>Total Capacity</td>
         <td>Allocated total volume capacity(bytes)</td>
      </tr>
      <tr>
         <td>Used Capacity</td>
         <td>Used capacity from allocated capacity(bytes)<td>
      </tr>
      <tr>
         <td>Free Capacity</td>
         <td>NA. It is none</td>
      </tr>
      <tr>
         <td>Compressed</td>
         <td>Whether to support compression</td>
      </tr>
      <tr>
         <td>Deduplicated</td>
         <td>Deduplication is supported</td>
      </tr>
      <tr>
         <td rowspan=9>Controller</td>
         <td>Id</td>
         <td>It represents system resource id</td>
      </tr>
      <tr>
         <td>Name</td>
         <td>Volume Name</td>
      </tr>
      <tr>
         <td>Storage Id</td>
         <td>It is id in the delfin system for storage device</td>
      </tr>
      <tr>
         <td>Controller Id</td>
         <td>Oceanstor controller id</td>
      </tr>
      <tr>
         <td>Status</td>
         <td>Status</td>
      </tr>
      <tr>
         <td>Location</td>
         <td>Controller location</td>
      </tr>
      <tr>
         <td>Software Version</td>
         <td>Software Version</td>
      </tr>
      <tr>
         <td>CPU Info</td>
         <td>CPU processor information</td>
      </tr>
      <tr>
         <td>Memory Size</td>
         <td>Memory size measure in bytes</td>
      </tr>
      <tr>
         <td rowspan=17>Port</td>
         <td>Name</td>
         <td>Name</td>
      </tr>
      <tr>
         <td>Storage Id</td>
         <td>It is Id within delfin system for storage device</td>
      </tr>
      <tr>
         <td>Port id</td>
         <td>Actual port id received from backend</td>
      </tr>
      <tr>
         <td>Location</td>
         <td></td>
      </tr>
      <tr>
         <td>Connection Status</td>
         <td>Status of port connection. Ex: disconnected</td>
      </tr>
      <tr>
         <td>Health Status</td>
         <td>Port health status </td>
      </tr>
      <tr>
         <td>Type</td>
         <td>Type of port. Ex:fc, iscsi, fcoe, etc.</td>
      </tr>
      <tr>
         <td>Logical type</td>
         <td>Port logical type. Ex:frontend, maintenance, service, management, etc.</td>
      </tr>
      <tr>
         <td>Speed</td>
         <td>Speed of the ports</td>
      </tr>
      <tr>
         <td>Max Speed</td>
         <td>Maximum speed of the ports</td>
      </tr>
      <tr>
         <td>Parent Id</td>
         <td>Id of parent object(controller/host)</td>
      </tr>
      <tr>
         <td>WWN</td>
         <td>WWN</td>
      </tr>
      <tr>
         <td>mac address</td>
         <td></td>
      </tr>
      <tr>
         <td>ipv4</td>
         <td></td>
      </tr>
      <tr>
         <td>ipv4 mask</td>
         <td></td>
      </tr>
      <tr>
         <td>ipv6</td>
         <td></td>
      </tr>
      <tr>
         <td>ipv6 mask</td>
         <td></td>
      </tr>
      <tr>
         <td rowspan=17>Disk</td>
         <td>Name</td>
         <td>Name of storage resource</td>
      </tr>
      <tr>
         <td>Storage Id</td>
         <td>It is storage id within delfin system</td>
      </tr>
      <tr>
         <td>Disk id</td>
         <td>Actual disk id received from backend</td>
      </tr>
      <tr>
         <td>Serial number</td>
         <td>Serial Number</td>
      </tr>
      <tr>
         <td>Manufacturer</td>
         <td>Manufacturer</td>
      </tr>
      <tr>
         <td>Model</td>
         <td>Model</td>
      </tr>
      <tr>
         <td>Firmware</td>
         <td>Firmware Version</td>
      </tr>
      <tr>
         <td>Speed</td>
         <td>Speed of the disk(rpm)</td>
      </tr>
      <tr>
         <td>Capacity</td>
         <td>Total number of disk sectors multiply by disk sector size(bytes)</td>
      </tr>
      <tr>
         <td>Status</td>
         <td>Status</td>
      </tr>
      <tr>
         <td>Physical type</td>
         <td>Disk physical type. Ex:sata, sas, ssd, etc.</td>
      </tr>
      <tr>
         <td>Logical type</td>
         <td>Disk logical type. Ex:frontend, maintenance, service, management, etc. </td>
      </tr>
      <tr>
         <td>Health Score</td>
         <td>Disk health score</td>
      </tr>
      <tr>
         <td>Disk group id</td>
         <td></td>
      </tr>
      <tr>
         <td>Location</td>
         <td>Location of the disk</td>
      </tr>
   </tbody>
</table>

### Alert data matrix

<table>
   <thead>
      <tr>
         <th>Attribute</th>
         <th>Additional information</th>
      </tr>
   </thead>
   <tbody>
      <tr>
         <td>Alert id</td>
         <td>Identification of alarm</td>
      </tr>
      <tr>
         <td>Alert name</td>
         <td>Name of the alert</td>
      </tr>
      <tr>
         <td>Severity</td>
         <td>Severity of the alert</td>
      </tr>
      <tr>
         <td>Category</td>
         <td>Category of the reported alarm notification. Ex: Fault, Event, Recovery</td>
      </tr>
      <tr>
         <td>Type</td>
         <td>Type of the alert generated such as CommunicationsAlarm, EquipmentAlarm etc.</td>
      </tr>
      <tr>
         <td>Sequence number</td>
         <td>Sequence number for the alert, uniquely identifies a
         given alert instance used for clearing the alert</td>
      </tr>
      <tr>
         <td>Occur time</td>
         <td>Time at which alert is generated from device. Specified in epoch format</td>
      </tr>
      <tr>
         <td>Description</td>
         <td>Description</td>
      </tr>
      <tr>
         <td>Recovery advice</td>
         <td>Some suggestion for handling the given alert</td>
      </tr>
      <tr>
         <td>Resource type</td>
         <td>Resource type of device/source generating alert.This is always set to "Storage"</td>
      </tr>
      <tr>
         <td>Location</td>
         <td>Location of an alarm. Specified in name/value format</td>
      </tr>
   </tbody>
</table>