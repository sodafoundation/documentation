---
title: Dashboard UI
description: "SODA Dashboard Development Guide"
weight: 10
disableToc: false
tags: ["developer guide", "dashboard"]
---

SODA dashboard uses the front-end development framework Angular5 (https://angular.io/) and relies on PrimeNG UI Components (https://www.primefaces.org/primeng/). 


## Prerequisite 
### SODA Dashboard development requires a working SODA installation.
Please install SODA using the recommended installation guide [here](/soda-gettingstarted/installation-using-ansible/)

### 1. This developer guide is written for the Ubuntu OS (16.04/18.04)
Get the OS version
```shell
root@proxy:~# cat /etc/issue
Ubuntu 16.04.2 LTS \n \l
```
### 2. NodeJS installation, NPM will be installed with nodejs.
```shell
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs
```

### 3. Angular CLI installation
Specify the version[1.7.4] of angular5 suitable for installation.
```shell
sudo npm install -g @angular/cli@1.7.4
```
### 4. Nginx installation (Optional)
To be used for testing the build using `ng build`. For development a local npm server is enough (explained below)
```shell
sudo apt-get install -y nginx
```


## Build & Start
### 1. Clone the dashboard repository.
```shell
git clone https://github.com/sodafoundation/dashboard.git
```
For the latest code use the `master` branch. 

### 2. Build SODA dashboard.

{{% notice info %}}
**For local development** a local npm server can be started. This will allow to run a local server and make changes to the code and use the live reload feature to see code changes on the fly.    
{{% /notice %}}


#### Configure local proxy
Open the `proxy.conf.json ` file located in the document root and update the IP addresses with the appropriate endpoints where the SODA components are installed (use the HOST_IP that was used for SODA installation. Usually machine IP or VM IP)
```shell
cd dashboard
nano proxy.conf.json
```
The contents of the proxy.conf.json files are :
```
{
    "/v1beta": {
        "target": "http://139.159.150.240:50040",
        "secure": false
    },
    "/v1": {
        "target": "http://139.159.150.240:8089",
        "secure": false
    },
    "/v3": {
        "target": "http://139.159.150.240/identity",
        "secure": false
    }
}
```  

To enable debug mode and to check log messages replace the content with the following. The `/orch` block is needed to test Orchestration services if orchestration is enabled in the setup.  Similarly the `/resource-monitor` block is needed to test Delfin services.
```
{
    "/v1beta": {
        "target": "http://192.168.56.114:50040",

        "secure": false,
        "logLevel" : "debug"
    },
    "/orch" : {
        "target": "http://192.168.56.114:5000",
        "secure": false,
        "logLevel" : "debug",
        "changeOrigin" : true,
        "pathRewrite" : {
            "^/orch/" : "/v1beta/"
        }
    },
    "/v1": {
        "target": "http://192.168.56.114:8089",
        "secure": false,
        "logLevel" : "debug"
    },
    "/resource-monitor" : {
        "target": "http://192.168.56.114:8190",
        "secure": false,
        "logLevel" : "debug",
        "changeOrigin" : true,
        "pathRewrite" : {
            "^/resource-monitor/" : "/v1/"
        }
    },
    "/s3": {
        "target": "http://192.168.56.114:8090",
        "secure": false,
        "logLevel" : "debug",
        "changeOrigin" : true,
        "pathRewrite" : {
            "^/s3/" : "/"
         }
    },
    "/v3": {
        "target": "http://192.168.56.114/identity",
        "secure": false,
        "logLevel" : "debug"
    },
    "/alertmanager": {
        "target": "http://192.168.56.114:9093",
        "secure": false,
        "logLevel" : "debug",
        "changeOrigin" : true,
        "pathRewrite" : {
            "^/alertmanager/" : "/api/v1/"
        }
    }
}
```  
### Setup endpoint & port constants

{{% notice info %}}
**This step is mandatory for setting up a working development environment** 
{{% /notice %}}

During SODA installation certain constants are created and updated in the `src/app/shared/utils/consts.ts` and `src/assets/data/runtime.json` files.  
In the development environment these values will have to be setup manually.  

First edit the `src/app/shared/utils/consts.ts` file and go to line number 77.  

```
    SODA_HOST_IP: '',   # The HOST_IP where SODA is installed.
    SODA_GRAFANA_PORT: '', # The port specified for Grafana installation if SRM toolchain is installed. Usually 3000
    SODA_ALERTMANAGER_PORT: '', # The port specified for Alertmanager installation if SRM toolchain is installed. Usually 9093
    SODA_PROMETHEUS_PORT: '', # The port specified for Prometheus installation if SRM toolchain is installed. Usually 9090
    S3_HOST_IP: '', # The S3 HOST IP for multicoud. The HOST_IP where SODA is installed.
    S3_HOST_PORT: '', # The S3 port for accessing the S3 APIs. Usually 8090
    STORAGE_SERVICE_PLAN_ENABLED: false, # If storage service plans are enabled at the time of SODA installation change this to `true`. Else leave it as it is.
```

The updated values in  `consts.ts` will look like  

```
    SODA_HOST_IP: '192.168.56.114',
    SODA_GRAFANA_PORT: '3000',
    SODA_ALERTMANAGER_PORT: '9093',
    SODA_PROMETHEUS_PORT: '9090',
    S3_HOST_IP: '192.168.56.114',
    S3_HOST_PORT: '8090',
    STORAGE_SERVICE_PLAN_ENABLED: false,
```

The `src/assets/data/runtime.json` is generated by the installer at the time of SODA installation but in the development environment we have to enter the values manually. Edit the file and change the following values.  

```
{
    "hostIP": "${OPENSDS_S3_HOST}", # The S3 HOST IP for multicoud. The HOST_IP where SODA is installed.
    "hostPort": "${OPENSDS_S3_PORT}", # The S3 port for accessing the S3 APIs. Usually 8090
    "prometheusPort": "${SODA_PROMETHEUS_PORT}", # The port specified for Prometheus installation if SRM toolchain is installed. Usually 9090
    "alertmanagerPort": "${SODA_ALERTMANAGER_PORT}", # The port specified for Alertmanager installation if SRM toolchain is installed. Usually 9093
    "grafanaPort":"${SODA_GRAFANA_PORT}", # The port specified for Grafana installation if SRM toolchain is installed. Usually 3000
    "servicePlansEnabled" : false # If storage service plans are enabled at the time of SODA installation change this to `true`. Else leave it as it is.
}
```

The updated values will look like  

```
{
    "hostIP": "192.168.56.114",
    "hostPort": "8090",
    "prometheusPort": "9090",
    "alertmanagerPort": "9093",
    "grafanaPort":"3000",
    "servicePlansEnabled" : "True"
}
```

### Add `fake_driver` for Delfin development
Delfin supports a demo driver to test the installation. This driver is called the `fake_driver`.  
By defualt the `fake_driver` is not enabled. For local development we can setup the `fake_driver` as follows.  

Edit the `src/app/shared/utils/consts.ts` file and look for the `STORAGES` object (usually around line 182).  

Update the `vendors` array, `resources` and `models` objects with the following information.  

Add this to the `STORAGES.vendors` array

```
{
    label: "Demo Storage",
    value: 'fake_storage'
}
```

Add this to the `STORAGES.models` object  

```
'fake_storage' : [
    {
        label: "Demo Driver",
        value: {
            name: 'fake_driver',
            rest: true,
            ssh: false,
            cli: false,
            smis: false,
            extra: false
        }
    }
]
```

For every entry in the `STORAGES.resources` object add the `fake_driver`  

```
resources:{
    volumes : ['vmax', 'unity', 'vnx_block', 'vplex', 'oceanstor', '3par', 'vsp', 'storwize_svc', 'cmode', 'fake_driver'],
    pools : ['vmax', 'unity', 'vnx_block', 'vplex', 'oceanstor', '3par', 'vsp', 'storwize_svc', 'cmode', 'fake_driver'],
    controllers : ['oceanstor', 'unity', 'vnx_block', 'vplex', '3par', 'vsp', 'storwize_svc', 'cmode', 'fake_driver'],
    ports : ['oceanstor', 'unity', 'vnx_block', 'vplex', '3par', 'vsp', 'storwize_svc', 'cmode', 'fake_driver'],
    disks : ['oceanstor', 'unity', 'vnx_block', '3par', 'vsp', 'storwize_svc', 'cmode', 'fake_driver'],
    qtrees : ['oceanstor', 'unity', 'cmode', 'fake_driver'],
    filesystems : ['oceanstor', 'unity', 'cmode', 'fake_driver'],
    shares: ['oceanstor', 'unity', 'cmode', 'fake_driver'],
    quotas: ['oceanstor', 'unity', 'cmode', 'fake_driver']
},
```

It should look like this  
(Copy these lines and paste directly in place if needed)  

```
STORAGES: {
        vendors: [
            {
                label: "Dell EMC",
                value: 'dellemc'
            },
            {
                label: "Huawei",
                value: 'huawei'
            },
            {
                label: "HPE",
                value: 'hpe'
            },
            {
                label: "Hitachi",
                value: 'hitachi'
            },
            {
                label: "IBM",
                value: 'ibm'
            },
            {
                label: "NetApp",
                value: 'netapp'
            },
            {
                label: "Demo Storage",
                value: 'fake_storage'
            }
        ],
        resources:{
            volumes : ['vmax', 'unity', 'vnx_block', 'vplex', 'oceanstor', '3par', 'vsp', 'storwize_svc', 'cmode', 'fake_driver'],
            pools : ['vmax', 'unity', 'vnx_block', 'vplex', 'oceanstor', '3par', 'vsp', 'storwize_svc', 'cmode', 'fake_driver'],
            controllers : ['oceanstor', 'unity', 'vnx_block', 'vplex', '3par', 'vsp', 'storwize_svc', 'cmode', 'fake_driver'],
            ports : ['oceanstor', 'unity', 'vnx_block', 'vplex', '3par', 'vsp', 'storwize_svc', 'cmode', 'fake_driver'],
            disks : ['oceanstor', 'unity', 'vnx_block', '3par', 'vsp', 'storwize_svc', 'cmode', 'fake_driver'],
            qtrees : ['oceanstor', 'unity', 'cmode', 'fake_driver'],
            filesystems : ['oceanstor', 'unity', 'cmode', 'fake_driver'],
            shares: ['oceanstor', 'unity', 'cmode', 'fake_driver'],
            quotas: ['oceanstor', 'unity', 'cmode', 'fake_driver']
        },
        models: {
            'dellemc' : [
                {
                    label: "VMAX",
                    value: {
                        name: 'vmax',
                        rest: true,
                        ssh: false,
                        cli: false,
                        smis: false,
                        extra: true
                    }
                },
                {
                    label: "Unity",
                    value: {
                        name: 'unity',
                        rest: true,
                        ssh: false,
                        cli: false,
                        smis: false,
                        extra: false
                    }
                },
                {
                    label: "VNX",
                    value: {
                        name: 'vnx_block',
                        rest: false,
                        ssh: false,
                        cli: true,
                        smis: false,
                        extra: false
                    }
                },
                {
                    label: "VPLEX",
                    value: {
                        name: 'vplex',
                        rest: true,
                        ssh: false,
                        cli: false,
                        smis: false,
                        extra: false
                    }
                }
            ],
            'huawei' : [
                {
                    label: "OceanStor V3",
                    value: {
                        name: 'oceanstor',
                        rest: true,
                        ssh: false,
                        cli: false,
                        smis: false,
                        extra: false
                    }
                }
            ],
            'hpe' : [
                {
                    label: "3PAR",
                    value: {
                        name: '3par',
                        rest: true,
                        ssh: true,
                        cli: false,
                        smis: false,
                        extra: false
                    }
                }
            ],
            'hitachi' : [
                {
                    label: "VSP",
                    value: {
                        name: 'vsp',
                        rest: true,
                        ssh: false,
                        cli: false,
                        smis: false,
                        extra: false
                    }
                }
            ],
            'ibm' : [
                {
                    label: "Storwize / SVC",
                    value: {
                        name: 'storwize_svc',
                        rest: false,
                        ssh: true,
                        cli: false,
                        smis: false,
                        extra: false
                    }
                }
            ],
            'netapp' : [
                {
                    label: "Cluster Mode",
                    value: {
                        name: 'cmode',
                        rest: false,
                        ssh: true,
                        cli: false,
                        smis: false,
                        extra: false
                    }
                }
            ],
            'fake_storage' : [
                {
                    label: "Demo Driver",
                    value: {
                        name: 'fake_driver',
                        rest: true,
                        ssh: false,
                        cli: false,
                        smis: false,
                        extra: false
                    }
                }
            ]
        },
```

#### Start the live development server
```shell
npm install
npm start
```
This will start a NG Live development server and can be accessed at http://localhost:4200/  

Make changes in the code and the server will live reload. If this fails then run the below commands.  
```shell
sudo sysctl fs.inotify.max_user_watches=524288
systemd-sysusers # (1)
```  

### 2.2 Alternatively the dashboard code can be built and deployed.

Use the commands below to build the dashboard code.  
```shell
cd dashboard
sudo npm install
sudo ng build --prod
```
After the build is successful, the files in the `dist` folder should be copied to the folder ` /var/www/html/`.

```shell
cp -R dashboard/dist/* /var/www/html/
```

## 3. Set nginx default config. (optional)
```shell
vi /etc/nginx/sites-available/default 
```
Configure proxy, points to the resource server, multi-cloud server and the authentication server respectively. (replace 1.1.1.0 with the appropriate endpoints)
Parameter 'client_max_body_size' configuration supports uploaded file size.
Such as: 
* Keystone server `http://1.1.1.0/identity`
* Resource server `http://1.1.1.0:50040`
* Multi-cloud server `http://1.1.1.0:8089`
```shell
location /v3/ {
    proxy_pass http://1.1.1.0/identity/v3/;
}

location /v1beta/ {
    proxy_pass http://1.1.1.0:50040/v1beta/;
}

location /v1/ {
    proxy_pass http://1.1.1.0:8089/v1/;
    client_max_body_size 10240m;
}
```

## 4. Restart nginx (optional)
```shell
service nginx restart 
```

## 5. Access dashboard in browser. (optional)
```shell
http://localhost/
```


## PrimeNG Components

SODA Dashboard makes use of [PrimeNG v5.2.7 ](https://github.com/primefaces/primeng/tree/5.2.7) components.  
All the components that are used in the UI are included in the `src\app\components` folder.  
The detailed documentation with API interface and usage examples for the components can be found [here](https://www.primefaces.org/primeng/v5.2.7/#/)
