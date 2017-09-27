---
title: Clearing Cache
description: How to clear the cache for your website, specific pages, or specific objects with Varnish ban expression.
keywords: cache, cached data, website performance, content delivery network, CDN, clear cache, purge cache, empty cache, varnish ban expression
aliases:
  - /clearing-the-cache/
---

URLs that get cached will expire based on the Time To Live (TTL) set either by the Cache-Control headers sent from the origin or by the logic in the VCL code.

However if you need to remove things from the cache before they expire you can do that and we have outlined the steps to do so below.

## Get started

Log into your Aperture dashboard and under **Content Delivery Grid** navigate to the **Clear Cache** page.

{{% figure src="/docs/images/clear-cache.png" title="clear cache" %}}

## Individual setup

Once you are on the **Manage** page, based on your reverse proxy setup, you will have different button group options to choose from. For example, if my reverse proxy setup consists of Varnish and Pagespeed then I will see a Varnish and Pagespeed button in the subnavbar at the top of my screen. Each reverse proxy's cache is independent of one another so you will need to navigate to each reverse proxy's page in order to view the options and clear the cache for that corresponding reverse proxy.

{{% figure src="/docs/images/cache-clear-nav.png" %}}

## Clearing Varnish Cache

There are three ways to remove objects from the Varnish cache:

### Purge particular URLs

You can remove particular URLs from the cache by entering the URL and clicking **Purge**.
This form accepts wildcards in the form of `*`, so entering `/images*` will purge all URLs starting with `/images`.

### Empty the entire cache

This will remove **everything** we have cached for your site.  Use this if the cache is completely out of date and it needs to be refreshed.

NOTE: This may cause increased load on your origin server until we are able to refill the cache.

### Custom Varnish ban expression

Our cache is an instance of Varnish so you can use ban expressions to prevent objects from being served from the cache. To learn how
to use bans, see the [Varnish Cache documentation](https://www.varnish-cache.org/docs/trunk/users-guide/purging.html#bans).

## Clearing Pagespeed Cache

To clear the Pagespeed cache, it is a lot more straight forward than the Varnish cache clear as there is only one option, empty the entire cache. To do this, all you need to do is click the red button labeled **Empty the entire cache**.
