---
title: Account Management
description: Guide for setting up Section for multiple clients or websites. Reviews Section account structures and instructions to get started.
keywords: CDN, development agency, client websites, billing, staging environment, test environment
aliases:
  - /agency-account-setup/
  - /topic-guides/account-management/
weight: 2

---

Below is an overview of the language used within the Section product and a description of each schema. 

### Structure

Here are the structures within Section and our recommended use:

* **User** — When you first sign up for Section, you register on the platform with an email address. This is the account is specific to you as a user.

* **Account (Organization)** - After logging in for the first time as a user, your dashboard will prompt you to create an account. This might be initially confusing because you created an account moments before when signing up for Section. Think of this second account as an organization or company. The Section platform supports a many-to-many relationship between user accounts and organization/company accounts. Users can belong to multiple organizations and organizations can have multiple users. Because software applications running with Section are associated with an organization account and not your specific user account, you can seamlessly add other users and share full access to your Section application.

* **Application** - At Section, we use the term “application” a bit differently than you might be accustomed to. Rather than referring to a specific software application like an Express app or a Magento site, an application describes the Section platform-specific entity that holds the configuration for your content-delivery and proxy setup, monitors HTTP traffic from the client through your proxy stack to your origin and back again, and manages the state of your website content. Each application holds a single git repository. Configuration changes are made to an application through a typical git workflow.

* **Environment** An application supports multiple environments like staging, development, and production on git branches within the application repository. Each of these environments can have different proxy configurations. This gives you incredible flexibility by allowing you to test a new proxy configuration in a development branch and then easily merge that configuration to production.

* **Domains** — Each application can also have multiple domains. This allows you to run any number of websites with the same proxy configuration setup, greatly simplifying the management process for many similar sites. This comes in particularly handy if you have one backend taking requests from a number of different domains.


### Guide

To use this structure, here is a step-by-step guide to get started:

* Create an application for a production* website.
* Add that application to the appropriate account. You will create the account during application creation.
* Add additional applications for any additional websites for that account.
* Add additional environments (such as staging) to each application as needed.
* For the second - nth orgranization, create a new application and create a new account to add that application to. You will have the option to add it to an existing account that you have access to, but for each new orgranization you will want to create a new account.
* Within each account, add users you want to be able to access all the application within that account.

{{% notice note %}} 
We strongly recommend entering the production hostname when creating a new application, even if you want to test with a staging hostname first. This is because the first hostname that gets entered will become the production environment for that application. You can then add a staging environment to the application and go live with that environment first if you choose.
{{% /notice %}}

It is also important to note that the website will not automatically go live with Section when you create an application. To go live and start sending traffic through Section, you will need to [change the dns record](/docs/change-dns). Again, this means you can setup an application, add a staging environment, go live with a staging environment, and then finally go live with production environment.

### Examples

Here is an example setup using this structure:

{{% figure src="/docs/images/agency-account-setup.png" %}}
