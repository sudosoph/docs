---
title: Loading your setup into the Developer PoP
description: How to get your local development environment setup to test Section CDN on your local machine.
keywords: content delivery network, CDN, virtual machine, vagrant, virtualbox, git, cli, local development, local machine, staging environment, developer pop
weight: 2
aliases:
  - /tutorials/developer-workflow/loading-your-setup-into-the-developer-pop/
---

<!-- Run `minikube service -n section-shared developer-pop`. Your browser will open when the endpoint for the service becomes ready. -->

### 1) Clone your application's git repository located in the **Advanced Config** menu in the Section portal.
  ![how to clone a repo](/docs/images/screenshots/dev-pop/how-to-clone-repo.png)

  Clone with `git clone <url-from-advanced-config>`

### 2) Add the Dev PoP remote to your repository.
  * Open the Dev Pop UI: `minikube service -n section-shared developer-pop`

  * Click on the Operations tab.
  ![operations tab](/docs/images/screenshots/dev-pop/operations-tab.png)

  * Enter the git commands you see here inside the repository you cloned down in step #1. Replace "**www.site.com**" with your domain which is visible in the Section portal. (**note** : it won't actually break anything if you leave it as "site").
  ![domain name](/docs/images/screenshots/dev-pop/domain-name.png)

### 3) Push your configuration files to the Developer PoP
  Once you have added the git remote you can push to the Dev PoP by running: `git push developer-pop`

  If you get this message `Pulling required proxy images, please try again shortly`, that means that your machine does not have the proxy images locally and has begun downloading them. Your terminal will look as though it has exited the process and nothing is happening, but the downloads are going on behind the scenes. Try `git push developer-pop` every few minutes until the downloads are complete and the push goes through. The length of this process will depend entirely on the speed of your internet connection.

### 4) Configure origin server details
Now that your configurations are running on the Dev Pop, you will need to configure your egress settings (origin server details) to tell the Dev Pop where to pass the HTTP request to. To do this you will use the Dev Pop UI's **Services** tab where you will find information about the repository you just pushed up. A page refresh might be needed.

#### a) Connect Dev PoP to aperture
 The easiest way to do this is to [connect your Dev PoP to your Section Aperture account]({{< relref "how-to/developer-pop/connect-to-aperture.md" >}}) and **import** these configurations.

To do this :

1. Click on **Import** under the *Operations* column in the **Services** tab.
2. Select the **Environment** you want to test.
3. Click on **Import** to finish importing the configurations.

{{% notice tip %}}
If you have an account in the Section management console you can link your Developer PoP to your account.

See [How to Connect Developer PoP to Aperture]({{< relref "how-to/developer-pop/connect-to-aperture.md" >}}) for more information.
{{% /notice %}}

#### b) Configure the service manually
In the **Operations** column of the table, there will be a button for you to "Configure" that service. Do this if you do not have a Section account. It will bring up a modal asking for the following information:

1. Hosted Name: This is the host headers for your application (e.g. www.example.com).
2. Origin Address: This is the either a domain name or IP address that points directly to your load balancer or webserver.
3. Origin Host Header: This is the host header the egress will use to send upstream (typically it's the same as your hosted name).


Now, you're all set. [Let's see your new Developer PoP in action.]({{< relref "developer-workflow/how-tos/developing-with-the-developer-pop.md" >}}).

  [git]: http://git-scm.com/
  [Vagrant]: http://docs.vagrantup.com/v2/installation/
  [Minikube]: https://github.com/kubernetes/minikube/releases/tag/v0.21.0
  [VirtualBox]: http://www.virtualbox.org/
