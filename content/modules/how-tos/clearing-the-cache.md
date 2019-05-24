---
title: Clear Cache
description: How to clear the cache for your website, specific pages, or specific objects with Varnish Cache ban expression.
keywords: cache, cached data, website performance, content delivery network, CDN, clear cache, purge cache, empty cache, Varnish Cache ban expression
aliases:
  - /clearing-the-cache/
  - /how-to/clearing-the-cache/
---

URLs that get cached will expire based on the Time To Live (TTL) set either by the Cache-Control headers sent from the origin or by the logic in the VCL code.

However if you need to remove things from the cache before they expire you can do that and we have outlined the steps to do so below.

### 1) Log into your Aperture dashboard and under **Content Delivery Grid** navigate to the **Clear Cache** page.

{{% figure src="/docs/images/clear-cache.png" title="clear cache" %}}

### 2) Select the cache you want to clear

After the completion of Step #1, you should be on the cache clearing management page. At the top you will see different button groups depending on your proxy configuration. A proxy configuration with Varnish Cache  and Pagespeed would have the following set of buttons:

{{% figure src="/docs/images/cache-clear-nav.png" %}}

**Note**: Each reverse proxy's cache is independent of one another so you will need to navigate to each reverse proxy's page in order to view the options and clear the cache for that corresponding reverse proxy.

### 3) Check out the instructions below for the cache you want

#### a) Clearing Varnish Cache 

  We have a whole article on [clearing the cache for Varnish Cache.]({{< relref "varnish-cache/how-tos/clearing-the-cache.md" >}}) Check it out.

#### b) Clearing Pagespeed Cache

  Clearing the Pagespeed cache is more straight forward than clearing a Varnish Cache  because there is only one option: empty the entire cache. To do this, all you need to do is click the red button labeled **Empty the entire cache**.
