---
title: VMAX
menuTitle: VMAX 
description: "VMAX Support Matrix"
weight: 19
disableToc: false
tags: ["support matrix", "delfin", "drivers", "dell emc"]
---

#### Model and versions supported
 
 <table>
     <thead>
         <tr>
             <th>Models</th>
             <th>Firmware Versions</th>
         </tr>
     </thead>
     <tbody>
         <tr>
            <td>VMAX 100K, VMAX 200K,VMAX 400K</td>
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
            <td>host</td>
            <td></td>
         </tr>
         <tr>
            <td>port</td>
            <td></td>
         </tr>
         <tr>
            <td>username</td>
            <td></td>
         </tr>
         <tr>
            <td>password</td>
            <td></td>
         </tr>
         <tr>
             <td></td>
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
            <td>Unisphere</td>
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
         <tr>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               <tr>
             <td rowspan=9>Pool</td>
             <td>id</td>
             <td></td>
         </tr>
         <tr>
             <td>name</td>
             <td></td>
         </tr>
         <tr>
             <td>storage_id</td>
             <td></td>
         </tr>
         <tr>
            <td>native_storage_pool_id</td>
            <td></td>
         </tr>
         <tr>
            <td>description</td>
            <td></td>
         </tr>
         <tr>
            <td>status</td>
            <td></td>
         </tr>
         <tr>
            <td>total_capacity</td>
            <td></td>
         </tr>
         <tr>
            <td>used_capacity</td>
            <td></td>
         </tr>
         <tr>
            <td>free_capacity</td>
            <td></td>
         </tr>
     <tr>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               <tr>
          <td rowspan=10>Volume</td>
          <td>id</td>
          <td></td>
      </tr>
      <tr>
          <td>name</td>
          <td></td>
      </tr>
      <tr>
          <td>storage_id</td>
          <td></td>
      </tr>
      <tr>
         <td>native_volume_id</td>
         <td></td>
      </tr>
      <tr>
         <td>description</td>
         <td></td>
      </tr>
      <tr>
         <td>status</td>
         <td></td>
      </tr>
      <tr>
      <td>wwn</td>
      <td></td>
      </tr>
      <tr>
         <td>total_capacity</td>
         <td></td>
      </tr>
      <tr>
         <td>used_capacity</td>
         <td></td>
      </tr>
      <tr>
         <td>free_capacity</td>
         <td></td>
      </tr>
      <tr>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               <tr>
           <td rowspan=18>Port</td>
           <td>id</td>
           <td></td>
       </tr>
       <tr>
           <td>name</td>
           <td></td>
       </tr>
       <tr>
           <td>storage_id</td>
           <td></td>
       </tr>
       <tr>
          <td>native_port_id</td>
          <td></td>
       </tr>
       <tr>
          <td>location</td>
          <td></td>
       </tr>
       <tr>
          <td>connection_status</td>
          <td></td>
       </tr>
       <tr>
       <td>health_status</td>
       <td></td>
       </tr>
       <tr>
          <td>type</td>
          <td></td>
       </tr>
       <tr>
          <td>logical_type</td>
          <td></td>
       </tr>
       <tr>
          <td>speed</td>
          <td></td>
       </tr>
       <tr>
       <td>max_speed</td>
       <td></td>
       </tr>
       <tr>
       <td>native_parent_id</td>
       <td></td>
       </tr>
       <tr>
       <td>wwn</td>
       <td></td>
       </tr>
       <tr>
       <td>mac_address</td>
       <td></td>
       </tr>
       <tr>
       <td>ipv4</td>
       <td></td>
       </tr>
       <tr>
       <td>ipv4_mask</td>
       <td></td>
       </tr>
       <tr>
       <td>ipv6</td>
       <td></td>
       </tr>
       <tr>
       <td>ipv6_mask</td>
       <td></td>
       </tr>
       <tr>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               <tr>
            <td rowspan=9>Controllers</td>
            <td>id</td>
            <td></td>
        </tr>
        <tr>
            <td>name</td>
            <td></td>
        </tr>
        <tr>
            <td>storage_id</td>
            <td></td>
        </tr>
        <tr>
           <td>native_controller_id</td>
           <td></td>
        </tr>
        <tr>
           <td>status</td>
           <td></td>
        </tr>
        <tr>
        <td>location</td>
        <td></td>
        </tr>
        <tr>
           <td>soft_version</td>
           <td></td>
        </tr>
        <tr>
           <td>cpu_info</td>
           <td></td>
        </tr>
        <tr>
           <td>memory_size</td>
           <td></td>
        </tr>
        <tr>
        <td rowspan="15">disk</td>
        <td>id</td>
        <td></td>
        </tr>
        <tr>
        <td>name</td>
        <td></td>
        </tr>
        <tr>
        <td>storage_id</td>
        <td></td>
        </tr>
        <tr>
        <td>native_disk_id</td>
        <td></td>
        </tr>
        <tr>
        <td>serial_number</td>
        <td></td>
        </tr>
        <tr>
        <td>manufacturer</td>
        <td></td>
        </tr>
        <tr>
        <td>model</td>
        <td></td>
        </tr>
        <tr>
        <td>firmware</td>
        <td></td>
        </tr>
        <tr>
        <td>speed</td>
        <td></td>
        </tr>
        <tr>
        <td>capacity</td>
        <td></td>
        </tr>
        <tr>
        <td>status</td>
        <td></td>
        </tr>
        <tr>
        <td>physical_type</td>
        <td></td>
        </tr>
        <tr>
        <td>logical_type</td>
        <td></td>
        </tr>
        <tr>
        <td>health_score</td>
        <td></td>
        </tr>
        <tr>
        <td>native_disk_group_id</td>
        <td></td>
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
            <td>SYMAPI_AEVENT2_UID_EVT_RESTARTED</td>
            <td>Warning:event daemon restarted; events may have been lost</td>
         </tr>
         <tr>
             <td>SYMAPI_AEVENT2_UID_EVT_EVENTS_LOST</td>
             <td>Warning:event daemon communications problem; events may have been lost</td>
         </tr>
         <tr>
             <td>SYMAPI_AEVENT2_UID_EVT_EVENTS_OVERFLOW</td>
             <td>Warning:Event Queue overflow; events may have been lost</td>
         </tr>
         <tr>
             <td>SYMAPI_AEVENT2_UID_MOD_DIAG_TRACE_TRIG</td>
             <td>Info:Diagnostic event trace triggered.</td>
         </tr>
         <tr>
             <td>SYMAPI_AEVENT2_UID_MOD_DIAG_TRACE_TRIG_REM</td>
             <td>Info:Remote (SRDF) diagnostic event trace triggered</td>
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