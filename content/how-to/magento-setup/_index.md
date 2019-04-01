---
title: Set up Magento on Section
description: Guide for evaluating your website performance and how to use Section to make improvements.
keywords: cache, https, website performance, page speed, webpage speed, website security, content delivery network, CDN
weight: 10
---

Magento is a popular eCommerce platform that needs extensive performance tuning.

Section delivers huge speed improvements to all versions of Magento through full page caching (HTML and static assets) using Varnish Cache .

## Different Approaches for Different Magento Versions

[For Magento 2.x]({{< relref "how-to/magento-setup/magento-2/_index.md" >}}), support for Varnish Cache to cache page content is integrated into Magento. Section offers ["Instant Global Cache"](#magento-2-extension), an extension that will let you get setup with Varnish Cache and distribute it globally on Section’s CDN directly from the Magento Admin portal.

[For Magento 1.x]({{< relref "how-to/magento-setup/magento-1/_index.md" >}}), Varnish Cache support is provided by HTML Streaming, Anonymous user caching or the [free Turpentine Magento extension]
