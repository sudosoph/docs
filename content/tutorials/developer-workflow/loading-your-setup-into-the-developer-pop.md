---
title: Loading your setup into the Developer PoP
description: How to get your local development environment setup to test section.io CDN on your local machine.
keywords: content delivery network, CDN, virtual machine, vagrant, virtualbox, git, cli, local development, local machine, staging environment, developer pop
weight: 2
---

To make working with the Developer PoP easier, section.io provides a user interface to interact with your configuration.

Run `minikube service -n section-shared developer-pop`. Your browser will open when the endpoint for the service becomes ready.

Once you have installed and set up your devpop, you will want to get comfortable with a typical git workflow.

1. Clone your application's git repository located in the **Advanced Config** menu in the section.io portal.
2. Add the devpop remote to your repository. This command is available in the **Operations** tab in the devpop UI.
  * To open the devpop UI run this command: `minikube service -n section-shared developer-pop`
3. Once you have added the git remote you can push to the devpop by running: `git push developer-pop`
  * When running this command, we have pre-git hooks that check for syntax errors and ensure the images of your proxies are on your local machine. 
  * If you get this message `Pulling required proxy images, please try again shortly` you will need to run the git push command again after a few moments.

Now that your configurations are running on the devpop, you will need to configure your egress settings (origin server details) to tell the devpop where to pass the HTTP request to. To do this you will use the devpop UI's **Services** tab where you will find information about the repository you just pushed up.

In the **Operations** column of the table, there will be a button for you to "Configure" that service. It will bring up a modal asking for the following information:

1. Hosted Name: This is the host headers for your application (e.g. www.example.com).
2. Origin Address: This is the either a domain name or IP address that points directly to your load balancer or webserver.
3. Origin Host Header: This is the host header the egress will use to send upstream (typically it's the same as your hosted name).

On the contrary you can connect your devpop to your section.io's Aperture account and import these configurations. This is really handy if you have multiple hosted names and/or multiple origins (We will cover how to add these manually later on).

{{% notice tip %}}
If you have an account in the section.io management console you can link your Developer PoP to your account.

This will help you populate some of the settings in the Developer PoP to mirror what you have set up in production.

See [How to Connect Developer PoP to Aperture]({{< relref "how-to/developer-pop/connect-to-aperture.md" >}}) for more information.
{{% /notice %}}

Now, you're all set. [Learn how to develop with the Developer PoP]({{< relref "tutorials/developer-workflow/developing-with-the-developer-pop.md" >}}).

  [git]: http://git-scm.com/
  [Vagrant]: http://docs.vagrantup.com/v2/installation/
  [Minikube]: https://github.com/kubernetes/minikube/releases/tag/v0.21.0
  [VirtualBox]: http://www.virtualbox.org/
