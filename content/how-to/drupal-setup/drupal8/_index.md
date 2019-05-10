---
title: Set up Drupal 8 on Section
description: Guide for evaluating your website performance and how to use Section to make improvements using our Drupal Module.
keywords: cache, website performance, page speed, webpage speed, Drupal
weight: 10
---

The following is a guide to installing the Section Drupal module into an existing Drupal 8 application. This module allows Section's global, distributed caching layer to quickly respond to invalidation events from a Drupal instance in exactly the same way that Drupal's internal cache or a local varnish cache running on the host machine does, ensuring that users never receive stale content.

### Prerequisites

* An existing Section application
* A user account to be associated with the Drupal Module (many customers choose to create a user account that exists simply to authenticate cache clearing and is not associated with a specific real person).
* The Drupal 8 [purge module](https://www.drupal.org/project/purge) installed.

#### Enable Purge and Section Purger Modules

Under `PURGE`, enable the `Purge`, `Purge Tokens`, and `Purge UI` submodules.
{{% figure src="/docs/images/drupal8-purge-modules.png" %}}

You also need to enable a way to process cache invalidation items. You choices are the `Cron processor` and the `Late runtime processor`.The `Cron Processor` will process cache invalidations only when the cronjob is run (it runs automatically on a predefined schedule or you can initiate it manually from the admin console), while the `Late runtime processor` will initate cache bans as soon as a piece of content is changed. It does not matter to our module whether you choose either or both.

{{% figure src="/docs/images/drupal8-cron-options.png" %}}

Finally, enable the Section Purger itself, along with the `Generic HTTP Tags Header` module. This module ensures that Drupal sends the appropriate cache tags on responses that our module uses to properly evict items from the cache.

{{% figure src="/docs/images/drupal8-purger-modules.png" %}}

#### Enable the Section Purger within the Purge UI

Navigate to `/admin/config/development/performance`. If your installation of the purge module succeeded, you'll see a `Purge` tab next to the `Performance` tab at the top of the page.

{{% figure src="/docs/images/drupal8-configure-purger.png" %}}
