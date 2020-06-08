---
title: PageSpeed with Varnish Cache
description: Adding PageSpeed to your Section proxy stack alongside Varnish Cache.
keywords: content delivery network, CDN, pagespeed, reverse proxies, proxy, proxy template
weight: 1
aliases:
  - /modules/pagespeed/reference/pagespeed-and-varnish-cache/
---

## Overview

PageSpeed has it's own internal cache which causes problems when used alongside the Varnish Cache reverse proxy. You will need to add a VCL file [located here](https://gist.github.com/section-io-gists/dcda5a05d1006e3b8c8bd17e7105749c), to your `varnish` directory. You will then need to add the following code snippet above your `vcl_recv` block in your `default.vcl` file:

```
include "pagespeed-requirement.vcl";
```

### Deployment scenario 1

The example `pagespeed-requirement.vcl` from above will split user-agents in to five groups, each with different support for capabilities such as WebP, Lazy load images and different type of screensize. Be aware that this will also split Varnish Cache  up in to 5 different buckets to ensure user-agents with different capabilities are served only from the bucket that stored assets corresponding to those capabilities. This is great for high traffic sites despite the splitting of the cache. High traffic should ensure the caches are populated while also receiving the benefits of user-agent specific optimisations.

### Deployment scenario 2

If you would prefer higher Varnish Cache  hit rates as opposed to user-agent specific optimisations, then you should remove all the logic under `sub pagespeed_capability_detection` in `pagespeed-requirement.vcl` and replace it with a single line

```
set req.http.PS-CapabilityList = "fully general optimizations only";
```

This will only enable optimisations which will work on all user-agents and will not split the cache up in to multiple buckets. This is better for low traffic sites and/or if you wish to maximise cache hit rate, which in turn minimises load on the origin.

### Deployment scenario 3

This is in addition to scenario 1 or 2. Pagespeed also has an option called IPRO(In place resource optimisations) See [documentation](https://modpagespeed.com/doc/system#ipro). This allows pagespeed to optimise assets that are linked to from Javascript which does not support standard Pagespeed renamed assets. This option is enabled by default since Pagespeed version 1.9.32.1.

When IPRO is enabled, the URL for an asset such as **123.jpg** will not be changed to Pagespeed URLs such as **123.jpg.pagespeed.ce.3VC2ZiyLDo.jpg** in Javascript and will maintain the URL **123.jpg**. If the resource has not finished optimising, Pagespeed will send an **s-maxage=10** value in the Cache-Control header so Varnish Cache will only keep that asset for 10 seconds then recheck with Pagespeed if that asset is requests after 10 seconds. Once the asset is optimised, Pagespeed will send a much longer Cache-Control header so Varnish Cache will store the optimised asset for longer.

If you are experiencing issue with Javascript linked resources, you can turn off IPRO by using the following code in **server.conf**

```nginx
pagespeed InPlaceResourceOptimization on;
```