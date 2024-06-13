---
title: Nexus Artifactory Setup
description: "Setup development SODA Lab"
weight: 24
disableToc: false
---


## Introduction

Nexus is a repository manager, it stores 'artifacts', but before jumping into abstractions, let's start with a description of software development. We'll begin with a simple description of what software development involves, and, for the purposes of this article, we're going to discuss Enterprise Java Development.

### Architecture

![image][0]

### Features

-   Store and distribute Maven/Java, npm, NuGet, Helm, Docker, P2, OBR, APT, GO, R, Conan components and more
-   Manage components from dev through delivery: binaries, containers, assemblies, and finished goods.
-   Advanced support for the Java Virtual Machine (JVM) ecosystem, including Gradle, Ant, Maven, and Ivy.
-   Compatible with popular tools like Eclipse, IntelliJ, Hudson, Jenkins, Puppet, Chef, Docker, and more

## Getting Started

Follow the below steps to start with sonatype nexus for caching various repositories at single place.

### Sonatype Nexus Artifactory Initial Setup

- Create a nexus/sonatype container.

    ``` bash
    docker run -d --name my-nexus -p 8081:8081 -p 10000-10010:10000-10010 -v $PWD:/nexus-data sonatype/nexus3
    ```

- Read the content of `admin.password` file for admin user default password

     ``` bash
      cat ./admin.password
     ```

- Login to url `http://localhost:8081`

     ![image][2]

- Create new password

     ![image][3]
     
     ![image][4]

### Configure repositories 

- [APT Repository](../nexus-repository-setup/nexus-apt-artifactory)
- [Go Repository](../nexus-repository-setup/nexus-go-artifactory)
- [Maven Repository](../nexus-repository-setup/nexus-maven-artifactory)
- [NPM Repository](../nexus-repository-setup/nexus-npm-artifactory)



  [image]: ../images/nexus-sonatype/docker_run.png
  [1]: ../images/nexus-sonatype/cat_default_pass.png
  [2]: ../images/nexus-sonatype/login_nexus.png
  [3]: ../images/nexus-sonatype/pass_reset.png
  [4]: ../images/nexus-sonatype/anon.png
  [0]: ../images/nexus-sonatype/sonaTypeArchitecture.png
