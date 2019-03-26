---
title: Update Git for a different developer pop ip address
description: How to get your local development environment setup to test Section CDN on your local machine.
keywords: content delivery network, CDN, virtual machine, vagrant, virtualbox, git, cli, local development, local machine, staging environment, developer pop
---

It is possible your Developer PoP IP address may change.

If you see a failure on **git push** with your Developer PoP, try these steps:

1. Ensure Minikube is running: `minikube status`.
1. Obtain the current IP address of Minikube: `minikube ip`.
1. Substitute the IP address into the following command to update the git remote in your Developer PoP `git remote set-url developer-pop http://192.168.99.100:30090/application-name.git`.

