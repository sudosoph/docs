---
title: Set up Drupal 8 on Section
description: Guide for evaluating your website performance and how to use Section to make improvements using our Drupal Module.
keywords: cache, website performance, page speed, webpage speed, Drupal
weight: 10
---

The following is a guide to installing the Section Drupal module into an existing Drupal 8 application. This module allows Section's global, distributed caching layer to quickly respond to invalidation events from a Drupal instance in exactly the same way that Drupal's internal cache or a local varnish cache running on the host machine does, ensuring that the content in Section's global caching layer is always up to date.

### Prerequisites

* An existing Section application. For help setting up an application, [go here](https://www.section.io/docs/tutorials/activate-section-io/create-application-edge/)
* A user account to be associated with the Drupal Module (many customers choose to create a user account that exists simply to authenticate cache clearing and is not associated with a specific real person). To create an account please visit [this link](https://www.section.io/public/register) and for help adding a new user to an app please [see here](https://www.section.io/docs/how-to/user-management/add-a-user-to-your-account/)
* The Drupal 8 [purge module](https://www.drupal.org/project/purge) installed.

### Download the 

### Enable Purge and Section Purger Modules

Under `PURGE`, enable the `Purge`, `Purge Tokens`, and `Purge UI` submodules. We are also compatible with Drush but it is not required.

{{% figure src="/docs/images/drupal8-purge-modules.png" %}}

You also need to enable a way to process cache invalidation items. You choices are the `Cron processor` and the `Late runtime processor`.The `Cron Processor` will process cache invalidations only when the cronjob is run (it runs automatically on a predefined schedule or you can initiate it manually from the admin console), while the `Late runtime processor` will initate cache bans as soon as a piece of content is changed. It does not matter to our module whether you choose either or both.

{{% figure src="/docs/images/drupal8-cron-options.png" %}}

Finally, enable the Section Purger itself, along with the `Generic HTTP Tags Header` module. This module ensures that Drupal sends the appropriate cache tags that our module uses to evict expired assets from the cache.

{{% figure src="/docs/images/drupal8-purger-modules.png" %}}

### Configure Full Page Cache Max Age

Navigate to `/admin/config/development/performance` and set `Page Cache Max Age` to whatever value you prefer. Since the extension is clearing the cache whenever a change event occurs, there is no need to wait for object resources to expire naturally and you can safely choose 1 year.

### Enable the Section Purger within the Purge UI

Navigate to `/admin/config/development/performance`. If your installation of the purge module succeeded, you'll see a `Purge` tab next to the `Performance` tab at the top of the page.

Next, click on `Add Purger` to open the UI to create a new Purger and select `HTTP Purger`. Once created, you should see a flash message informing you that the purger has been successfully created.

{{% figure src="/docs/images/drupal8-purger-ui.png" %}}

Next, click on the small arrow next to the purger and click `configure`. This will open the UI to fill in your account credentials and connect your Drupal module to the Section platform.

Once here, input the details of the user account you would like to use to authenticate with our API. Once done, click `Save Configuration`. Once saved and configured properly, the status bar on the right hand side should show all green as pictured below.

{{% figure src="/docs/images/drupal8-configure-purger.png" %}}

{{% figure src="/docs/images/drupal8-purger-all-green.png" %}}
