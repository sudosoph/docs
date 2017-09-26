---
title: Varnish Cache Hit Rate
description: Guide for understanding Varnish Cache hit rate, metrics, and logs.
keywords: varnish, varnish cache, cache, cached data, hit rates, varnish hit rates, vcl, varnish configuration language, metrics
---
Improve Varnish Cache Hit Rate
==============================

The Varnish Cache project provides some high level instructions on [improving cache hit rate](https://varnish-cache.org/docs/4.0/users-guide/increasing-your-hitrate.html).

The following describes the work flow with section.io metrics and development processes to achieve optimal cache hit ratios.

> 1.  Review section.io Varnish metrics
> 2.  Review http logs
> 3.  Make changes to VCL locally
> 4.  Confirm change has been effective -> Logs
> 5.  Promote changes to Production
> 6.  Confirm change has been effective -> Metrics
> 7.  Rinse and repeat

Review Varnish Metrics
----------------------

Your section.io [Varnish metrics](/docs/metrics-overview/) provide an overview of cache hit ratios for all asset types in addition to cache hit ratios by type.

You can use these metrics to identify an object type for which you would like the cache hit ratio to be improved.

Review HTTP Logs
----------------

Use the Kibana logs to review the HTTP requests. For more information about these logs please check out the docs [here](/docs/logs/).

Make Changes to VCL
------------------

Modify your local VCL file. Save and fire the requests at your local instance. See [Local Development](/docs/local-development/).

Review logs again to confirm a change in the cache hit behavior for the target assets.

Promote Changes to Production
-----------------------------

If required you can test the application locally to confirm the VCL changes have not affected the functionality of the application adversely for users.

Sync your section.io repo with production and confirm cache hit rates are improving by reviewing your metrics.

Rinse and Repeat
----------------

Until you hit a desirable cache hit rate across the site.
