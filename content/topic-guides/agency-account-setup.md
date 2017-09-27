---
title: Agency Account Setup
description: Guide for setting up section.io for multiple clients or websites. Reviews section.io account structures and instructions to get started.
keywords: CDN, development agency, client websites, billing, staging environment, test environment
aliases:
  - /agency-account-setup/

---

If you want to use section.io for your clients, section.io can easily separate your clients into their own accounts to handle user access and billing concerns.

#### **Structure** - Here are the structures within section.io and our recommended use for agencies:

* **User** - A user can be assigned to multiple groups. We recommend having a user account for anyone who should have access to any of your accounts (more on this in a minute). There is no cost to add additional users.
* **Account** - An account is a security and billing boundary that can have multiple applications and multiple users. We recommend using accounts for client-level separation and adding client users to that account and agency employees to all accounts they work on.
* **Application** - An application is a configuration boundary, meaning that each application will be able to use the same proxy configurations, repository, and metrics. We recommend using an application per website that the client owns. You can also [split applications](/docs/split-application) to set up different configurations for different areas of the domain.
* **Environment** - An environment is different versions of the same application. This is typically production, development, and staging/qa.

#### **Guide** - To use this structure, here is a step-by-step guide to get started:

* Create application for production* website for a client.
* Add that application to an account for that client. You will create the account during application creation.
* Add additional applications for any additional websites for that client.
* Add additional environments (such as staging) to each application as needed.
* For the second - nth client, create a new application and create a new account to add that application to. You will have the option to add it to an existing account that you have access to, but for each new client you will want to create a new account.
* Within each account, add users you want to be able to access all the application within that account.

*Please note: We strongly recommend entering the production hostname when creating a new application, even if you want to test with a staging hostname first. This is because the first hostname that gets entered will become the production environment for that application. You can then add a staging environment to the application and go live with that environment first if you choose.

It is also important to note, you the website will not go live with section.io when you create an application. To go live and start sending traffic through section.io, you will need to [change the dns](/docs/change-dns). Again, this means you can setup an application, add a staging environment, go live with a staging environment, and then finally go live with production environment.


#### **Example** - Here is an example setup using this structure:

![/assets/images/docs/agency-account-setup.png](/assets/images/docs/agency-account-setup.png)
