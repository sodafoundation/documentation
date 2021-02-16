---
title: Add new driver support matrix
description: "Document to add new delfin driver support matrix"
weight: 20
disableToc: false
tags: ["support matrix", "delfin", "drivers"]
---

Find below steps to add new delfin driver support matrix
1. Clone the documentation repository (https://github.com/sodafoundation/documentation.git) 
2. Navigate to the folder structure content/support-matrix/delfin
3. Create a new folder and follow the naming format `vendor`. For example `dell-emc`. 
4. Create a new file `_index.md`
5. Add the frontmatter as follows to add new Vendor. Change the content as required.
```
---
title: IBM
description: "All supported matrix data for IBM Models can be found here"
weight: 5
disableToc: false
---

All supported matrix data for IBM Models which are supported by Delfin Project of SODA can be found here
```

{{% notice note %}}
Please ensure you copy the entire frontmatter including both the `---`
{{% /notice %}}

{{% notice note %}}
Step 3, 4 and 5 are not required if there is already vendor folder name exists in documentation repository
{{% /notice %}}

6. Under vendor folder name, create a new folder with `model` name. For example `VNX`. 
7. Create a new file `_index.md`
8. Add the frontmatter as follows to add new model support matrix data. Change the content as required.
```
---
title: Storwize
description: "All supported matrix data for IBM Models can be found here"
weight: 5
disableToc: false
---

All supported matrix data for IBM Models which are supported by Delfin Project of SODA can be found here
``` 
{{% notice note %}}
Please ensure you copy the entire frontmatter including both the `---`
{{% /notice %}}

9. Use the following support matrix table template and populate it with appropriate drivers data
```
### Model and versions supported

<table>
    <thead>
        <tr>
            <th>Models</th>
            <th>Firmware Versions</th>
        </tr>
    </thead>
    <tbody>
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
           <td rowspan="2"></td>
           <td></td>
           <td></td>
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
           <td></td>
           <td></td>
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
            <th>Default Interval</th>
            <th>Additional information</th>
        </tr>
    </thead>
    <tbody>
        <tr>
           <td></td>
           <td></td>
           <td></td>
        </tr>
        <tr>
            <td></td>
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
           <td></td>
           <td></td>
        </tr>
        <tr>
            <td></td>
            <td></td>
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

```
10. Raise a PR to the documentation repository(https://github.com/sodafoundation/documentation.git)