---
title: Setting up your Developer PoP
description: How to get your local development environment setup to test section.io CDN on your local machine.
keywords: content delivery network, CDN, virtual machine, vagrant, virtualbox, git, cli, local development, local machine, staging environment, developer pop
weight: 1
---

Section.io's Developer PoP runs on Kubernetes. Minikube is a prepackaged Kubernetes cluster that works on Windows, Mac, and Linux.

Minikube runs on your preference of virtual machine ([VirtualBox] is a free option).

1. Download and install <a href="https://github.com/kubernetes/minikube/releases/tag/v0.26.1" target="Minikube" title="Minikube v0.26.1 download">Minikube v0.26.1</a>.
1. Start minikube: `minikube start`
1. Initialize the Developer PoP: `minikube ssh "docker run --rm --net=host -v /var/lib/localkube:/var/lib/localkube:ro sectionio/section-init"`

{{% notice tip %}}
Disable repeating messages about the **kubectl** component you won't need: `minikube config set WantKubectlDownloadMsg false`
{{% /notice %}}

Now, your Developer PoP base is ready, but your section.io setup is not loaded.

The next step is to [load your section.io setup into the Developer PoP]({{< relref "tutorials/developer-workflow/loading-your-setup-into-the-developer-pop.md" >}}).

  [VirtualBox]: http://www.virtualbox.org/
