---
title: Developing with the Developer PoP
description: How to get your local development environment setup to test section.io CDN on your local machine.
keywords: content delivery network, CDN, virtual machine, vagrant, virtualbox, git, cli, local development, local machine, staging environment, developer pop
weight: 3
---

### 1) Locally Override DNS to point at the Developer PoP

You will need to modify your **local host file** and point the **Hosted Name(s)** for your service at the IP address given by the command `minikube ip`.

    192.168.99.100    www.example.com

This will override the DNS endpoint for that domain and force traffic through the Dev PoP and then to your origin address. That could be your production webserver, production load balancer, development webserver — whatever you configured for in the Dev PoP UI.

Now when you browse to your site URL, the HTTP traffic will be flowing through the Developer PoP!

### 2) Provision SSL certificate

If you visit your website at this point in the tutorial, you will likely see a browser security warning. While it is totally possible to skip this step, click through this warning and test your site without a problem, our Dev PoP can provision a certificate for your local cluster. On the top right hand side, click on the `download root certificate` button.

#### a) For Windows
Right click on the `section.io-developer-pop-root` certificate in your downloads folder and select `install certificate`. Click through the wizard and install the certificate. Once installed, you should see the `DO_NOT_TRUST_sectionio_root` in the security tab of your browser dev tools.
#### b) For Mac
Double-click on the certificate in your downloads folder and add it to the appropriate keychain. Once completed, you should be able to see `DO_NOT_TRUST_sectionio_root` under Category `certificates`. As with Windows, once installed properly the `DO_NOT_TRUST_sectionio_root` should appear in the security section of dev tools.

### 3) Making changes to your configuration

Now that you have traffic flowing through the Dev PoP you will be able to change any configuration and see it live within a few seconds.

Using your favorite editor, open the repository you cloned from Aperture. Whether you have Varnish, PageSpeed, or a Web Application Firewall, you can change the configuration to see how your application will behave.

Once you have made changes to your config, you will want to push them to the Dev PoP to see them in action. Again we will be using a typical git workflow:

1. Stage your changes: `git add .`.
2. Commit your changes: `git commit -m "Some relevant message here"`.
3. Push your changes: `git push developer-pop`.
4. If you have syntax errors git will provide feedback. You may need to make adjustments and go back to step 1.
5. Go back to your browser, reload the page, and see what type of optimizations your changes made.

Congratulations! You have successfully set up the section.io Developer PoP! See below for miscellaneous tips to help you get the most out of the software.


### 4) Troubleshooting issues with the Developer Pop

  The Developer PoP is a still in beta and will occasionally have hiccups. This section details some common issues and how to deal with them.

#### Network connectivity and computer sleep
  Often if you put your computer to sleep with Minikube running, it will break Minikube's network adaptor, and you will get 503 errors without a clear cause when you resume operation. This will also prevent you from downloading proxy images as a part of a `git push`. In order to re-establish connectivity, you need to disconnect the network adapter and reconnect it. If using VirtualBox, do this by opening the VirtualBox UI, going to your VM's settings, clicking `network` and then changing the `attached to:` value from `NAT` to `not attached`, and then back to `NAT`. Toggling this will reset the adapter.

#### Problems with pods in a namespace
  Sometimes Minikube can fail at the namespace level — either by not properly provisioning all the containers it should, or failing to update existing containers after a new git push, or something else. If this happens, you can delete the namespace from the DevPop UI and push the repository back into Minikube by running `git push developer-pop` once the deleted namespace has disappeared from the DevPop UI. You can also accomplish this by renaming the git remote. This will re-trigger all of the container provisioning for the namespace.

#### Minikube becomes unresponsive, or has other problems
  Sometimes, Minikube becomes unstable and stops responding to requests altogether. In this case, you'll want to begin this whole process over again with a `minikube delete` and a `minikube start`. Note that sometimes (especially if you start Minikube again very shortly after the initial delete), Minikube will spin up on another IP address (say `192.168.99.101` instead of `192.168.99.100`). This is fine, but you'll need to adjust your hostfile and your git remote if this occurs. Alternatively, if you restart your computer and then start Minikube, it will return to the `193.168.99.100` address. Most Minikube problems not caused by some sort of configuration error can be fixed with a fresh boot of Minikube.


### 5) Running Minikube with a Local Origin
Although Minikube functions most smoothly when pointed at an origin server with a publicly available IP address, it is possible to connect a local development server to DevPop. The source of complexity here is dealing with the network bridge between the host machine and the Minikube virtual machine. The following are directions for an implementation of this:

1. Start your local server on port:80.
1. Start Minikube.
1. Once Minikube is running and it's networking has been established, you should be able to visit your localhost server on both `127.0.0.1` and `192.168.99.1` (If not, subsequent steps will not work).
1. If you can complete the previous step, then go into the DevPop UI and add both `192.168.99.1` and the relevant hostname (such as `www.example.com`) as the origin for the section.io configuration you wish to run in front of your origin server.
1. In your hostfile, map the hostname you set in the previous step (`www.example.com`) to the IP address of Minikube (likely `192.168.99.100`).
1. Visit your hostname `www.example.com` in your browser. If everything is rigged up correctly, then your browser will send the request to DevPoP on `192.168.99.100`, which will then pass it to the local origin server running on `192.168.99.1`. Note that this request must be made over HTTP and not HTTPS.

