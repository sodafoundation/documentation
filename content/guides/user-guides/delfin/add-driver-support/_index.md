---
title: Add new driver support matrix
description: "User guide to add new delfin driver support matrix"
weight: 40
disableToc: false
tags: ["user guide", "delfin", "drivers"]
---
Find below steps to add new delfin driver support matrix
1. Clone the documentation repository (https://github.com/sodafoundation/documentation.git) 
2. Navigate to folder structure content/guides/user-guides/delfin/driver-matrix-support
3. Create a new folder and follow the naming `vendor-model`. For example `dell-emc-vmax`
4. Create a new file `_index.md`
5. Add the frontmatter as follows. Change the content as required.
```
---
title: Dell EMC VMAX 
menuTitle: Dell EMC VMAX 
description: "Dell EMC VMAX Support Matrix"
weight: 20
disableToc: false
tags: ["user guide", "delfin", "drivers", "dell emc"]
---
``` 
{{% notice note %}}
Please ensure you copy the entire frontmatter including both the `---`
{{% /notice %}}

6. Use the following support matrix table template and populate it with appropriate data
```
### Model and versions supported

|Models   | Firmware Versions   |
|---------|---------------------|
|         |                     |
|         |                     |

### Access information to register storage

|Access Type   | Attributes   | Description |
|--------------|--------------|-------------|
|              |              |             |
|              |              |             |

### Supported alert source registration information

| Alert Source | Supported Protocols | Additional information|
|--------------|---------------------|-----------------------|
|              |                     |                       |

### Performance registration information

| Resource | Default Interval | Historic collection available | Additional information |
|----------|------------------|-------------------------------|------------------------|
|          |                  |                               |                        |

### Resource data matrix

| Resource | Attribute | Status | Additional information |
|----------|-----------|--------|------------------------|
|          |           |        |                        |

### Alert data matrix

| Attribute | Status | Additional information |
|-----------|--------|------------------------|
|           |        |                        |

### Performance metric data

| Resource | Metric | Status | Additional information |
|----------|--------|--------|------------------------|
|          |        |        |                        |
|          |        |        |                        |

```
7. Raise a PR to the documentation repository(https://github.com/sodafoundation/documentation.git)