---
title: File Share feature User Guide
description: "User guide for File Share feature."
weight: 10
disableToc: false
---
## File Share Introduction
File share in opensds facilitates the user to create file share, set access permission for that file share and user can also create snapshot. Opensds provides both CLI and Dashboard to operate or play with file share feature.
Goals of file share in opensds are
Facilitating File Share Service by providing Standard API to manage multiple vendors, simplify File Share API definition
File share across the users based on access capability
File share facilitates with profiling
Scope for now is to support only NFS, SMB file share protocols

### Install file share feature with opensds
Follow the wiki link to install opensds https://github.com/opensds/opensds/wiki/OpenSDS-Cluster-Installation-through-Ansible

Make sure backend nfs is enable to use file share feature 
###### NFS
If `nfs` is chosen as storage backend, modify `group_vars/osdsdock.yml`, native nfs driver dependent on lvm:
```yaml
enabled_backends: nfs
```

## Set the environment to start use of file share feature

### OpenSDS CLI
Firstly configure opensds CLI tool:
```bash
sudo cp /opt/opensds-hotpot-linux-amd64/bin/osdsctl /usr/local/bin/

export OPENSDS_ENDPOINT=http://{your_real_host_ip}:50040
export OPENSDS_AUTH_STRATEGY=keystone
export OS_AUTH_URL=http://{your_real_host_ip}/identity
export OS_USERNAME=admin
export OS_PASSWORD=opensds@123
export OS_TENANT_NAME=admin
export OS_PROJECT_NAME=admin
export OS_USER_DOMAIN_ID=default

osdsctl pool list # Check if the pool resource is available
```

#### File share operations
Create a file share profile
```
osdsctl profile create '{"name":"Prf_fileshare", "description":"default policy for fileshare", "storageType":"file"}'
```

Create a file share
```
osdsctl fileshare create <size(int)> -n <fileshare_name> -p <profile_id>
```
List all file shares

```
osdsctl fileshare list
```
Delete the file share
```
osdsctl fileshare delete <fileshare id>
```
Set access for file share

```
osdsctl fileshare acl create <fileshare_id> -a <client_ip> -c <list_of_access_capabilities> -t "ip"
```
client ip is here ip of file share client, which system/user wants to access the file share mounted on server
list of access capablities are read, write, execute, append etc.. For now only read and write capabilities are supported


Create snapshot of file share
```
osdsctl fileshare snapshot create <fileshare_id> -n <snapshot_name> -d "description of file share snapshot"
```

### OpenSDS UI
OpenSDS UI dashboard is available at `http://{your_host_ip}:8088`, please login the dashboard using the default admin credentials: `admin/opensds@123`. Create `tenant`, `user`, and `profiles` as admin.

Logout of the dashboard as admin and login the dashboard again as a non-admin user to manage storage resource

#### File Share Services
* Create a file share

Post login into the OpenSDS UI, File share can be created from: Resource -> File share -> Create
![Fileshare create menu](https://github.com/Shruthi-1MN/documentation/blob/fileshare-userguide/readthedocs/starterguides/userguides/fileshare_menu.PNG)

* Create snapshot

a) Click on File Share name
b) Under Snapshot menu, click on 'Create'
Also the quick option 
a) Click on file share resource menu, and on file share name
b) Under fileshare name menu in same row you can find Create Snapshot link to create snapshot

* Set access permission on file share (IP based access permissions are allowed)
As of now read only and read,write access permissions are allowed, these capabilities allows user to access the mount path based on the access capability set on file share which you have created 
a) Click on File Share name
b) Under file share menu, you can find access menu to create access
Also the quick option 
a) Click on file share resource menu, and on file share name
b) Under fileshare name menu in same row you can find Create Access link to create access

![Fileshare snapshot and access](https://github.com/Shruthi-1MN/documentation/blob/fileshare-userguide/readthedocs/starterguides/userguides/snapshot_access.PNG)

### Some file share standards and limitations

* File share with the same name is not allowed
* File share name should not start with alphanumeric, special characters 
* Snapshot name should not with snapshot keyword 
* Access permission type is allowed only for client IP's. Ex: File Share client machine wants to access directories which are mounted on server, for that you can take grant permission from server by setting permission on directoies by machine IP's. Suppose 10.32.14.23 wants to access /file1 directory from server then it has to set access permission like read only or read, write
* Put operations of ACL is not permitted for now. Once if you set file share access permission for an ip can't be changed ex: 10.32.190.3 is read only for file share /file1 on server, it can't be changed again to read,write

