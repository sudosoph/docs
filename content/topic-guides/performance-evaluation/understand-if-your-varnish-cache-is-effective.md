---
title: Understand if your cache is effective
description: Guide for evaluating your website performance and how to use Section to make improvements.
keywords: cache, https, website performance, page speed, webpage speed, website security, content delivery network, CDN
weight: 1
---

**What is it?:** How effectively customer requests are being answered by the cache. A hit means that the request was answered by the cache. A miss means that the request went to the cache but could not answer the request. A pass means that the request didn’t look at the cache to answer the request. The goal is to increase Hit % and decrease Miss and Pass %. A good starting goal would be 50% Hit.

**Why do you care?:** When a customer request is answered by the cache, the request did not need to be answered by your website server. This improves page load time for your users which can increase revenue and decreases work required by your servers which reduces cost.

**How do you see it?:** This is the first chart we show you on the Section dashboard. For the Bootcamp application, the url is **[here](https://aperture.section.io/account/1/application/1/environment/Production/overview)**.


{{% figure src="/docs/images/varnish-cache-usage-metrics.png" %}}

For more detailed information, such as the absolute number of requests and size of those requests, you can view Trending Metrics **[here](https://aperture.section.io/account/1/application/1/environment/Production/metrics##1)**.

