---
title: VMAX
menuTitle: VMAX 
description: "VMAX Support Matrix"
weight: 19
disableToc: false
tags: ["support matrix", "delfin", "drivers", "dell emc"]
---

### Model and Management software versions supported

<table>
   <thead>
      <tr>
         <th>Models</th>
         <th>Management Software Versions</th>
      </tr>
   </thead>
   <tbody>
      <tr>
         <td>VMAX 250F, VMAX 450F, VMAX 850F, VMAX 950F, VMAX 100K, VMAX 200K,VMAX 400K</td>
         <td>Unisphere 9.0 or later</td>
      </tr>
      <tr>
         <td></td>
         <td></td>
      </tr>
   </tbody>
</table>

### Access information to register storage

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
         <td>Unisphere Host</td>
         <td>Unishpere host name</td>
      </tr>
      <tr>
         <td>Unisphere Port</td>
         <td>Unisphere port name</td>
      </tr>
      <tr>
         <td>Username</td>
         <td>Username</td>
      </tr>
      <tr>
         <td>Password</td>
         <td>Password</td>
      </tr>
      <tr>
         <td></td>
         <td></td>
      </tr>
   </tbody>
</table>

### Supported alert source registration information

<table>
   <thead>
      <tr>
         <th>Alert Source</th>
         <th>Supported Protocols</th>
         <th>Additional information</th>
      </tr>
   </thead>
   <tbody>
      <tr>
         <td>Solution Enabler</td>
         <td>SNMP</td>
         <td></td>
      </tr>
      <tr>
         <td></td>
         <td></td>
         <td></td>
      </tr>
   </tbody>
</table>

### Performance registration information

<table>
   <thead>
      <tr>
         <th>Resource</th>
         <th>Metric</th>
         <th>Additional information</th>
      </tr>
   </thead>
   <tbody>
      <tr>
         <td rowspan=3></td>
         <td></td>
         <td></td>
      </tr>
      <tr>
         <td></td>
         <td></td>
      </tr>
      <tr>
         <td></td>
         <td></td>
      </tr>
      <tr>
         <td></td>
         <td></td>
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
      <tr>
         <td rowspan=10>Pool</td>
         <td>Id</td>
         <td>Indicates the Delfin system resource ID</td>
      </tr>
      <tr>
         <td>Name</td>
         <td>Name</td>
      </tr>
      <tr>
         <td>Storage Id</td>
         <td>Id in the delfin system</td>
      </tr>
      <tr>
         <td>Storage Pool Id</td>
         <td>Unique id to represent which storage pool it belongs to</td>
      </tr>
      <tr>
         <td>Storage Type</td>
         <td>Type of storage. Ex: Block, file, hybrid</td>
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
         <td>Total Capacity</td>
         <td>It is measured in terms of Tera byte</td>
      </tr>
      <tr>
         <td>Used Capacity</td>
         <td>It is measured in terms of Tera byte</td>
      </tr>
      <tr>
         <td>Free Capacity</td>
         <td>It is measured in terms of Tera byte</td>
      </tr>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
      <tr>
         <td rowspan=11>Volume</td>
         <td>Id</td>
         <td>It represents system resource id</td>
      </tr>
      <tr>
         <td>Name</td>
         <td>Volume Name</td>
      </tr>
      <tr>
         <td>Storage Id</td>
         <td>It is id in the delfin system</td>
      </tr>
      <tr>
         <td>Volume Id</td>
         <td>It is LUN id on the device</td>
      </tr>
      <tr>
         <td>Description</td>
         <td>Description</td>
      </tr>
      <tr>
         <td>Type</td>
         <td>Logical Type. Ex:Common LUN, Thin LUN</td>
      </tr>
      <tr>
         <td>Status</td>
         <td>Status</td>
      </tr>
      <tr>
         <td>wwn</td>
         <td>World wide name is to identify network storage devices</td>
      </tr>
      <tr>
         <td>Total Capacity</td>
         <td>It is measured in terms of Tera byte</td>
      </tr>
      <tr>
         <td>Used Capacity</td>
         <td>It is measured in terms of Tera byte</td>
      </tr>
      <tr>
         <td>Free Capacity</td>
         <td>It is measured in terms of Tera byte</td>
      </tr>
      <tr>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
      <tr>
         <td rowspan=18>Device</td>
         <td>Name</td>
         <td>Device Name</td>
      </tr>
      <tr>
         <td>Vendor</td>
         <td>Vendor</td>
      </tr>
      <tr>
         <td>Description</td>
         <td>Device Description</td>
      </tr>
      <tr>
         <td>Model</td>
         <td>Device Model</td>
      </tr>
      <tr>
         <td>Firmware version</td>
         <td>Firmware version</td>
      </tr>
      <tr>
         <td>Status</td>
         <td>It shows availability of device ex: offline, normal etc.</td>
      </tr>
      <tr>
         <td>Serial Number</td>
         <td>It is VMAX array id</td>
      </tr>
      <tr>
         <td>Location</td>
         <td>Device Location, is name-value pair having component type and component name</td>
      </tr>
      <tr>
         <td>Total Capacity</td>
         <td>It is measured in terms of Tera byte</td>
      </tr>
      <tr>
         <td>Used Capacity</td>
         <td>It is measured in terms of Tera byte</td>
      </tr>
      <tr>
         <td>Free Capacity</td>
         <td>It is measured in terms of Tera byte</td>
      </tr>
      <tr>
         <td>Raw Capacity</td>
         <td>It is measured in terms of Giga byte</td>
      </tr>
      <tr>
         <td>Subscribed Capacity</td>
         <td>Refers to capacity allocated to device/host</td>
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
         <td>Identification of alarm.</td>
      </tr>
      <tr>
         <td>Alert name</td>
         <td>Name of the alarm</td>
      </tr>
      <tr>
         <td>Severity</td>
         <td>Severity of the alarm</td>
      </tr>
      <tr>
         <td>Category</td>
         <td>Type of the reported alarm notification. Ex: New, Fixed, Removed etc.</td>
      </tr>
      <tr>
         <td>Type</td>
         <td>Basic classification of the alarm. Ex:CommunicationsAlarm, EquipmentAlarm</td>
      </tr>
      <tr>
         <td>Sequence number</td>
         <td>It maps to the trap</td>
      </tr>
      <tr>
         <td>Occur time</td>
         <td>Alert trap created time</td>
      </tr>
      <tr>
         <td>Description</td>
         <td>Alarm Description</td>
      </tr>
      <tr>
         <td>Recovery advice</td>
         <td>Recovery AdviceEx: SNMP authentication parameters are invalid</td>
      </tr>
      <tr>
         <td>Resource type</td>
         <td>Resource type for alert</td>
      </tr>
      <tr>
         <td>Location</td>
         <td>Detailed info about the tracing the alerting device such as slot, rack etc.</td>
      </tr>
   </tbody>
</table>
 
### Performance metric data
 
<table>
   <thead>
      <tr>
         <th>Resource</th>
         <th>Metric</th>
         <th>Additional information</th>
      </tr>
   </thead>
   <tbody>
      <tr>
         <td rowspan=3></td>
         <td></td>
         <td></td>
      </tr>
      <tr>
         <td></td>
         <td></td>
      </tr>
      <tr>
         <td></td>
         <td></td>
      </tr>
      <tr>
         <td></td>
         <td></td>
      </tr>
   </tbody>
</table>

