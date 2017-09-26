---
title: Training - Platform Overview
description: Training area, section.io platform overview.
keywords: section.io, training, platform overview
---
Training - Platform Overview
=================

Welcome to the platform overview training session, the objective of this module is to have you learn about:

* section.io Overview (Platform structure, Locations, Account architecture, Single configuration management)
* DNS
* HTTPS
* Go live steps

There are practical examples and processes for you to follow in each of the above areas

## section.io Overview

section.io is a global platform that runs the configuration you have setup, This configuration is deployed at all of our delivery nodes globally. Users connect to the delivery node closest to them wherever they are in the world.

Each configuration is built of a number of modules (Which are actually Docker containers running as reverse proxies under the hood), you get to pick which modules you want to run in your configuration.

The layout for your configuration is as follows:
You have an Account which is the overall group for all of your configurations

Each Account can have multiple Applications, An Application contains a configuration that you have built

Each Application can have a number of Environments, You always have a Production Environment which is your main public website domain name but its possible make other Environments for things like Staging or Test.
Multiple Environments means you can have a configuration you are working on in a test Environment and then when happy with that configuration you can promote that configuration from test Environment to Production Environment to have it active for your users.

Each Environment can have a number of Domain names attached to it, this means you could have the Production Environment listening to multiple domain names or Test and Staging Environments listending to multiple other domain names.

 ![/assets/images/docs/AccountApplicationEnvironmentStructure.jpeg](/assets/images/docs/AccountApplicationEnvironmentStructure.jpeg)

You manage a configuration for each Environment that is stored in source control (git). We let you control that configuration via our portal (or for advanced users you can clone the git repository locally to your PC). This gives you a complete history of exactly what was changed and when so that you can 

Practical exercise: Setup your Account
1. Head to www.section.io
1. Signup and pick the default options to improve website speed
1. Get to your Overview screen in the portal and see that you have a stack of modules running at each of our locations globally

For further information on Account setup / structure see the full docs: https://www.section.io/docs/create-application/

## DNS

Setting up DNS is the main step required to leverage the section.io platform, This is the change the sends traffic to section.io.

See the DNS menu in the left hand navigation of the portal for the details of the CNAME change you need to make.

We also offer free DNS hosting which can be great if you need flexible options with your setup.

Practical exercise: Checkout your current DNS setup
1. Use either your computer or an online tool to checkout DNS settings for your domain name
  1. On a PC open a command prompt at type: nslookup www.yourdomain.com
  1. On a Mac open a terminal and type: dig +trace www.yourdomain.com
    1. The output at the bottom of the command tells you both where your DNS record is pointed and also the TTL (Time To Live) on the record, which is how long in seconds it will take for your changes to be live after your update DNS. If this is a big number (> 600) it might be worth lowering this temporarily so that you can quickly implement DNS changes
  1. If the above is unavaille leverage an online tool such as Kloth: http://www.kloth.net/services/dig.php
  
## HTTPS

There are 2 options around HTTPS/certificates in section.io:
1. Leverage free certificates from section.io (Default option)
1. Upload your own certificate into section.io

To have your browsers use HTTPS you also need to have your origin servers open for HTTPS (Port 443) - as an option you dont have to run a valid certificate in the origin (it can be self signed or even expired). Browsers all connect to section.io and leverage our certificate for establishing the HTTPS connection rather than the one installed in the origin.

Further information on HTTPS setup is available: https://www.section.io/docs/setup-https/

Practical exercise: Check your current certificate setup before go live (you can do the same process after go live to ensure all ok)
1. Browse to an online certificate checking service such as: https://www.digicert.com/help
1. Enter your domain name and initiate the check
1. Hopefully your setup receives a tick at the bottom of the test
1. Once you Go Live on section.io you can repeat this test to ensure your HTTPS/SSL/TLS/Certificate setup is correct

## Go Live Steps

The simple process to get started and go live is detailed below:

Go Live Steps
1. Preparation and testing
   1. Setup your Application with the configuration you want (Often Varnish Cache)
1. DNS Change
   1. The DNS menu in the portal shows you the CNAME change you need to make to go live
1. HTTPS Setup
   1. If you are using section.io's free certificates, hit the renew button in the portal now on the HTTPS menu
1. Functional testing
   1. Follow our full guide on the testing process: https://www.section.io/docs/testing/#what-should-i-be-testing-on-my-website


