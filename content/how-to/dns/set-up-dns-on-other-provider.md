---
title: Use section.io with outside DNS.
description: Guide for changing your existing DNS to go live with section.io.
keywords: DNS, DNS records, DNS hosting, bare domain, zone apex, naked domain and root domain
aliases:
  - /hosted-dns/

---

To continue hosting with your current provider you'll need to go to your domain name provider and replace any existing 'CNAME' or A records with the 'CNAME' we've provided for you in your account. After making the DNS change (and allowing time for your DNS ttl expiry) you will start to see metrics showing in the Production environment for your site.

If your site doesn’t send the right HTTP headers or you have other things preventing the site from caching (like [client-side cookies]) then you can modify the way your reverse proxies interact with your site using section.io’s local development environment.

Follow the steps below to create a DNS (Domain Name System) record that directs traffic to your website via section.io.

1.  Remove any existing the CNAME or A record for your site.
2.  Add the CNAME record “your.site.name.here.c.section.io.” to the DNS configuration for your site name. To confirm this record, visit your overview page and click on DNS.

Note: DNS changes may take some time.

To stay with section.io, don’t remove or change the DNS record, even after verification succeeds. Once you have changed your DNS, please ensure you've setup [HTTPS](/docs/setup-https).

Having trouble? Contact your domain name provider directly for further assistance.
