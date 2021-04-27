
## Ceph CSI Introduction
Ceph CSI in SODA facilitates the user to create persistent storage for statefulset application inside hotpot project.

### Install sushi project with SODA
Follow the link to install SODA https://github.com/sodafoundation/api/wiki/OpenSDS-Integration-with-Kubernetes-CSI

After successfully installing kubernetes and hotpot project follow the below given steps. 

###### Step1
Create a block image/volume inside ceph cluster:

```yaml
rbd create --size {megabytes} {pool-name}/{image-name} --order {value}

```
example
```
rbd create osdsrbd/vol1 --size 100 --order 12
```
###### Step2
Mount a block image:

```yaml
rbd map <pool-name>/<image-name> --id <client-name>
```
example
```
rbd map osdsrbd/vol1 --id admin
```

###### Step3
Adjust the tunables on the ceph cluster:

```yaml
ceph osd crush tunables hammer

grep -q "^rbd default features" /etc/ceph/ceph.conf || sed -i '/\[global\]/arbd default features = 1' /etc/ceph/ceph.conf
```

