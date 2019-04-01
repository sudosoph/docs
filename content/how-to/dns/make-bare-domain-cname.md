---
title: Make bare domain CNAME records
description: Guide for creating CNAME records for bare domains.
keywords: DNS, DNS records, DNS hosting, bare domain, naked domain and root domain
aliases:

---

Bare Domains are DNS records without www, also called Zone Apex, Naked Domain and Root Domain. To go live on Section you need to setup a CNAME record pointing to the Section platform.

Within the DNS system, you cannot use a CNAME for your bare domain (e.g. domain.com) and then define additional resource records for the same zone.

This means that if you were to setup a CNAME on your bare domain you would get unpredictable results and most likely break other records that also exist at the bare domain - such as MX records required for your email to work.

We recommend using Section Hosted DNS so that you do not need to create a CNAME for your bare domain, as your DNS is already hosted with us. If you want to continue to use your current provider, there are 2 work arounds:

1.  Switch to running your site on “www”. This means that users will type in www.domain.com to get to your website. You would setup a HTTP 301 redirect from the bare domain to the www version so that users (and SEO) are automatically redirected to the “www” site.
2.  Use a DNS provider that supports a special `ALIAS`/`ANAME` record type at the bare domain.

For technical background on CNAME’s and the bare domains see: [RFC 1034 section 3.6.2](https://tools.ietf.org/html/rfc1034#section-3.6.2).
