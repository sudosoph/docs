---
title: Set up your Developer PoP
description: How to get your local development environment setup to test Section CDN on your local machine.
keywords: content delivery network, CDN, virtual machine, vagrant, virtualbox, git, cli, local development, local machine, staging environment, developer pop
weight: 1
aliases:
  - /tutorials/developer-workflow/setting-up-your-developer-pop/
---

Section Developer PoP runs on Kubernetes. Minikube is a miniature, prepackaged Kubernetes cluster that works on locally on desktop Microsoft Windows, Mac, and Linux.

Minikube runs in the free and open source [VirtualBox]. 

1. Verify that you have installed VirtualBox.
1. Download and install <a href="https://github.com/kubernetes/minikube/releases/tag/v0.35.0" target="Minikube" title="Minikube v0.35.0 download">Minikube v0.35.0</a>. Version 0.35.0 is the Section supported version of Minikube. https://github.com/kubernetes/minikube/releases/tag/v0.35.0
1. Start minikube: `minikube start`
1. Initialize the Developer PoP:

```
minikube ssh "docker run --rm --net=host -v /var/lib/minikube:/var/lib/minikube:ro sectionio/section-init"
```

{{% notice info %}}
Depending on the speed of your internet connection and the power of your computer, the initiation of the Developer PoP can take several minutes.
{{% /notice %}}

Note that after each one of these terminal commands, you will need to wait a few moments for Minikube to fully launch all the Section containers. If you, for example, try and do the git pushes in the next section immediately after completing the `minikube ssh` command above, you may find that the git daemon or some other relevant component has not yet come online. In this case, just wait for a few minutes — the exact time depends upon the speed of your internet connection and specifications of your machine. 

{{% notice tip %}}
Disable repeating messages about the **kubectl** component you won't need: `minikube config set WantKubectlDownloadMsg false`
{{% /notice %}}


Now your Developer PoP base is ready, but it has not yet launched any of the specific proxies in your configuration.

Let's change that by [loading your Section setup into the Developer PoP]({{< relref "developer-workflow/tutorials/loading-your-setup-into-the-developer-pop.md" >}}).

  [VirtualBox]: http://www.virtualbox.org/
