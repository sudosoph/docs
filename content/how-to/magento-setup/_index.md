---
title: Set up Magento on section.io
description: Guide for evaluating your website performance and how to use section.io to make improvements.
keywords: cache, https, website performance, page speed, webpage speed, website security, content delivery network, CDN
weight: 10
---

Magento is a popular eCommerce platform that needs extensive performance tuning.

Section.io delivers huge speed improvements to all versions of Magento through full page caching (HTML and static assets) using Varnish Cache.

## Different Approaches for Different Magento Versions

[For Magento 2.x]({{< relref "topic-guides/magento-performance/magento-2/_index.md" >}}), support for Varnish to cache page content is integrated into Magento. section.io offers ["Instant Global Cache"](#magento-2-extension), an extension that will let you get setup with Varnish and distribute it globally on section.io’s CDN directly from the Magento Admin portal.

[For Magento 1.x](#magento-19-and-earlier), Varnish support is provided by HTML Streaming, Anonymous user caching or the [free Turpentine Magento extension]
