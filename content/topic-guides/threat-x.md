---
title: Threat X WAF
description: Using the Threat X Web Application Firewall (WAF) inside Section.
keywords: WAF, web application firewall, security, Layer 7 attacks
aliases:
  - /threat-x/

---

Because Section is the only CDN that allows you to choose the reverse proxies that run in your stack, you can choose to bring the Web Application Firewall created by the security experts at Threat X into your web site's delivery infrastructure.

## About Threat-X

Threat-X is a reverse proxy that inspects and adapts to web site attacks that can infiltrate your web site and cause problems for your business.

Because Threat X doesn't simply rely upon statically defined rule sets like old WAFs (and CDNs based on those old WAFs) you can expect a higher degree of security.

This also means that there's a lower cost to maintain that level of security, because the adaptive nature of the platform means that you don't need to spend time and money on in-house security experts to keep your rules up to date.

Of course, you can still rely on Threat X for virtual patching, which is one of the most sought after features in a WAF.

## Setting up Threat X in Section

You can add Threat X to your Section setup Content Delivery Grid very quickly. There are a few phases to this process.

When creating your application you will want to select the **Threat-X** on the second page of the setup process.

{{% figure src="/docs/images/select-threatx.png" %}}

You will then want to follow the steps below:

1. Contact Section support. Our engineers will organize an account with Threat X. The Section team will provide you with credentials to access the Threat X management console.
1. Threat X will then be running on your site, inspecting your traffic. This period is referred to as "baselining" and allows the system to form a behavioral map of what good, normal traffic looks like for your website.
1. After a while, look at the threats that are hitting your site with a representative from Threat X. Together you will assess the results of baselining mode and look for any false positives - this is where Threat X has detected an attack that could be a result of intended behavior or bugs in your site.
1. Change Threat X from inspection mode into blocking mode.

## Other things to note

Naturally, you can see Threat X is on your site by looking at the Overview page in Aperture, Section management console.

The Section platform writes a log for each HTTP request that passes through Threat X. These will be available in our powerful Kibana interface alongside logs from all of the other proxies in your stack.
