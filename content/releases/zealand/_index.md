---
title: Zealand
description: "This is the v0.1.0 release of OpenSDS"
weight: 6
---

This was the first release of OpenSDS and was completed on 29th December 2017.

This is the Zealand release of Hotpot, the OpenSDS Controller project. It provides the ability to discover storage backends, provision volumes based on storage profiles, and manage volume and snapshot resources. Hotpot contains OpenSDS APIs and CLIs (osdsctl).

## Features
- New APIs
- Volume CRUD
- Volume attachment CRUD
- Snapshot CRUD
- List/get dock(s)
- List/get pool(s)
- Profiles CRUD
- Add/remove/list extra properties of profiles
- Southbound drivers LVM, Ceph, and Cinder (including Cinder stand-alone)
- Automatic deployment using ansible playbook

## Tests
- Unit test
- Integration test
- E2E test

## OpenAPI Spec
* [Zealand](/guides/api-spec/zealand/)

## Downloads  

The OpenSDS controller (Hotpot), the north bound plugins (Sushi), and the
installer can be downloaded from here:

[Hotpot](https://github.com/opensds/opensds/releases/tag/v0.1.0)  
[Sushi](https://github.com/opensds/nbp/releases/tag/v0.1.0)  
[Installer](https://github.com/opensds/opensds-installer/releases/tag/v0.2.0)  