---
title: IP Restrictions
description: How to block bots or spammers from your website to improve website performance. How to create a blacklist to block IP addresses.
keywords: bot, bot blocker, spammers, crawlers, website performance, webpage speed, website security, content delivery network, CDN
aliases:
  - /blocking-requests/

---
Blocking Requests
=================

If visitors, crawlers, or spammers are degrading the performance of your site, it may be appropriate to block these from accessing your website content. Rather than letting these requests be processed by section.io and your origin server, you can block them as they enter section.io.

## By requesting IP address

Requests for an application can be blocked by IP address or routing prefix.

The simplest interface to view/edit these values is available via "Configuration" > "Restrictions".

![/assets/images/docs/request-restrictions.png](/assets/images/docs/request-restrictions.png)

For each requesting IP you wish to block requests from, click the "Add Another" button on the page and enter the address or range that you wish to block to the "IP address/CIDR block" text box. Once complete, press the "Save" button.

Within a few seconds section.io will be blocking requests from your blacklist.

## Format of the `ip_blacklist` field in ``section.config.json``

The IP blacklist is stored in the ``section.config.json`` file in the root of the git repository for your web site. You can view this by going to <https://aperture.section.io/>, selecting your site and then going to the "Repository" page.

The `ip_blacklist` field is applied to an environment (living at the same level as `origin` ). It is a list (array) of IP v4 addresses and/or [CIDR notation](https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing#CIDR_notation) routing prefixes.

The request blacklist is specified via a `ip_blacklist` property inside one of the `environment` objects, for example:

    {
        "proxychain": [],
        "environments": {
            "Production": {
                "origin": {
                    "address": "origin.example.com"
                },
                "ip_blacklist": [
                    "192.0.2.1",
                    "198.51.100.0/24"
                ]
            },
            "Development": {
                "origin": {
                    "address": "origin.example.com"
                }
            }
        }
    }

This would stop all requests from the IP address of 192.0.2.1, and all requests from any IP address in the range of 198.51.100.0-198.51.100.255 progressing any further and returning a 403 Forbidden HTTP status response ([custom response](../http-error-messages/#custom-error-messages) if provided).
