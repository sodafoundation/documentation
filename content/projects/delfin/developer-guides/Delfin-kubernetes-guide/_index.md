---
title: Deployment on kubernetes cluster
description: "Deploying delfin services on kubernetes ."
tags: ["installation guide", "delfin","kubernetes"] 
---

## Introduction
The documentation is about how to deploy delfin on a single node kind kubernetes cluster where all the services of delfin are deployed as individual deployments inside a kubernetes cluster

## The steps to deploy delfin on a kubernetes cluster 

### Pre-requisites
- This  installation is tested on `Ubuntu 18.04`.
- `root` user is REQUIRED before the installation work starts.

This is test on a single node kind kubernetes cluster.<br />
Root user is required for the installation.

**_Note: The deployment  will be further tested on kubeadm kubernetes setup(in future)_**

### The required packages:
```bash
apt-get install -y libltdl7 libseccomp2 git curl wget make
```
---

#### Install docker

```bash
wget https://download.docker.com/linux/ubuntu/dists/xenial/pool/stable/amd64/docker-ce_18.03.1~ce-0~ubuntu_amd64.deb
dpkg -i docker-ce_18.03.1~ce-0~ubuntu_amd64.deb 
```
---

#### Install Kind

```bash
curl -Lo ./kind https://github.com/kubernetes-sigs/kind/releases/download/v0.11.1/kind-linux-amd64
chmod +x ./kind
mv ./kind /<some-dir-in-your-PATH>/kind
# here some-dir-in-PATH to be replaced by a directory in the PATH variable
```
##### Create a kubernetes cluster:
```bash
kind create cluster
# the default kubernetes kind cluster is created
```
##### Check the created cluster:
```bash
#Example
root@proxy:~# kind get clusters
kind
```
**Note:
For further kind installation information refer the below link:**

[Kind Installer reference](https://kind.sigs.k8s.io/docs/user/quick-start/#creating-a-cluster)

---

#### Install kubectl

 Download the latest release with the command:
```bash
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
```
{{% notice note %}}
**If you do not have root access on the target system, you can still install kubectl to the ~/.local/bin directory:**
{{% /notice %}}

```bash
chmod +x kubectl
mkdir -p ~/.local/bin/kubectl
mv ./kubectl ~/.local/bin/kubectl
# and then add ~/.local/bin/kubectl to $PATH
```
Test to ensure the version you installed is up-to-date:
```bash
kubectl version --client
```
{{% notice note %}}
**For detail kubectl installation information refer the below link:**<br />
[Kubectl Installation reference](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/)
{{% /notice %}}
{{% notice note %}}
The installation is tested on the kubectl version <br />
Client Version: v1.22.4 <br />
Server Version: v1.21.1 <br />
{{% /notice %}}

---

### Get all kubernetes object files required for delfin deployment:
```bash
git clone https://github.com/sodafoundation/examples.git
# examples/delfin-kubernetes/deploy directory contains all the object files of delfin k8s delpoyment
```
{{% notice note %}}
**The default version of delfin used is v1.5.0**
**To use a specific version of delfin replace the tags of delfin image in `delfin-api-deployment.yaml` ,`delfin-task-deployment.yaml`, `delfin-exporter-deployment.yaml` and `delfin-alert-deployment.yaml` files to desired tag(optional)** <br />

```bash
# replace tag with required tag in each of the above mentioned files
image: sodafoundation/delfin:<tag required>
```
{{% /notice %}}


#### Build image from source code manually(optional)
To build the delfin docker image, source code and  Dockerfile are needed. Dockerfile contains instructions on how the image is built.<br />
**Download the source code of delfin:**
```bash
git clone https://github.com/sodafoundation/delfin.git
```
**Build Delfin image and get into local environment:**
```bash
cd delfin
# this builds the whole delfin code into the image with name as sodafoundation/delfin with tag as mentioned and saves into local environment
# in the place of tag give the desired tag
docker build -t sodafoundation/delfin:<tag> .
cd ..
```

**Run the docker images command to verify that the build was successful:**
```bash
docker images
```
Output:
```bash
REPOSITORY                                                 TAG     IMAGE ID       CREATED          SIZE
sodafoundation/delfin                                      <tag>     25cfadb1bf28   10 seconds ago   652 MB
```
Now,load the image downloaded with the tag into the kind node
```bash
# replace tag with downloaded version
kind load docker-image sodafoundation/delfin:<tag>
```
---

### Commands to bring up the delfin services:
All the object files get added to the kubernetes cluster<br />

#### Create all configMaps
```bash
cd examples/delfin-kubernetes/deploy
kubectl apply -f configMap.yaml
```

#### Create all pods
Brings up the api,task,alert,exporter,redis and rabbitmq services of delfin

```bash
kubectl apply -f delfin-api-deployment.yaml
kubectl apply -f delfin-task-deployment.yaml
kubectl apply -f delfin-exporter-deployment.yaml
kubectl apply -f delfin-alert-deployment.yaml
kubectl apply -f redis-deployment.yaml
kubectl apply -f rabbitmq-deployment.yaml
```
#### Create the service objects
```bash
kubectl apply -f delfin-api-service.yaml
kubectl apply -f delfin-exporter-service.yaml
kubectl apply -f delfin-alert-service.yaml
kubectl apply -f redis-service.yaml
kubectl apply -f rabbitmq-service.yaml
```
#### Get all the deployed objects
```bash
kubectl get all
```
---

### To monitor the performance metrics on prometheus
Open the `configMap.yaml` file 
```bash
# Uncomment the line in configMap.yaml file
# For prometheus exporter only 
performance_exporters = PerformanceExporterPrometheus
```
Follow the below site:<br />
https://devopscube.com/setup-prometheus-monitoring-on-kubernetes/

---

### To send an API request to a service
Use node IP and node port of the service<br />
Example:
```bash
#Run the GET API to get the registered storages.
curl -X GET http://<IP of k8s node>:<nodePort of delfin-api-service SVC>/v1/storages
#Will give all the registered storages
```
---

{{% notice note %}}
**For accessing cluster from outside, endpoint should be set which can be connected from outside the cluster**<br />
Follow the below link:<br />
https://kind.sigs.k8s.io/docs/user/quick-start/#creating-a-cluster
{{% /notice %}}

### Deleting the delfin on k8s
Steps to delete all the delfin k8s objects and k8s cluster created.
#### Delete all the config Maps from files.
```bash
kubectl delete configmap delfin-config
```
#### Delete all pods 
Navigate to examples/delfin-kubernetes/deploy directory.
```bash
kubectl delete -f delfin-api-deployment.yaml
kubectl delete -f delfin-task-deployment.yaml
kubectl delete -f delfin-exporter-deployment.yaml
kubectl delete -f delfin-alert-deployment.yaml
kubectl delete -f redis-deployment.yaml
kubectl delete -f rabbitmq-deployment.yaml
```
#### Delete the services
```bash
kubectl delete -f delfin-api-service.yaml
kubectl delete -f delfin-exporter-service.yaml
kubectl delete -f delfin-alert-service.yaml
kubectl delete -f redis-service.yaml
kubectl delete -f rabbitmq-service.yaml
```
#### Get all the deployed objects
```bash
kubectl get all
# no delfin objects should be present
```
#### To delete k8s cluster
```bash
kind delete cluster
```
---

