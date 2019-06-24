---
title: Understanding Cache Effectiveness
description: Guide for evaluating your website performance and how to use Section to make improvements.
keywords: cache, https, website performance, page speed, webpage speed, website security, content delivery network, CDN
weight: 1
aliases:
  - /topic-guides/performance-evaluation/understand-if-your-varnish-cache-id-effective/
---

**Understanding Cache**<br/>
Caching is how effectively customer requests are being answered by the cache. A cache hit means that the request was answered by the cache. A miss means that the request went to the cache but could not answer the request. A pass means that the request didn’t look at the cache to answer the request. The goal is to increase Hit % and decrease Miss and Pass %. A good starting goal would be 50% Hit.

**Why is it important?**<br/>
When a customer request is answered by the cache, the request did not need to be answered by your website server. This improves page load time for your users which can increase revenue. Furthermore, caching decreases work required by your servers thus reducing cost.

**Where can I see my cache information?**<br/>
A cache information chart is the very first piece we show you on the Section dashboard. It displays all cache information about your website application. Below is an example for the Bootcamp application.

![Cache Chart](/docs/images/cache-chart.png?height=510px)

For more detailed information, such as the absolute number of requests and size of those requests, log in to your aperture account and view Trending Metrics **[here](https://aperture.section.io/account/1/application/1/environment/Production/metrics##1)**.

