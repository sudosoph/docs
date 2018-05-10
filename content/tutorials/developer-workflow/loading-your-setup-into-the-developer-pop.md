---
title: Loading your setup into the Developer PoP
description: How to get your local development environment setup to test section.io CDN on your local machine.
keywords: content delivery network, CDN, virtual machine, vagrant, virtualbox, git, cli, local development, local machine, staging environment, developer pop
weight: 2
---

<!-- Run `minikube service -n section-shared developer-pop`. Your browser will open when the endpoint for the service becomes ready. -->

#### 1) Clone your application's git repository located in the **Advanced Config** menu in the section.io portal.
  ![how to clone a repo](/docs/images/screenshots/dev-pop/how-to-clone-repo.png)

  Clone with `git clone <url-from-advanced-configuration>`

#### 2) Add the devpop remote to your repository.
  * Open the devpop UI: `minikube service -n section-shared developer-pop`

#### 3) Push your configuration files to the Developer PoP
  Once you have added the git remote you can push to the Dev PoP by running: `git push developer-pop`

  If you get this message `Pulling required proxy images, please try again shortly`, that means that your machine does not have the images locally and has begun downloading them. Your terminal will look as though it has exited the process and nothing is happening, but the downloads are going on behind the scenes. Try `git push developer-pop` every few minutes until the downloads are complete and the push goes through.

#### 4) Configure origin server details
Now that your configurations are running on the devpop, you will need to configure your egress settings (origin server details) to tell the devpop where to pass the HTTP request to. To do this you will use the devpop UI's **Services** tab where you will find information about the repository you just pushed up.

##### a) Connect Dev PoP to aperture
 The easiest way to do this is to connect your Dev PoP to your section.io Aperture account and import these configurations.

{{% notice tip %}}
If you have an account in the section.io management console you can link your Developer PoP to your account.

See [How to Connect Developer PoP to Aperture]({{< relref "how-to/developer-pop/connect-to-aperture.md" >}}) for more information.
{{% /notice %}}

##### b) Configure the service manually
In the **Operations** column of the table, there will be a button for you to "Configure" that service. Do this if you do not have a section.io account. It will bring up a modal asking for the following information:

1. Hosted Name: This is the host headers for your application (e.g. www.example.com).
2. Origin Address: This is the either a domain name or IP address that points directly to your load balancer or webserver.
3. Origin Host Header: This is the host header the egress will use to send upstream (typically it's the same as your hosted name).


Now, you're all set. [Let's see your new Developer PoP in action.]({{< relref "tutorials/developer-workflow/developing-with-the-developer-pop.md" >}}).

  [git]: http://git-scm.com/
  [Vagrant]: http://docs.vagrantup.com/v2/installation/
  [Minikube]: https://github.com/kubernetes/minikube/releases/tag/v0.21.0
  [VirtualBox]: http://www.virtualbox.org/
