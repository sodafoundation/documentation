---
title: Join and Contribute
description: "How to join SODA and contribute"
weight: 1
---

[![Go Report Card](https://goreportcard.com/badge/github.com/sodafoundation/api?branch=master)](https://goreportcard.com/report/github.com/sodafoundation/api)
[![Build Status](https://travis-ci.org/sodafoundation/opensds.svg?branch=master)](https://travis-ci.org/sodafoundation/api)
[![Coverage Status](https://coveralls.io/repos/github/sodafoundation/api/badge.svg?branch=master)](https://coveralls.io/github/sodafoundation/api?branch=master)

<img src="https://www.opensds.io/wp-content/uploads/sites/18/2016/11/logo_opensds.png" width="100">


## How to contribute

SODA is Apache 2.0 licensed and accepts contributions via GitHub pull requests. This document outlines some of the conventions on commit message formatting, contact points for developers and other resources to make getting your contribution into SODA Foundation easier.

## Talk to us

You can reach out to the SODA Foundation team anytime on the following channels. Someone will get back to you and you can always raise issues on GitHub that will be accissible at all times.

- Email: [sodafoundation-dev](https://groups.google.com/forum/?hl=en#!forum/opensds-dev)
- Slack: [Join SODAFoundation Slack](https://sodafoundation.io/slack) 
- Twitter: [@sodafoundation](https://twitter.com/sodafoundation)

Before you start, NOTICE that ```master``` branch is the relatively stable version
provided for customers and users. So all code modifications SHOULD be submitted to
```development``` branch.

## Getting started

- Fork the repository on GitHub.
- Read the README.md and INSTALL.md for project information and build instructions.

For those who just get in touch with this project recently, here is a proposed contributing [tutorial](https://github.com/leonwanghui/installation-note/blob/master/opensds_fork_contribute_tutorial.md).

## Repositories

The following is the list of the main repositories that comprise SODA Foundation project.  

- [Api - SODA API Project](https://github.com/sodafoundation/api)
- [Controller- SODA Controller Project](https://github.com/sodafoundation/controller)
- [Dock - SODA South Bound  Project](https://github.com/sodafoundation/dock)
- [Gelato - SODA Multi-Cloud Data Control](https://github.com/sodafoundation/multi-cloud)
- [Sushi - SODA Northbound Plugin Project](https://github.com/sodafoundation/nbp)
- [Orchestration](https://github.com/sodafoundation/orchestration)
- [Installer](https://github.com/sodafoundation/installer)
- [Dashboard](https://github.com/sodafoundation/dashboard)

## Contribution Workflow

### Code style

The coding style suggested by the Golang community is used in SODA Foundation. See the [doc](https://github.com/golang/go/wiki/CodeReviewComments) for more details.

Please follow this style to make SODA Foundation Projects easy to review, maintain and develop.

### Report issues

A great way to contribute to the project is to send a detailed report when you encounter an issue. We always appreciate a well-written, thorough bug report, and will thank you for it!

When reporting issues, refer to this format:

- What version of env (SODA Foundation project, os, golang etc) are you using?
- Is this a BUG REPORT or FEATURE REQUEST?
- What happened?
- What you expected to happen?
- How to reproduce it?(as minimally and precisely as possible)

### Propose PRs

- Raise your idea as an [issue](https://github.com/sodafoundation/api/issues)
- If it is a new feature that needs lots of design details, a design proposal should also be submitted [here](https://github.com/sodafoundation/design-specs/pulls).
- After reaching consensus in the issue discussions and design proposal reviews, complete the development on the forked repo and submit a PR. 
  Here are the [PRs](https://github.com/sodafoundation/api/pulls?q=is%3Apr+is%3Aclosed) that are already closed.
- If a PR is submitted by one of the core members, it has to be merged by a different core member.
- After PR is sufficiently discussed, it will get merged, abondoned or rejected depending on the outcome of the discussion.

Thank you for your contribution !
