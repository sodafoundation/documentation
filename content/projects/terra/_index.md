---
title: Terra
description: "This page provides the details of SODA DashBoard"
weight: 3
disableToc: false
---

- ### SODA API

     The SODA API, Provides the standardization for Data / Storage Management APIs. At present, block and file APIs for key features of data management (provisioning, migration, fileshare, etc) are supported.

    This is the key external interface to platforms which can do a seamless integration with heterogeneous storage backends.

    Users can develop SODA North-Bound Plugins (SODA NBP) under SODA NBP project to connect any platform or application solutions to SODA API from north for all storage/data requirements.

    This is envisioned to be the reference implementation of SODA Data Standard API Specification, with contributions from industry partners and standards bodies. At that stage, this layer will upgraded to support Block, File and Object APIs across the Edge, Core and Cloud.

    [Source Code Repository](https://github.com/sodafoundation/api)

- ### SODA Controller

    The SODA Controller, provides metadata management, control/configurations, scheduler and all such book-keeping features and utilities. In the API flow from SODA API to SODA Dock, controller plays a critical role for all the API flow management and tracking to handle all the state machine and metadata management requirements. This is a layer to keep addons to new facilities or utilities for the SODA platform.

    At present, this layer can be optional or similar modules can be used from users(if they have such software components). However, users need to integrate the Controller modules with SODA API and SODA Dock.

    The Controller interfaces with SODA API and SODA Dock.

    [Source Code Repository](https://github.com/sodafoundation/controller)

- ### SODA Dock

    SODA Dock is a docking station for heterogeneous storage backends! This is where all the different storage vendors drivers for various storage backend models get attached.

    The goal is to make most of the protocols and backends supported as close as ‘plug n play’. Currently, each storage backend needs a thin, easy to develop SODA Driver Plugin to connect the storage backend to the Dock. SODA Driver Plugin and Storage vendor driver together it can be called SODA Driver for xxx vendor yy model storage.SODA Driver can support one or more or multiple classes of storage backends.

    To connect more and more cloud-native storages seamlessly with the SODA Platform,there is an experimental feature for CSI PlugNPlay is developed. This will immediately enable any CSI driver to work with SODA using a single SODA CSI plugin for the application platform (like Kubernetes), in turn, support all the storage vendors supporting CSI.

    SODA Dock can interface directly to SODA API or via Controller. However, it is recommended through the controller for a complete end to end solution, as it can provide the metadata management, handling multiple docks, etc.

    The roadmap is to have multiple instances, multi-driver docks to support multi-cluster, multi-platform, or multi-cloud scenarios in the future.

    [Source Code Repository](https://github.com/sodafoundation/dock)
