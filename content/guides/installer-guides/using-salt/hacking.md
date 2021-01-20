---
title: Hacking
description: "Deploy SODA using Salt. This is an experimental solution using repeatable patterns of jinja/yaml to deploy cloud-native stack using infrastructure as code."
weight: 40
---

### Site specific deployment values


The default site configuration is detailed in the `/root/opensds-installer/salt/srv/pillar/site.j2` file. This is the primary interface for customizing the deployment experience for OpenSDS installer on Salt. Typically you may want to modify ip addresses, or more rarely set a specific release (urls, hashsums, revisions). This `site.j2` file is consumed by [saltstack-formulas/opensds-formula](https://github.com/saltstack-formulas/opensds-formula) during deployments. Please take care not to corrupt the file with bad syntax if you need to make updates.

The secondary interface for customizations is the `/root/opensds-installer/salt/srv/pillar/opensds.sls` yaml file. Again caution should be exercised if you make any updates.

All other files should be left alone.

### Flexible Deployments


You can install OpenSDS in a more modular fashion. Salt has powerful features for distributed deployment management so the shipped solution could be extended for flexible deployment (salt integration knowledge is useful).

The following commands are provided (or -r for removal).
```
 vi ./srv/pillar/opensds.sls       ### Tweak something (advanced)

 vi site.js                        ### Set IP addresses (easy)

 sudo salter.sh -i infra             ### This installs packages, docker, nginx, etc.

 sudo salter.sh -i keystone          ### Runs devstack-formula

 sudo salter.sh -i config            ### Creates directories and /etc/opensds/opensds.conf file

 sudo salter.sh -i database          ### Installs ETCD

 sudo salter.sh -i hotpot            ### Installs the HotPot

 sudo salter.sh -i sushi             ### Configures drivers in opensds.conf and /etc/opensds/driver directory

 sudo salter.sh -i backend           ### Installs Backends (lvm, iscsi, cinder, etc)

 sudo salter.sh -i dock              ### Installs Dock(s)

 sudo salter.sh -i dashboard         ### Installs the Dashboard

 sudo salter.sh -i gelato            ### Installs Multi-Cloud

 sudo salter.sh -i freespace         ### Free some disk space
```

### Vagrant Reference for Testing

Download and install [VirtualBox](https://www.virtualbox.org/wiki/Downloads) and [Vagrant](https://www.vagrantup.com/downloads.html). Next choose a vagrant Linux image with 20G+ virtual disk size (avoid small virtual-disk-size images).
```
 mkdir ~/vagrant && cd ~/vagrant


 vagrant init generic/ubuntu1804             #UBUNTU - 30G localdisk

 vagrant init centos/7                       #CENTOS - 50G localdisk

 vagrant init bento/opensuse-leap-15         #OPENSUSE - 40G localdisk

 vagrant init opensuse/openSUSE-15.0-x86_64  #OPENSUSE - 64G localdisk
```

Configure a public network and sufficient compute resources.
```
 vi Vagrantfile

   config.vm.provider "virtualbox" do |vb|
     vb.memory = "12127"
     vb.cpus = 6
   end
   config.vm.network "public_network"
```
Start the virtual environment.
```
 vagrant up            # select 'bridge' or 'internet' interface
 vagrant ssh
```

### Upstream support

The upstream [saltstack-formulas/opensds-formula](https://github.com/saltstack-formulas/opensds-formula) is specifically designed for extensibility.

To request upstream enhancements or bug fixes please raise a github issue for consideration.

Code contributions are welcome!


### Example Installer output

```
~/opensds-installer/salt # vi site.j2

~/opensds-installer/salt # sudo salter.sh -i salter; sudo salter.sh -i opensds

Loading repository data...
Reading installed packages...
Resolving package dependencies...
--2019-02-21 12:52:19--  https://bootstrap.saltstack.com/
Resolving bootstrap.saltstack.com (bootstrap.saltstack.com)... 138.197.226.47, 2604:a880:400:d0::2:e001
Connecting to bootstrap.saltstack.com (bootstrap.saltstack.com)|138.197.226.47|:443... connected.
.... etc ....

run salt ...
local:
    ----------
    base:
        - salt.minion
        - salt.master
        - salt.formulas
        - salt.ssh
 ... this takes a while ... please be patient ...

Summary for local
-------------
Succeeded: 31 (changed=22)
Failed:     0
-------------
Total states run:     31
Total run time:   62.087 s
See full log in [ /tmp/opensds-installer-salt/install-salt/log.201902211252 ]

Accepted Keys:
opensuse-leap-x64
Denied Keys:
Unaccepted Keys:
Rejected Keys:
using [nginx] fixes branch
using [docker] fixes branch
run salt ...
local:
    ----------
    base:
        - opensds.infra
 ... this takes a while ... please be patient ...

Summary for local
-------------
Succeeded: 83 (changed=20)
Failed:     0
-------------
Total states run:     83
Total run time:   55.062 s
See full log in [ /tmp/opensds-installer-salt/install-infra/log.201902211254 ]

run salt ...
local:
    ----------
    base:
        - opensds.keystone
 ... this takes a while ... please be patient ...

Summary for local
-------------
Succeeded: 24 (changed=10)
Failed:     0
-------------
Total states run:     24
Total run time:  582.516 s
See full log in [ /tmp/opensds-installer-salt/install-keystone/log.201902211255 ]

Services are running under systemd unit files.
For more information see: 
https://docs.openstack.org/devstack/latest/systemd.html

DevStack Version: stein
Change: f22c497c237c5f71437e5c9c0ed0811d005f0f4d Remove fedora-latest nodeset from Rocky 2019-02-04 16:46:20 +1100
OS Version: openSUSE 15.0 n/a

See full log in [ /tmp/devstack/stack.sh.log ]

run salt ...
local:
    ----------
    base:
        - opensds.config
 ... this takes a while ... please be patient ...

Summary for local
-------------
Succeeded: 15 (changed=10)
Failed:     0
-------------
Total states run:     15
Total run time:  390.923 ms
See full log in [ /tmp/opensds-installer-salt/install-config/log.201902211305 ]

run salt ...
local:
    ----------
    base:
        - opensds.database
 ... this takes a while ... please be patient ...

Summary for local
-------------
Succeeded: 33 (changed=15)
Failed:     0
-------------
Total states run:     33
Total run time:   60.786 s
See full log in [ /tmp/opensds-installer-salt/install-database/log.201902211305 ]

run salt ...
local:
    ----------
    base:
        - opensds.auth
 ... this takes a while ... please be patient ...

Summary for local
-------------
Succeeded: 41 (changed=18)
Failed:     0
-------------
Total states run:     41
Total run time:   24.252 s
See full log in [ /tmp/opensds-installer-salt/install-auth/log.201902211307 ]

run salt ...
local:
    ----------
    base:
        - opensds.hotpot
 ... this takes a while ... please be patient ...

Summary for local
-------------
Succeeded: 30 (changed=14)
Failed:     0
-------------
Total states run:     30
Total run time:  324.824 s
See full log in [ /tmp/opensds-installer-salt/install-hotpot/log.201902211307 ]

run salt ...
local:
    ----------
    base:
        - opensds.sushi
 ... this takes a while ... please be patient ...

Summary for local
-------------
Succeeded: 60 (changed=37)
Failed:     0
-------------
Total states run:     60
Total run time:  561.968 s
See full log in [ /tmp/opensds-installer-salt/install-sushi/log.201902211313 ]

run salt ...
local:
    ----------
    base:
        - opensds.backend
 ... this takes a while ... please be patient ...

Summary for local
-------------
Succeeded: 83 (changed=54)
Failed:     1
-------------
Total states run:     84
Total run time: 1154.499 s
See full log in [ /tmp/opensds-installer-salt/install-backend/log.201902211323 ]

run salt ...
local:
    ----------
    base:
        - opensds.dock
 ... this takes a while ... please be patient ...

Summary for local
-------------
Succeeded: 30 (changed=14)
Failed:     0
-------------
Total states run:     30
Total run time:    1.073 s
See full log in [ /tmp/opensds-installer-salt/install-dock/log.201902211343 ]

run salt ...
local:
    ----------
    base:
        - opensds.dashboard
 ... this takes a while ... please be patient ...

Summary for local
-------------
Succeeded: 21 (changed=5)
Failed:     0
-------------
Total states run:     21
Total run time:   47.614 s
See full log in [ /tmp/opensds-installer-salt/install-dashboard/log.201902211343 ]

run salt ...
local:
    ----------
    base:
        - opensds.gelato
 ... this takes a while ... please be patient ...

Summary for local
-------------
Succeeded: 42 (changed=20)
Failed:     0
-------------
Total states run:     42
Total run time:  284.863 s
See full log in [ /tmp/opensds-installer-salt/install-gelato/log.201902211344 ]

local:
    ----------
    opensds:
        - default
Copy opensds-installer/conf/policy.json to /etc/opensds/
```




#### REMOVAL 
```
salter.sh -r opensds
...

Summary for local
--------------
Succeeded: 144 (changed=70)
Failed:      2
--------------
```