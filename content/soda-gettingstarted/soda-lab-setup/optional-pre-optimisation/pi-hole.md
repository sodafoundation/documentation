---
title: Pi-Hole Setup
description: "Setup Pi-Hole for DNS Sinkhole"
weight: 22
---

## Pi-Hole

The [Pi-hole®][] is a [DNS sinkhole][] that protects your network from
unwanted content, without installing any client-side software.

![Pi-Hole Architecture][architecture]


### Features

> -   **Easy-to-install**: our versatile installer walks you through the
>     process and takes less than ten minutes
> -   **Resolute**: content is blocked in non-browser locations, such as
>     ad-laden mobile apps and smart TVs
> -   **Responsive**: seamlessly speeds up the feel of everyday browsing
>     by caching DNS queries
> -   **Lightweight**: runs smoothly with minimal hardware and software
>     requirements
> -   **Robust**: a command-line interface that is quality assured for
>     interoperability
> -   **Insightful**: a beautiful responsive Web Interface dashboard to
>     view and control your Pi-hole
> -   **Versatile**: can optionally function as a DHCP server, ensuring
>     all your devices are protected automatically
> -   **Scalable**: capable of handling hundreds of millions of queries
>     when installed on server-grade hardware
> -   **Modern**: blocks ads over both IPv4 and IPv6
> -   **Free**: open-source software which helps ensure you are the sole
>     person in control of your privacy

### Lab Environment Usages

> - Internal DNS server
> - Internal DNS sinkhole
> - DHCP server
> - Unwanted ads/domains blocking


## Installation

Here is a step by step guide on how to install Pi-Hole. It will get you
to a point of having a local running instance

### Requirements


- Hardware Requirements
  - Raspberry pi / Tinker board

- Download the ISO from this [website][]
- SD Card `(16GB minimun)`


### Quick start


-   Make a bootable sd card for Raspberry pi / Tinker board

    **_NOTE:_**  Recommending to use `Balena Etcher` for flashing [link][]

- Boot up the system. 
- Open terminal & execute below command to get started

  ``` bash
  $ sudo su -
  $ curl -sSL https://install.pi-hole.net | bash
  ```

##### Use wizard to install Pi-Hole:-

-   Pi-Hole automated installer & follow the steps

  ![img-60][0]
    
  ![img-60][1]

-   Pi-Hole server need a static IP address

  ![img-60][2]
    
  ![img-60][3]

-   Select the preferred Upstream DNS Provider

  ![img-60][4]

-   To allow 3rd party lists to block ads

  ![img-60][5]

-   Select ip Address type as IPv4 and ipV6

  ![img-60][6]

-   Selecting `NO` as we need to set static IP address.

  ![img-60][7]
     
  ![img-60][8]

-   Enter your desired Ipv4 Default gatway

  ![img-60][9]

-   Add Web Admin interface

  ![img-60][10]

-   Install WebServer as this is a fresh install

  ![img-60][11]

-   Log queries for more infomative usage in network

  ![img-60][12]

-   Select 0 as, we will be loging every activity of the user

  ![img-60][13]

-   Copy the password displayed in the terminal . It is required to access webpage login.

  ![img-60][14]

[website]: https://dlcdnets.asus.com/pub/ASUS/mb/Embedded_IPC/TinkerBoard_S/Tinker_Board-Debian-Stretch-V2.1.11-20200310.zip
[link]: https://www.balena.io/etcher/
[architecture]: ../images/pihole/piholeArchitecture.png
[0]: ../images/pihole/pihole1.png
[1]: ../images/pihole/pihole2.png
[2]: ../images/pihole/pihole3.png
[3]: ../images/pihole/pihole4.png
[4]: ../images/pihole/pihole5.png
[5]: ../images/pihole/pihole6.png
[6]: ../images/pihole/pihole7.png
[7]: ../images/pihole/pihole8.png
[8]: ../images/pihole/pihole10.png
[9]: ../images/pihole/pihole9.png
[10]: ../images/pihole/pihole11.png
[11]: ../images/pihole/pihole12.png
[12]: ../images/pihole/pihole13.png
[13]: ../images/pihole/pihole14.png
[14]: ../images/pihole/pihole16.png
[Pi-hole®]: https://pi-hole.net/
[DNS sinkhole]: https://en.wikipedia.org/wiki/DNS_Sinkhole
