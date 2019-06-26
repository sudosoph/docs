---
title: Discover your quick Cache Wins
description: Guide for evaluating your website performance and how to use Section to make improvements.
keywords: cache, https, website performance, page speed, webpage speed, website security, content delivery network, CDN
weight: 2
aliases:
  - /topic-guides/performance-evaluation/discover-your-quick-cache-wins/
---

Your website has several different types of content that can be cached: HTML, Images, CSS, and JS are the main file types for consideration.

* HTML is the set of instructions required to load the page.
* Images are any images or icons you load.
* CSS is the style instruction for how to load images, text, and content on the page.
* JS is small scripts your browser will run when it is instructed to by the HTML.

You can view your hit rates, volume of requests, and time to serve for each of these different content types.

**Why is it important?** <br/>
Understanding which types are being requested the most, require the most time to serve, and are being cached most frequently helps you understand where your quick wins are to get started optimizing your cache configurations.

Most of the time, images and CSS will be the easiest place to boost cache rate. HTML, on the other hand, can be more difficult to cache successfully but often provides the largest  performance and scalability wins as the hit rate increases.

**How do I see my wins?** <br/>
There are two dashboards in Grafana under `Real Time -> Monitoring` to understand content type caching.

The **request performance** dashboard shows throughput and time to serve by status. You can access this for Bootcamp **[here](https://aperture.section.io/account/1/application/1/grafana-web)**.

![HTTP Response by Asset Type](/docs/images/Performance Techniques/HTTP-response-by-asset-type-metrics.png?height=200px)

The **asset cache hit rates** dashboard shows the hit rate by content type. You can access this for Bootcamp **[here](https://aperture.section.io/account/1/application/1/grafana-web)**.

![Hit rate for HTTP requests](/docs/images/Performance Techniques/http-cache-hit-rate-metrics.png?height=350px)
