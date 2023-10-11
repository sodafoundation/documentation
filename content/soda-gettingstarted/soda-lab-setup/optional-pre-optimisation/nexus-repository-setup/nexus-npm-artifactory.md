---
title: Nexus NPM Repository
description: "Nexus is a repository manager, it stores 'artifacts', but before jumping into abstractions, let's start with a description of software development. We'll begin with a simple description of what software development involves, and, for the purposes of this article, we're going to discuss Enterprise Java Development."
weight: 40000
---

## NPM Repository


**Workflow**

![image]

Follow the steps mentioned below to get started with a maven caching
repository

**Server Configuration**

-   Login to dashboard

    ![image][1]

-   Create blob store for npm-private and npm-proxy

    ![image][2]
    
    ![image][3]

-   Create npm private Repository

    ![image][4]

-   Create npm proxy Repository

    ![image][5]
    
    ![image][6]

-   Create a group of proxy and private Repository

    ![image][7]

**Configuring your clients and projects to use your Nexus repos**

-   Generate username and password hash

    ``` {.bash}
    echo -n 'admin:admin' | openssl base64
    ```
    
    ![image][8]

-   Create `.npmrc` file inthe root folder of the project directory
    and add

    ``` {.bash}
    registry=http://192.168.0.166:8081/repository/npm-group/_auth=YWRtaW46YWRtaW4=
    ```

-   Update packages

    ``` {.bash}
    npm install
    ```

  [image]: ../../images/nexus-sonatype/npm_nexus.png
  [1]: ../../images/nexus-sonatype/nexus-dashboard.png
  [2]: ../../images/nexus-sonatype/npm-private-blob.png
  [3]: ../../images/nexus-sonatype/npm-proxy-blob.png
  [4]: ../../images/nexus-sonatype/npm-private.webp
  [5]: ../../images/nexus-sonatype/npm-proxy.webp
  [6]: ../../images/nexus-sonatype/npm-proxy-2.webp
  [7]: ../../images/nexus-sonatype/npm-group.webp
  [8]: ../../images/nexus-sonatype/hash-gen.png
