---
title: Set up an application
description: A step-by-step guide on how to get started with section.io's CDG.
keywords: guide, getting started, website performance, page speed, webpage speed, website security, content delivery network, CDN
aliases:
  - /quickstart/
  - /create-application/

---

With section.io you can choose your preferred reverse proxy combination and we'll take care of setting it up for you. You will have access to real time data, and have complete control of the integration of section.io into your application's development process. Your account will instantly be synchronized with your local, staging, and production environments so you can check your application's configurations before deploying to production. You can also test how different configurations impact your site to maximize the improvements.

To get started you'll first need to [create a user on section.io](https://www.section.io/sign-up-routing/) and validate your email.

Between when you create a user and create your own application you'll be able to access Bootcamp, which provides a demo of our application so you can see how it works once your account is all setup.

Create An Application
==========

To create an application you will be taken through a series of steps so that you can start sending traffic through your section.io reverse proxy configuration. You will be asked to do this immediately upon creating a user, but you can also select setup website from the demo account (bootcamp) at any time.

To complete your application setup you'll need to:

* Enter your [application's hostname](#application-hostname)
* Select the [reverse proxies](#reverse-proxy-selection) you want to run with section.io
* Create your [account](#account-creation) to manage the application
* Change [DNS](/docs/change-dns) to start send traffic through section.io
* Enable [HTTPS](/docs/setup-https) to ensure security and enable HTTP/2.

Once your account and application have been created you will want to start [developing locally](/docs/local-development) so you can test your configurations against your origin.

Application Hostname
-------------------------

First you will need to enter your application's hostname, which is usually your website's url. When you enter your url, we will identify your Hostname and Origin.  

We strongly recommend entering your production hostname while creating an application, even if you want to test with a staging hostname first. This is because the first hostname that gets entered will become the production environment for your application. You can then add a staging environment to the application and go live with that environment first if you choose.

It is also important to note, you will not go live with section.io when you create an application. To go live and start sending traffic, you will need to [change your dns](/docs/change-dns). Again, this means you can setup an application, add a staging environment, go live with a staging environment, and then finally go live with production.

If you want to use section.io on multiple client accounts, check out our [agency setup guide](/docs/agency-account-setup/) which walks through our recommended setup.

Reverse Proxy Selection
-------------------------

After we've identified your host name and origin, we'll ask you to select a reverse proxy.

You can only choose one reverse proxy during setup. If you want to select multiple, you can do so after your account is created by editing your 'section.config.json' file in you [repository](/docs/advanced-configuration/#add-another-reverse-proxy). It's important to note this selection will impact [pricing](https://www.section.io/pricing/).

If you are unsure on which proxy is right for you, check out our [available proxy templates page](/docs/proxy-list/). If you don't have a preference, we recommend starting with Varnish v4.

Account Creation
-------------------------

For this application, you will need to setup an account for the purposes of billing and granting other people permission to access your account.

You can simply put the name of your company here. Please note: You can have many applications tied to one account, but only one account per application.

You'll then be asked to review all of your selections, and then we'll create your application! You may need to wait a few minutes while we complete your environment.

Now that your both you application and account have been created, you’ll need to change your [DNS](/docs/change-dns) and add a [HTTPS](/docs/setup-https) certificate to start serving traffic on section.io.
