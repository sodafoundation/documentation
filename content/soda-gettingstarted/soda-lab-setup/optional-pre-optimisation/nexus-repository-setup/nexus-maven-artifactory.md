---
title: Nexus Maven Repository
description: "Nexus is a repository manager, it stores 'artifacts', but before jumping into abstractions, let's start with a description of software development. We'll begin with a simple description of what software development involves, and, for the purposes of this article, we're going to discuss Enterprise Java Development."
weight: 30000
---

## Maven Repository

**Work Flow**

![image]

Follow the below mentioned steps to get started and with maven
repository on Nexus Sonatype 3

-   Login to nexus Repository Dashboard

    ![image][1]

-   Create a blob store for maven Repositories

    ![image][2]

-   Create `maven group` for grouping the existing maven release,
    snapshot, central repositories.

    ![image][3]

-   Create setting.xml file in \~/.m2/settings.xml

    ``` {.xml}
    <?xml version="1.0" encoding="UTF-8"?>
    <settings xmlns="http://maven.apache.org/SETTINGS/1.1.0"
        xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
        xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.1.0 http://maven.apache.org/xsd/settings-1.1.0.xsd">
    
        <servers>
            <server>
                <id>nexus-snapshots</id>
                <username>admin</username>
                <password>admin123</password>
            </server>
            <server>
                <id>nexus-releases</id>
                <username>admin</username>
                <password>admin123</password>
            </server>
        </servers>
    
        <mirrors>
            <mirror>
            <id>central</id>
            <name>central</name>
            <url>http://your-host:8081/repository/maven-group/</url>
            <mirrorOf>*</mirrorOf>
            </mirror>
        </mirrors>
    </settings>
    ```

-   Edit pom.xml file and add the repository

    ``` {.xml}
    <repositories>
        <repository>
        <id>maven-group</id>
        <url>http://your-host:8081/repository/maven-group/</url>
        </repository>
    </repositories>
    ```

  [image]: ../../images/nexus-sonatype/nexus_maven.png
  [1]: ../../images/nexus-sonatype/nexus-dashboard.png
  [2]: ../../images/nexus-sonatype/mvn-blob.png
  [3]: ../../images/nexus-sonatype/mvn-group.png
  [4]: ../../images/nexus-sonatype/settings_maven.png
  [5]: ../../images/nexus-sonatype/pom-java.png
