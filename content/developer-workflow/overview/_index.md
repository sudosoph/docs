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

Section’s local development environment;

* Is based on a **git push** workflow
* Replicates production clusters locally with Kubernetes powered by Minikube.
* Allows developers to design a production edge compute platform locally on your development machine.
* Tests configuration locally without having to work in production.
+ Helps avoid spinning up another copy of the production environment to test on.
* Replicates the production point of presence (PoP) in a virtual machine (VM) running on your computer. 
* Test all the levels of your architecture and see what works best before actually putting it in front of your website and users.

Let's get started by [installing the Developer PoP core]({{< relref "developer-workflow/tutorials/setting-up-your-developer-pop.md" >}}).
