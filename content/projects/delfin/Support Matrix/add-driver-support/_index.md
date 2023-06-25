---
title: Add new driver support matrix
description: "Document to add new delfin driver support matrix"
weight: 20
disableToc: false
tags: ["support matrix", "delfin", "drivers"]
---

Find below steps to add new delfin driver support matrix  
1. Clone the [documentation repository](https://github.com/sodafoundation/documentation.git)  
2. Navigate to the folder structure content/support-matrix/delfin  
3. Create a new folder with `vendor` name. For example `dell-emc`.  
4. Create a new file `_index.md`  
5. Add the frontmatter as follows to add new Vendor. Change the content as required.  

```
---
title: Dell EMC
description: "Support matrix data for Dell EMC Models can be found here"
weight: 5
disableToc: false
---

Support matrix data for Dell EMC Models can be found here

```
{{% notice note %}}
Please ensure you copy the entire frontmatter including both the `---`
{{% /notice %}}
{{% notice note %}}
Step 3, 4 and 5 are not required if there is already vendor folder name exists in the documentation repository
{{% /notice %}}  
6. Under vendor folder name, create a new folder with `model` name. For example `vnx`.  
7. Create a new file `_index.md`.  
8. Add the frontmatter as follows. Change the content as required.  
```
---
title: VNX
menuTitle: VNX 
description: "VNX Support Matrix"
weight: 20
disableToc: false
tags: ["support matrix", "delfin", "drivers", "dell emc"]
---
```  
{{% notice note %}}
Please ensure you copy the entire frontmatter including both the `---`
{{% /notice %}}  
9. To add all the support matrix tables content, copy lines from 57 to 432 from the file content/support-matrix/delfin/add-driver-support/_index.md     
10. Fill appropriate driver data to support matrix tables.  
11. Please find below sample driver support matrix data tables with sample data for reference to fill specific driver support matrix data.  
12. Raise a PR to the documentation repository  
# Support matrix template
### Model and management software versions supported

<table>
   <thead>
      <tr>
         <th>Models</th>
         <th>Management Software Versions</th>
      </tr>
   </thead>
   <tbody>
      <tr>
         <td>Sample model name</td>
         <td>Management software version</td>
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
         <td>Management software version host name</td>
      </tr>
      <tr>
         <td>Port</td>
         <td>Management software version port name</td>
      </tr>
      <tr>
         <td>Username</td>
         <td>Management software version Username</td>
      </tr>
      <tr>
         <td>Password</td>
         <td>Management software version Password</td>
      </tr>
      <tr>
         <td rowspan="4">SSH</td>
         <td>Host</td>
         <td>Management software version host name</td>
      </tr>
      <tr>
         <td>Port</td>
         <td>Management software version port name</td>
      </tr>
      <tr>
         <td>Username</td>
         <td>Management software version Username</td>
      </tr>
      <tr>
         <td>Password</td>
         <td>Management software version Password</td>
      </tr>
   </tbody>
</table>

### Alert management information
<table>
   <tbody>
      <tr>
          <td><strong>SNMP trap processing</strong></td> 
          <td>Specify whether SNMP trap is supported or not supported</td> 
      </tr>
      <tr>
         <td><strong>Query backend alert</strong></td>
         <td>Specify whether Query alert is supported or not supported</td>
      </tr>
      <tr>
         <td><strong>Clear backend alert</strong></td>
         <td>Specify whether Clear alert is supported or not supported</td>
      </tr>
      <tr>
         <td><strong>SNMP versions for trap</strong></td>
         <td>Specify SNMP supported version by driver</td>
      </tr>
      <tr>
         <td><strong>SNMP trap source</strong></td>
         <td>Alert source name supported by driver</td>
      </tr>
      <tr>
         <td><strong>Query alert source</strong></td>
         <td>Query alert source name supported by driver</td>
      </tr>
   </tbody>
</table>

### Performance registration information

<table>
   <thead>
      <tr>
         <th>Resource</th>
         <th>Default Interval</th>
         <th>Additional information</th>
      </tr>
   </thead>
   <tbody>
      <tr>
         <td>Storage Node</td>
         <td>True</td>
         <td>Storage Node performance metrics are supported by driver and default interval performance metric collection enabled</td>
      </tr>
      <tr>
         <td>Storage Pool</td>
         <td>True</td>
         <td>Storage Pool performance metrics are supported by driver and default interval performance metric collection enabled</td>
      </tr>
      <tr>
         <td>Volume</td>
         <td>True</td>
         <td>Volume performance metrics are supported by driver and default interval performance metric collection enabled</td>
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
         <td>Delfin system resource id for pool</td>
      </tr>
      <tr>
         <td>Name</td>
         <td>Name</td>
      </tr>
      <tr>
         <td>Storage Id</td>
         <td>Id generated by Delfin to identify the storage device</td>
      </tr>
      <tr>
         <td>Storage Pool Id</td>
         <td>It is actual storage pool(storage resource pool) name which is received from backend</td>
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
         <td>Total pool capacity(bytes)</td>
      </tr>
      <tr>
         <td>Used Capacity</td>
         <td>Storage pool used capacity(bytes)</td>
      </tr>
      <tr>
         <td>Free Capacity</td>
         <td>Total used capacity(TB)</td>
      </tr>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
      <tr>
         <td rowspan=11>Volume</td>
         <td>Id</td>
         <td>Delfin system resource id for volume</td>
      </tr>
      <tr>
         <td>Name</td>
         <td>Volume Name</td>
      </tr>
      <tr>
         <td>Storage Id</td>
         <td>Id generated by Delfin to identify the storage device</td>
      </tr>
      <tr>
         <td>Volume Id</td>
         <td>Actual volume id received from backend drivers</td>
      </tr>
      <tr>
         <td>Description</td>
         <td>Description</td>
      </tr>
      <tr>
         <td>Type</td>
         <td>Logical Type. Ex:Thin or Thick</td>
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
         <td>Volume total capacity(TB)</td>
      </tr>
      <tr>
         <td>Used Capacity</td>
         <td>Volume used capacity</td>
      </tr>
      <tr>
         <td>Free Capacity</td>
         <td>Volume free capacity</td>
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
         <td>Serial number of the array/disk</td>
      </tr>
      <tr>
         <td>Location</td>
         <td>Device Location, is name-value pair having component type and component name</td>
      </tr>
      <tr>
         <td>Total Capacity</td>
         <td>Total usable capacity of the array</td>
      </tr>
      <tr>
         <td>Used Capacity</td>
         <td>Total used capacity</td>
      </tr>
      <tr>
         <td>Free Capacity</td>
         <td>Total free capacity</td>
      </tr>
      <tr>
         <td>Raw Capacity</td>
         <td>Total raw capacity(sum of all disk capacity)</td>
      </tr>
      <tr>
         <td>Subscribed Capacity</td>
         <td>Total amount of capacity subscribed</td>
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
         <td>Category of the reported alarm notification. Ex: Fault, Event or Recovery</td>
      </tr>
      <tr>
         <td>Type</td>
         <td>Basic classification of the alarm. Ex:CommunicationsAlarm, EquipmentAlarm</td>
      </tr>
      <tr>
         <td>Sequence number</td>
         <td>Unique identification for the alert instance</td>
      </tr>
      <tr>
         <td>Occur time</td>
         <td>Time at which alert is generated from device. Specified in epoch format</td>
      </tr>
      <tr>
         <td>Description</td>
         <td>Alarm Description</td>
      </tr>
      <tr>
         <td>Recovery advice</td>
         <td>This field does not contain any info. However description field may contain some recovery advice in some cases.</td>
      </tr>
      <tr>
         <td>Resource type</td>
         <td>Resource type for alert which can be storage subsystem or some other subsystems</td>
      </tr>
      <tr>
         <td>Location</td>
         <td>Detailed info about tracing the alerting device such as array id, component name, component type</td>
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
         <td rowspan=3>Storage Array</td>
         <td>Bandwidth</td>
         <td>Total bandwidth in MB/s</td>
      </tr>
      <tr>
         <td>Response time</td>
         <td>Total read and write response time in MB/s</td>
      </tr>
      <tr>
         <td>Throughput</td>
         <td>Total disks throughput(MB/s)</td>
      </tr>
      <tr>
         <td rowspan=3>Storage Pool</td>
         <td>Total Throughput</td>
         <td>Total read and write throughput</td>
      </tr>
      <tr>
         <td>IOPS</td>
         <td>Total read and write IOPS</td>
      </tr>
      <tr>
         <td>Utilization</td>
         <td>Total read and write utilization</td>
      </tr>
      <tr>
         <td rowspan=3>Volume</td>
         <td>Response time</td>
         <td>Total read and write response time in MB/s</td>
      </tr>
      <tr>
         <td>Cache hits ratio</td>
         <td>Total read and write cache hit ratio</td>
      </tr>
      <tr>
         <td>Cache hits</td>
         <td>A count of the number of cache hits</td>
      </tr>
   </tbody>
</table>