---
title: Developer PoP
description: How to get your local development environment setup to test section.io CDN on your local machine.
keywords: content delivery network, CDN, virtual machine, vagrant, virtualbox, git, cli, local development, local machine, staging environment, developer pop
weight: 2
aliases:
  - /developer-pop/
  - /local-development/
---

section.io’s local development environment is designed to develop and test changes to your content delivery configuration without having to work in production or spin up another copy of the production environment to test on. This is done by replicating the production delivery environment in a virtual machine (VM) running on your computer. You now have the ability to test all the levels of your architecture and see what works best before actually putting it in front of your website and users.

section.io’s local development environment is based on [git], [Minikube], and your preference of virtual machine ([VirtualBox] is a free option). Please ensure you have the latest version of these installed before progressing.

## Setting up your Developer PoP

1. Download and install [Minikube] v0.21
1. Disable repeating messages about the `kubectl` component you won't need: `minikube config set WantKubectlDownloadMsg false`
1. Start minikube: `minikube start`
1. Initialize the Developer PoP: `minikube ssh "docker run --rm --net=host sectionio/section-init"`

## Setting up you application

To make working with the devpop easier, section.io provides a user interface to interact with your configurations: `minikube service -n section-shared developer-pop`. Your browser will open when the endpoint for the service becomes ready.

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

### Connecting to Aperture

*Note: If you don't have an Aperture account and want to use the devpop to simply test reverse proxies, feel free to skip this section.*

In the upper right hand corner of the devpop UI, there is a **Connect to Aperture** button. When clicking this it will redirect you to Aperture and prompt you to login and authorize the devpop. If you are successful then the **Connect to Aperture** button will be replaced with a blinking blue icon followed by your email address.

This will enable an **Import** button on the **Operations** column of the services table, which will open up a modal prompting you to select the application you want to import.

### Testing your website

You will need to modify your local host file and point the **Hosted Name(s)** for your service at `192.168.99.100`.

    192.168.99.100    www.example.com

This will override the DNS endpoint for that domain and force traffic through the devpop and then to your origin address whether that be your production webserver, production load balancer, development webserver, etc. that you configured for in the devpop UI.

Now if you browse to your site the HTTP traffic will be flowing through the devpop which gives you the ability to test all configurations without affecting any other users. 

### Updating your configurations

Now that you have traffic flowing through the devpop you will be able to change any configuration and see it live within a few seconds. Navigate to your favorite test editor and bring up the directory of the repository you cloned from Aperture. Whether you have Varnish, PageSpeed, or a Web Application Firewall, you can change any of the configurations to see how your application will perform.

Once you have made changes to your config, you will want to push them to the devpop to see them in action. Again we will be using a typical git workflow:

1. Add your staged changes: `git add .`
2. Commit your changes: `git commit -m "Some relevant message here"`
3. Push your changes: `git push developer-pop`

Make sure you have no syntax errors via the git feedback, and wait a few moments for you changes to take affect. Now go back to your browser, reload the page, and see what type of optimizations your changes made!

### Known issues

1. Your minikube may change IP address on restart. Run `minikube ip` to get the IP address of your Developer Pop. Substitute the IP address into the following command to update the git remote in your Developer PoP `git remote set-url developer-pop http://192.168.99.100:30090/application-name.git`
1. Re-initializing is not supported, you may get `The Service "developer-pop" is invalid: spec.ports[0].nodePort: Invalid value: 32080: provided port is already allocated`

  [git]: http://git-scm.com/
  [Vagrant]: http://docs.vagrantup.com/v2/installation/
  [Minikube]: https://github.com/kubernetes/minikube/releases/tag/v0.21.0
  [VirtualBox]: http://www.virtualbox.org/
