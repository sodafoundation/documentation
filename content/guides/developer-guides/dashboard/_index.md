---
title: Dashboard UI
description: "SODA Dashboard Development Guide"
weight: 10
disableToc: false
tags: ["developer guide", "dashboard"]
---

OpenSDS dashboard uses the front-end development framework Angular5 (https://angular.io/) and relies on PrimeNG UI Components (https://www.primefaces.org/primeng/). 

## Prerequisite 

### 1. Ubuntu
* Version information
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
Switch to appropriate branch or release tag. (`master`, `development` or the release tag)

### 2. Build SODA dashboard.

{{% notice info %}}
**For local development** a local npm server can be started. This will allow to run a local server and make changes to the code and use the live reload feature to see code changes on the fly.    
{{% /notice %}}


#### Configure local proxy
Open the `proxy.conf.json ` file located in the document root and update the IP addresses with the appropriate endpoints where the SODA components are installed (usually machine IP or VM IP)
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
