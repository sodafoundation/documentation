---
title: Nexus APT Repository
description: "Nexus is a repository manager, it stores 'artifacts', but before jumping into abstractions, let's start with a description of software development. We'll begin with a simple description of what software development involves, and, for the purposes of this article, we're going to discuss Enterprise Java Development."
weight: 10000
---

## APT Repository

**Work Flow Diagram**

   ![image]

Please follow the below mentioned steps to get started with local APT
caching repository

-   Create blob store for apt Repository

    ![image][1]

-   Create a [apt-proxy]{.title-ref} Repository

    ![image][2]
    
    ![image][3]

-   Edit `sources.list` for adding repo url

    > ``` {.bash}
    > sudo nano /etc/sources.list
    > ```
    >
    > ![image][4]

-   Update and upgrade the system

    ``` {.bash}
    sudo apt update && sudo apt upgrade
    ```
    
    ![image][5]

  [image]: ../../images/nexus-sonatype/nexus_APT.png
  [1]: ../../images/nexus-sonatype/blob_store.png
  [2]: ../../images/nexus-sonatype/repo_new.png
  [3]: ../../images/nexus-sonatype/apt-proxy.png
  [4]: ../../images/nexus-sonatype/sources_list.png
  [5]: ../../images/nexus-sonatype/apt_update.png
