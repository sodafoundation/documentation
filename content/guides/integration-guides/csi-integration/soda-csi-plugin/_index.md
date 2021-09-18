---
title: SODA Integration with Kubernetes via SODA CSI Plugin
menuTitle: "SODA CSI plugin"
description: "A guide for integrating SODA with Kubernetes CSI."
weight: 10
disableToc: false
tags: ["integration guide", "kubernetes csi"] 
---
## Prerequisite

### Ubuntu
version information:
```bash
root@proxy:~# cat /etc/issue
Ubuntu 16.04.2 LTS \n \l
```

### Environment packages
```bash
apt-get update && apt-get install -y gcc make libc6-dev
```

### Install Go (v1.12.1)
```bash
wget https://storage.googleapis.com/golang/go1.12.1.linux-amd64.tar.gz
tar -C /usr/local -zxvf go1.12.1.linux-amd64.tar.gz   
echo 'export PATH=$PATH:/usr/local/go/bin' >> /etc/profile  
echo 'export GOPATH=$HOME/gopath' >> /etc/profile  
source /etc/profile
```

### Docker
version information:
```bash
root@ubuntu:~# docker version
Client:
 Version:           18.06.1-ce
 API version:       1.38
 Go version:        go1.10.3
 Git commit:        e68fc7a
 Built:             Tue Aug 21 17:24:56 2018
 OS/Arch:           linux/amd64
 Experimental:      false

Server:
 Engine:
  Version:          18.06.1-ce
  API version:      1.38 (minimum version 1.12)
  Go version:       go1.10.3
  Git commit:       e68fc7a
  Built:            Tue Aug 21 17:23:21 2018
  OS/Arch:          linux/amd64
  Experimental:     false
```

You can install docker using these commands below:
```bash
wget https://download.docker.com/linux/ubuntu/dists/xenial/pool/stable/amd64/docker-ce_18.06.1~ce~3-0~ubuntu_amd64.deb
dpkg -i docker-ce_18.06.1~ce~3-0~ubuntu_amd64.deb 
```

### [Kubernetes](https://github.com/kubernetes/kubernetes) local cluster
You can startup `v1.14.0` k8s local cluster by executing commands blow:
```bash
cd $HOME && git clone https://github.com/kubernetes/kubernetes.git
cd $HOME/kubernetes && git checkout v1.14.0
make
echo alias kubectl='$HOME/kubernetes/cluster/kubectl.sh' >> /etc/profile
hack/install-etcd.sh
ENABLE_DAEMON=true ALLOW_PRIVILEGED=true FEATURE_GATES=VolumeSnapshotDataSource=true RUNTIME_CONFIG="storage.k8s.io/v1alpha1=true" LOG_LEVEL=5 hack/local-up-cluster.sh -O
```

### [OpenSDS](https://github.com/sodafoundation/opensds) local cluster
For testing purposes you can deploy OpenSDS refering to [OpenSDS Cluster Installation through Ansible](https://github.com/sodafoundation/opensds/wiki/OpenSDS-Cluster-Installation-through-Ansible).

## Testing steps

* Change the workplace

	```
	cd /opt/opensds-sushi-linux-amd64
	```
* Opensds supports csi plugin for both block and file storage types

* For csi block plugin:

	* Update profile id of StorageClass in csi/examples/kubernetes/block/nginx.yaml according to actual profile you created, it looks like this:
		```
		apiVersion: storage.k8s.io/v1
		kind: StorageClass
		metadata:
		  name: csi-sc-opensdsplugin-block
		provisioner: csi-opensdsplugin-block
		parameters:
		  attachMode: rw
		  profile: d10ec339-3357-43ff-8626-4ccdb854af3d
		```
	* Create example nginx application

		```
		kubectl create -f csi/examples/kubernetes/block/nginx.yaml
		```

* For csi file plugin:

	* Update profile id of StorageClass in csi/examples/kubernetes/file/nginx.yaml according to actual profile you created, it looks like this:
		```
		apiVersion: storage.k8s.io/v1
		kind: StorageClass
		metadata:
		  name: csi-sc-opensdsplugin-file
		provisioner: csi-opensdsplugin-file
		parameters:
		  attachMode: rw
		  profile: d10ec339-3357-43ff-8626-4ccdb854af3d
		```
	* Create example nginx application

		```
		kubectl create -f csi/examples/kubernetes/file/nginx.yaml
		```
  This example will mount a opensds volume into `/var/lib/www/html`.  
  You can use the following command to inspect into nginx container to verify it.

	```
	kubectl exec -it nginx /bin/bash
	```

## Clean up steps
Clean up example nginx application and opensds CSI pods by the following commands:  

* For csi block plugin:

	```bash
	kubectl delete -f csi/examples/kubernetes/block/nginx.yaml
	kubectl delete -f csi/deploy/kubernetes/block
	```
* For csi file plugin:

	```bash
	kubectl delete -f csi/examples/kubernetes/file/nginx.yaml
	kubectl delete -f csi/deploy/kubernetes/file
	```
