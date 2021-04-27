
## Ceph CSI Introduction
Ceph CSI in SODA Plug n Play facilitates the user to create persistent storage in their respective storage backend.

Follow the below given steps to use ceph rbd storage driver with soda plug n play.


###### Step1
Create the user with following permissions :

```yaml
ceph auth get-or-create client.<client-name> osd 'allow rwx pool=<pool-name>' mon 'allow r' -o /etc/ceph/ceph.client.<clientname>.keyring

```
example
```
ceph auth get-or-create client.kube osd 'allow rwx pool=osdsrbd' mon 'allow r' -o /etc/ceph/ceph.client.kube.keyring
```
###### Step2
Data Pool needs to be associated with a rbd application before use

```yaml
ceph osd pool application enable {pool-name} {application-name}
```
example
```
ceph osd pool application enable osdsrbd rbd
```

###### Step3
Initialize the pool to be used by RBD

```yaml
rbd pool init <pool-name>
```
example
```
rbd pool init osdsrbd
```

###### Step4
Adjust the tunables on the ceph cluster

```yaml
ceph osd crush tunables hammer

grep -q "^rbd default features" /etc/ceph/ceph.conf || sed -i '/\[global\]/arbd default features = 1' /etc/ceph/ceph.conf
```
###### Step5

list ceph users:

```go
ceph auth list

osd.0
        key: AQAjVoFgICkGFxAA4qsMrH+7TYfG3UczOiYmJg==
        caps: [mgr] allow profile osd
        caps: [mon] allow profile osd
        caps: [osd] allow *
client.admin
        key: AQBQVYFgnMTCFxAAYHuin1Ahzlp3gf3bt268xw==
        caps: [mds] allow *
        caps: [mgr] allow *
        caps: [mon] allow *
        caps: [osd] allow *
client.bootstrap-mds
        key: AQBRVYFgXscVMRAA//9Xl6/m0vaiq2VNuZJ73w==
        caps: [mon] allow profile bootstrap-mds
client.bootstrap-mgr
        key: AQDdsYJgM2c0JxAA+qFPOcyhUx15/wsdI8nG4g==
        caps: [mon] allow profile bootstrap-mgr
client.bootstrap-osd
        key: AQBQVYFgZsuCNBAApHF5P+NqfH+iDhCVLLuZvA==
        caps: [mon] allow profile bootstrap-osd
client.bootstrap-rbd
        key: AQBSVYFgnyKEEhAAZq+zxwJ+lU7H2UYcmgvwWQ==
        caps: [mon] allow profile bootstrap-rbd
client.bootstrap-rgw
        key: AQBRVYFggjcvFxAAMRzWpAb6PcUEt/HWPe9oNQ==
        caps: [mon] allow profile bootstrap-rgw
client.kube
        key: AQDjZYFgOw/FFxAASWpRJz+H0yI3LU4x6Ct2zA==
        caps: [mon] allow r
        caps: [osd] allow rwx pool=osdsrbd
mgr.ubuntu
        key: AQBVVYFgAAAAABAAuP5uqduF5uTS8OOFJBpZHg==
        caps: [mds] allow *
        caps: [mon] allow profile mgr
        caps: [osd] allow *

```
Provide userid and userkey in secret manifest as shown below

```go
apiVersion: v1
kind: Secret
metadata:
  name: csi-rbd-secret
  namespace: default
stringData:
  userID: kube
  userKey: AQDjZYFgOw/FFxAASWpRJz+H0yI3LU4x6Ct2zA==

```

