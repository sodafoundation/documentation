---
title: delfin
description: "delfin deployment on kubernetes guide."
tags: ["installation guide", "delfin"] 
---

## Introduction
The documentation is about how to deploy delfin on a single node kind kubernetes cluster
where all the services of delfin are deployed as individual deployments inside a kubernetes cluster

## Delfin deployment on kubernetes cluster
Here are the steps to deploy delfin on a kubernetes cluster 

### Pre-config (Ubuntu 18.04)
The installation is tested on Ubuntu 18.04.

Root user is required for the installation.

* packages

Install following packages:
```bash
apt-get install -y libltdl7 libseccomp2 git curl wget make
```

* docker

Install docker:
```bash
wget https://download.docker.com/linux/ubuntu/dists/xenial/pool/stable/amd64/docker-ce_18.03.1~ce-0~ubuntu_amd64.deb
dpkg -i docker-ce_18.03.1~ce-0~ubuntu_amd64.deb 
```

* Kind

Install kind:
```bash
curl -Lo ./kind https://github.com/kubernetes-sigs/kind/releases/download/v0.11.1/kind-linux-amd64
chmod +x ./kind
mv ./kind /some-dir-in-your-PATH/kind
```
Create a kubernetes cluster:
```bash
Kind create cluster
```
Check the created cluster:

Example:
```bash
root@proxy:~# kind get clusters
kind
```
[Kind Installer reference](https://kind.sigs.k8s.io/docs/user/quick-start/#creating-a-cluster)

* kubectl

 Install kubectl:
 
 Download the latest release with the command:
```bash
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
```
 Note:
 
If you do not have root access on the target system, you can still install kubectl to the ~/.local/bin directory:
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
[Kubectl Installation reference](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/)

The installation is tested on the kubectl version

Client Version: v1.22.4

Server Version: v1.21.1


### Build the delfin docker image locally
Download the source code of delfin:
```bash
git clone https://github.com/sodafoundation/delfin.git
```

Build Delfin Image with k8s tag locally: 
```bash
cd delfin
docker build -t sodafoundation/delfin:k8s .
```

### Get all kubernetes object files required for delfin deployment:
```bash
git clone https://github.com/sodafoundation/examples.git
```
### All the commands required to bring up the delfin services:
Run this from the delfin directory cloned above.

Create all the config Maps from files.
```bash
kubectl create configmap delfin-config --from-file=../delfin/etc/delfin/
```
Run this from the examples/delfin-kubernetes directory.

Create all pods
```bash
#Brings up the api,task,alert,exporter,redis and rabbitmq services of delfin
kubectl apply -f delfin-api-deployment.yaml
kubectl apply -f delfin-task-deployment.yaml
kubectl apply -f delfin-exporter-deployment.yaml
kubectl apply -f delfin-alert-deployment.yaml
kubectl apply -f redis-deployment.yaml
kubectl apply -f rabbitmq-deployment.yaml
```
Create the service objects
```bash
kubectl apply -f delfin-api-service.yaml
kubectl apply -f delfin-exporter-service.yaml
kubectl apply -f delfin-alert-service.yaml
kubectl apply -f redis-service.yaml
kubectl apply -f rabbitmq-service.yaml
```
Get all the deployed objects
```bash
Kubectl get all
```
### To monitor the performance metrics on prometheus
Follow the below site:

https://devopscube.com/setup-prometheus-monitoring-on-kubernetes/

### To send an API request to a service
Use node IP and node port of the service

Example:
```bash
#Run the GET API to get the registered storages.
curl -X GET http://<IP of k8s node>:<nodePort of delfin-api-service SVC>/v1/storages
#Will give all the registered storages
```
Note:
For accessing cluster from outside, endpoint should be set which can be connected from outside the cluster
### Deleting the delfin on k8s
Delete all the config Maps from files.
```bash
kubectl delete configmap delfin-config --from-file=../delfin/etc/delfin/
```
Delete all pods 
```bash
kubectl delete -f delfin-api-deployment.yaml
kubectl delete -f delfin-task-deployment.yaml
kubectl delete -f delfin-exporter-deployment.yaml
kubectl delete -f delfin-alert-deployment.yaml
kubectl delete -f redis-deployment.yaml
kubectl delete -f rabbitmq-deployment.yaml
```
Delete the services
```bash
kubectl delete -f delfin-api-service.yaml
kubectl delete -f delfin-exporter-service.yaml
kubectl delete -f delfin-alert-service.yaml
kubectl delete -f redis-service.yaml
kubectl delete -f rabbitmq-service.yaml
```
Get all the deployed objects
```bash
kubectl get all
#should be empty
```
To delete k8s cluster
```bash
kind delete cluster
```
