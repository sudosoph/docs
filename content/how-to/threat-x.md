---
title: ThreatX WAF
description: Using the Threat X Web Application Firewall (WAF) inside section.io.
keywords: WAF, web application firewall, security, Layer 7 attacks
aliases:
  - /threat-x/

---

Because section.io is the only CDN that allows you to choose the reverse proxies that run in your stack, you can choose to bring the Web Application Firewall created by the security experts at Threat X into your web site's delivery infrastructure.

## About Threat-X

Threat-X is a reverse proxy that inspects and adapts to web site attacks that can infiltrate your web site and cause problems for your business.

Because Threat X doesn't simply rely upon statically defined rule sets like old WAFs (and CDNs based on those old WAFs) you can expect a higher degree of security.

This also means that there's a lower cost to maintain that level of security, because the adaptive nature of the platform means that you don't need to spend time and money on in-house security experts to keep your rules up to date.

Of course, you can still rely on Threat X for virtual patching, which is one of the most sought after features in a WAF.

## Setting up Threat X in section.io

You can add Threat X to your section.io setup Content Delivery Grid very quickly. There are a few phases to this process.

When creating your application you will want to select the **Threat-X** on the second page of the setup process.

{{% figure src="/docs/images/select-threatx.png" %}}

You will then want to follow the steps below:

1. Contact section.io support. Our engineers will organize an account with Threat X. The section.io team will provide you with credentials to access the Threat X management console.
1. Threat X will then be running on your site, inspecting your traffic. This period allows the system to form a baseline of "good traffic".
1. After a while, look at the threats that are hitting your site. You'll want to look for any false positives - this is where Threat X has detected an attack that could be a result of bugs in your site.
1. Change Threat X from inspection mode into blocking mode.

## Other things to note

Naturally, you can see when Threat X is on your site by looking at the Overview page in Aperture, section.io's management console.

Also, our powerful Kibana interface will show you all the HTTP requests made in the Content Delivery Grid, and this also includes the HTTP traffic passing throught the Threat X console.
