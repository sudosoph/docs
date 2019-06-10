---
title: Overview
description: How to get your local development environment setup to test Section CDN on your local machine.
keywords: content delivery network, CDN, virtual machine, vagrant, virtualbox, git, cli, local development, local machine, staging environment, developer pop
weight: 1
aliases:
  - /developer-pop/
  - /local-development/
  - /tutorials/developer-pop
  - /tutorials/developer-workflow/
---

Section’s local development environment is designed to develop and test changes to your edge compute platform configuration without having to work in production, or spin up another copy of the production environment to test on.

This is done by replicating the production point of presence in a virtual machine (VM) running on your computer. 

You will have the ability to test all the levels of your architecture and see what works best before actually putting it in front of your website and users.

Section’s local development environment is based on a git workflow and Kubernetes provided by Minikube.

Let's get started by [installing the Developer PoP core]({{< relref "developer-workflow/tutorials/setting-up-your-developer-pop.md" >}}).
