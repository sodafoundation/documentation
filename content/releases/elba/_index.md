---
title: Elba (v0.20.1)
description: "This is the v0.20.1 release of SODA"
weight: 2
---


The SODA Elba release was completed on April 13, 2020.

## Release Summary  

This is the first release after the OpenSDS project transformed as The SODA Foundation. However currently we continue the release naming alphabetically based on island names:). So this is a ‘E’ release and named as “Elba” (island in Italy and symbolically representing our solidarity to the global fight against covid-19 virus)

This is a SODA Release comprising the corresponding projects or repositories of SODA Landscape.

All the SODA Releases will be made from [https://github.com/sodafoundation/releases](https://github.com/sodafoundation/releases) from now onwards. As per the current plan, we will be starting our quarterly releases starting from Elba release.

This release is mainly based on the [Daito](https://github.com/sodafoundation/api/releases/tag/v0.10.0) release from OpenSDS projects. There are some project/repository reorganizations, updates on certain projects along with some quality improvements. There are no big feature enhancements in this release.

This release version number 0.20.x has been selected to indicate the beginning of SODA releases (also disconnect from OpenSDS release sequence) . Each project will follow its own release version numbering, tags, names etc. SODA Release will mention the list and links of all the projects considered within the specific release.

We plan to have the major release of SODA in 2020. (v1.0.0)
[Email](mailto:info@sodafoundation.io) OR [Slack](https://www.sodafoundation.io/slack/) OR on Twitter [@sodafoundation](https://twitter.com/sodafoundation)

## Changelog

This changelog is based on OpenSDS release [Daito](https://github.com/sodafoundation/api/releases/tag/v0.10.0).

- ### Overall
  - All the projects under this release are SODA Core projects maintained under `github.com/sodafoundation`. They are all migrated from `github.com/opensds`
  - SODA Releases will be maintained by SODA Foundation Community directly and the releases are from `github.com/sodafoundation/releases`
  - SODA Releases will provide the key use cases, integrations and overall solution based on SODA Landscape projects. It will give all the respective project releases under the scope of each of the SODA releases.

- ### OpenSDS Project Reorganization

  - Earlier *github.com/opensds/opensds* project which was known as *hotpot*, was managing the on-prem data management connecting platforms on the north side and storage backends on the south side. This project has been decoupled into Three Different projects/repositories - *api*, *controller* and *dock*. Please see the readme of each project for more details. (`github.com/opensds/opensds` has been migrated to `github.com/sodafoundation/opensds` and this project has been decoupled to [https://github.com/sodafoundation/api](https://github.com/sodafoundation/api) , [https://github.com/sodafoundation/controller](https://github.com/sodafoundation/controller) and [https://github.com/sodafoundation/dock)](https://github.com/sodafoundation/dock))

  - **api** : Decoupled to handle the SODA API interface. This will contain the API server and api services going forward. Currently, all the APIs which were working earlier in Daito releases are decoupled and tested.

  - **controller**: Decoupled to handle all the control services (like metadata management, scheduler, other bookkeeping, utils etc)

  - **dock**: Decoupled to handle all the heterogeneous storage driver interfaces and related modules.

  - Currently the decoupled projects are verified for all the basic APIs (from api→ controller → dock) from Kubernetes, Dashboard and CLI

  - Telemetry feature is unchanged

- ### MultiCloud

  - YIG Integration has been further optimized

  - S3 compatibility for APIs

  - SSE support improved

  - Multiple Bug Fixes.

- ### nbp:

  - multiple fixes in CSI as well as VMWare plugin for feature stability and performance improvement.

  - Unit tests for Vmware NBP

- ### Installer

  - Updated to handle the project migration & project decoupling

  - Optimization and bug fixes

- ### Quality Improvements

  - Specific test cycles on various projects to improve the quality

  - api/controller/dock - Input validation of APIs; Improved Swagger API spec; Improved CLI help and more flags added for better usability; Multiple Initiator support from connector side ; Support secure connection between etcd and api/controller; Handle batch volume operations; Avoid redundant pool and dock while provisioning; No fstab modification required while mount/un-mount the FS

- ### CSI Plug & Play

  - To support the CSI Standard drivers, the initial design has been prepared. Please refer here. We will be implementing the same in the coming releases. If you want to join this work, please join the soda slack and ask in the ‘general’ channel.

- ### Documentations

  - Documentations are updated for the migration from OpenSDS to SODA Foundation and projects updates.

{{% notice info %}}
**Known Issue**  
_Multicloud s3 compatible API integration with dashboard has a signature mismatch issue. Hence, the dashboard in this release cannot support the latest multicloud with s3 compatible APIs. Hence, the latest multicloud cannot be experienced from the Dashboard._
{{% /notice %}}




1. Options to use the latest multicloud from elba:

  - There is no limitation on the usage of mulicloud using any other client through which s3 compatible apis can be accessed

  - We have provided a postman based demo setup information for a reference and experience the latest multicloud with s3 compatible APIs here

2. If you want to use elba release with previous version of multicloud without s3 compatible api support (to experience the features through dashboard)

  - Edit configuration file for multicloud (gelato.yml) from the [installer repo](https://github.com/sodafoundation/installer/blob/master/ansible/group_vars/gelato.yml)
  - Update `gelato_image_tag: “v0.10.0”`
  - Follow the build steps from docs.sodafoundation.io

- ## Use cases/Demo/Integrations in this release
  - Streaming Usecase Demo
  - Added streaming use case demo using the multicloud project 
  - To check out this demo and how to use etc, all the details here.

- ## Features in Dashboard
  - The Dashboard provides all the basic features supported by api, controller, dock end 2 end, features of multicloud(Daito), features of telemetry, features of orchestration etc.



- ## Projects/Repos part of this release:
    Key projects part of this SODA Release  

    **SODA Core Projects:**

    | Project | Release Link | Issues Link |
    | ------- | ------------ | ----------- |
    | [api](https://github.com/sodafoundation/api) | [api release v0.12.0](https://github.com/sodafoundation/api/releases/tag/v0.12.0) | [Raise Issue](https://github.com/sodafoundation/api/issues)|
    | [controller](https://github.com/sodafoundation/controller) | [controller release v0.12.0](https://github.com/sodafoundation/controller/releases/tag/v0.12.0) | [Raise Issue](https://github.com/sodafoundation/controller/issues) |
    | [dock](https://github.com/sodafoundation/dock) | [dock release v0.12.](https://github.com/sodafoundation/dock/releases/tag/v0.12.0) | [Raise Issue](https://github.com/sodafoundation/dock/issues) |
    | [nbp](https://github.com/sodafoundation/nbp)	| [nbp release v0.12.0](https://github.com/sodafoundation/nbp/releases/tag/v0.12.0) | [Raise Issue](https://github.com/sodafoundation/nbp/issues) |
    | [multi-cloud](https://github.com/sodafoundation/multi-cloud)	| [multicloud release v0.12.0](https://github.com/sodafoundation/multi-cloud/releases/tag/v0.12.0) | [Raise Issue](https://github.com/sodafoundation/multi-cloud/issues) |
    | [orchestration](https://github.com/sodafoundation/orchestration)	| [orchestration release v0.10.0](https://github.com/sodafoundation/orchestration/releases/tag/v0.10.0) | [Raise Issue](https://github.com/sodafoundation/orchestration/issues) |
    | [anomaly-detection](https://github.com/sodafoundation/anomaly-detection)	| [anomaly detection release v0.10.0](https://github.com/sodafoundation/anomaly-detection/releases/tag/v0.10.0) | [Raise Issue](https://github.com/sodafoundation/anomaly-detection/issues) |

- ## SODA Native Projects:
Projects are under review. Will be added from next release. If you want to submit your project to SODA Foundation to leverage better branding, networking, users, testing and enhance the community OR you want to know more about it, please mail to [project-submit@sodafoundation.io](mailto:project-submit@sodafoundation.io)

- ## Other Projects/Repos:

    | Project | Release Link | Issues Link |
    | ------- | ------------ | ----------- |
    | [installer](https://github.com/sodafoundation/installer)	| [installer release v0.12.0](https://github.com/sodafoundation/installer/releases/tag/v0.12.0)| [Raise Issue](https://github.com/sodafoundation/installer/issues) |
    | [dashboard](https://github.com/sodafoundation/dashboard)	| [dashboard release v0.10.0](https://github.com/sodafoundation/dashboard/releases/tag/v0.10.0)| [Raise Issue](https://github.com/sodafoundation/dashboard/issues) |
    | [documentation](https://github.com/sodafoundation/documentation)	| [documentation release v0.12.0](https://github.com/sodafoundation/documentation/releases/tag/v0.12.0)| [Raise Issue](https://github.com/sodafoundation/documentation/issues) |

## How to use the Release:  

### From Release Binaries of SODA Installer

#### Steps:


1. Download the installer binaries from [here](https://github.com/sodafoundation/installer/releases/tag/v0.12.0) (Use wget or direct download using browser)  

```
wget https://github.com/opensds/installer/releases/download/v0.12.0/installer-v0.12.0.tar.gz
```

2. Extract the downloaded file and change directory to opensds-installer/ansible  

```
tar xvzf installer-v0.12.0.tar.gz
cd opensds-installer/ansible
```  

3. Change the permission of the Ansible install script. 

```
chmod +x ./install_ansible.sh
```
4. Run the Ansible install script. This will install Ansible.  

```
./install_ansible.sh
# Ansible version 2.4.x is required.
ansible --version 
```  

5. Modify IP address, if needed, to the IP of the host machine.  Tip: Remember to set the  HOST_IP environment variable and use the same in this file.

```
vim group_vars/common.yml 
```  

6. Run the Ansible playbook to install SODA  

```
ansible-playbook site.yml -i local.hosts
```  

### Configuration & Installation
If you want more config control, you can follow these steps:

[Try SODA / Installation](/try-opensds/installation/) (Using Ansible - Recommended)

### Advanced Usages or Development
Please refer our detailed [documentation](https://docs.sodafoundation.io/)

[Installer Guides](https://docs.sodafoundation.io/guides/installer-guides/)  
[User Guides](https://docs.sodafoundation.io/guides/user-guides/)  
[Developer Guides](https://docs.sodafoundation.io/guides/developer-guides/)  

## Issues and Suggestions
Any SODA Release related issues/suggestions, please raise [here](https://github.com/sodafoundation/releases/issues)
For all other issues/suggestions, please raise to the respective project/repo linked above in the tables.

## OpenAPI Spec
* [Elba](/guides/api-spec/elba/)

