---
title: Set up Drupal 8 on Section
description: Guide to connecting a Drupal instance to the Section platform with our Drupal module.
keywords: cache, website performance, page speed, webpage speed, Drupal
weight: 10
aliases:
  - /how-to/drupal-setup/drupal8/
---

The following is a guide to installing the Section Drupal module into an existing Drupal 8 application. This module allows Section's global, distributed caching layer to quickly respond to invalidation events from a Drupal instance in exactly the same way that Drupal's internal cache or a local varnish cache running on the host machine does, ensuring that the content in Section's global caching layer is never stale.

### Prerequisites

* An existing Section application. For help setting up an application, [go here](https://www.section.io/docs/tutorials/activate-section-io/create-application-edge/)
* A user account to be associated with the Drupal Module (many customers choose to create a user account that exists simply to authenticate cache clearing and is not associated with a specific, real person). To create an account please visit [this link](https://www.section.io/public/register) and for help adding a new user to an app please [see here](https://www.section.io/docs/how-to/user-management/add-a-user-to-your-account/)
* The Drupal 8 [purge module](https://www.drupal.org/project/purge) installed.
* The Drupal 8 [key module](https://www.drupal.org/project/key) installed.
* Drush installed if you want to purge any invalidation type over CLI. (requires purge 8.x-3.x-dev or newer for Drush 9 support)
* Modify your VCL to disable cache on certain pages like admin panel. [Here's an example](https://gitlab.wklive.net/snippets/32), but lots will probably need to be changed for section. 
  * The blocks of code within `if (req.method == "BAN")` and `if (req.method == "PURGE")` are not necessary on section because bans are handle via the API. 
  * You may also want to pass on pages with certain cache tags:
    * `obj.http.Cache-Tags ~ "config:user.role.authenticated"`
    *  `obj.http.Cache-Tags ~ "config:user.role.administrator"` and/or
    *  `obj.http.Cache-Tags ~ "config:system.menu.admin"`

### Download the Section Purger

This module can be found [here](https://github.com/section-io/drupal-purger). Download the latest release as a zip/tar file and load into your Drupal instance. We also support installing via composer.

### Enable Purge and Section Purger Modules

Click the Extend tab in the admin console or otherwise navigate to `/admin/modules`. If the Purge module is installed correctly, this page should contain a section called PURGE with various available submodules. Enable the `Purge`, `Purge Tokens`, and `Purge UI` submodules. We are also compatible with Drush but it is not required.

{{% figure src="/docs/images/drupal8-purge-modules.png" %}}

You also need to enable a way to process cache invalidation items. You choices are the `Cron processor` and the `Late runtime processor`.The `Cron Processor` will process cache invalidations only when the cronjob is run (it runs automatically on a predefined schedule or you can initiate it manually from the admin console), while the `Late runtime processor` will initiate cache bans as soon as a piece of content is changed. It does not matter to our module whether you choose either or both.

{{% figure src="/docs/images/drupal8-cron-options.png" %}}

Finally, enable the Section Purger itself, along with the `Section HTTP Tags Header` module and the `Core Tags Queuer`. This module ensures that Drupal sends the appropriate cache tags that our module uses to evict expired assets from the cache.

{{% figure src="/docs/images/drupal8-purger-modules.png" %}}

### Safely store your Aperture Password with the key module

Navigate to `/admin/config/system/keys/add` and input your section.io password. Use key type `Authentication`, and choose whichever key provider you find to be the safest in your particular environment. (More info on this in the [key module documentation](https://www.drupal.org/docs/8/modules/key)).

{{% figure src="/docs/images/drupal8-purger-key.png" %}}

### Configure Full Page Cache Max Age

Navigate to `/admin/config/development/performance` and set `Page Cache Max Age` to whatever value you prefer. Since the extension is clearing the cache whenever a change event occurs, there is no need to wait for object resources to expire naturally and you can safely choose 1 year. Varnish Cache's default behavior is to cache according to the cache-control headers on the response, but Varnish Cache can also be configured to set its own internal TTL value for cached objects based on content-type, status, or other response attributes. For more information on this, please see our Varnish Cache guides.

### Enable the Section Purger within the Purge UI

Navigate to `/admin/config/development/performance`. If your installation of the purge module succeeded, you'll see a `Purge` tab next to the `Performance` tab at the top of the page.

Next, click on `Add Purger` to open the UI to create a new Purger and select `HTTP Purger`. Once created, you should see a flash message informing you that the purger has been successfully created.

{{% figure src="/docs/images/drupal8-purger-ui.png" %}}

Next, click on the small arrow next to the purger and click `configure`. This will open the UI to fill in your account credentials and connect your Drupal module to the Section platform.

*Note:* `The Drupal Site Name` field should be the full hostname of the site for which you are configuring the purger, and is only necessary when setting up a Drupal 8  multisite. If your Drupal instance is not a multi-site, then this field can be left blank.  
Once here, input the details of the user account you would like to use to authenticate with our API. Once done, click `Save Configuration`. Once saved and configured properly, the status bar on the right hand side should show all green as pictured below.

{{% figure src="/docs/images/drupal8-configure-purger.png" %}}

{{% figure src="/docs/images/drupal8-purger-all-green.png" %}}

## Check the logs to confirm that queuer is working (optional)

You can set the logging levels from the block on the right sidebar on the purge page. 

(`/admin/config/development/performance/purge`)


{{% figure src="/docs/images/drupal8-purger-logging.png" %}}

You can view the logs at `/admin/reports/dblog`

{{% figure src="/docs/images/drupal8-purger-logs.png" %}}


## Raise the timeout if necessary

If you are seeing timeout errors connecting to aperture, raise the timeout in the purger settings.

{{% figure src="/docs/images/drupal8-purger-timeout.png" %}}
