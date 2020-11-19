---
title: Nexus GO Repository
description: "Nexus is a repository manager, it stores 'artifacts', but before jumping into abstractions, let's start with a description of software development. We'll begin with a simple description of what software development involves, and, for the purposes of this article, we're going to discuss Enterprise Java Development."
weight: 20000
---

## Go Repository


**Work FLow Diagram**

 ![image]

Follow the steps below to get started with a go proxy caching repository

-   Login to nexus repository dashboard

    > ![image][1]

-   Create blob store for go repositories

    > ![image][2]

-   Create go proxy repository

    > ![image][3]

-   Create a Go group repository and include proxy

    > ![image][4]

-   Create a enviroment variable to use go proxy repository

    ``` {.bash}
    export GOPROXY=http://192.168.0.166:8081/repository/go-group
    ```
  
  [image]: ../../images/nexus-sonatype/GO_nexus.png
  [1]: ../../images/nexus-sonatype/nexus-dashboard.png
  [2]: ../../images/nexus-sonatype/go_blob.png
  [3]: ../../images/nexus-sonatype/go-proxy.png
  [4]: ../../images/nexus-sonatype/go-group.png
  [5]: ../../images/nexus-sonatype/export_var_goproxy.png
