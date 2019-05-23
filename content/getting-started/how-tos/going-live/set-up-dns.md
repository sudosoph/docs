---
title: Set up DNS
description: A step-by-step guide on how to get started with Section CDG.
keywords: guide, getting started, website performance, page speed, webpage speed, website security, content delivery network, CDN
weight: 2
aliases:
  - /tutorials/activate-section-io/set-up-dns/
---

To get your users to connect to Section servers you need to make updates to DNS.

This DNS change will point the traffic to Section servers.

{{% notice note %}}
This tutorial works with a domain name that contains a prefix, like the **www.** prefix in **www.section.io**.

If you are working with a site that doesn't have a prefix please look at [bare domain support with Section]({{< relref "topic-guides/dns/bare-domains/_index.md" >}}).
{{% /notice %}}

## Set up the CNAME record

1. In the management console, click **DNS** in the left hand menu.
![DNS Menu in Management Console](/docs/images/screenshots/menu/highlight-dns-menu-option.png?height=80px)
1. Copy the target CNAME record provided by Section.
![CNAME value in Management Console](/docs/images/screenshots/dns/cname.png?height=80px)
1. Go to your DNS Hosting Provider's configuration page and replace your existing CNAME record with the one from the previous step.

{{% notice info %}}
If there is an AAAA IPv6 record setup for the domain, it will need to be removed as Section platform uses IPv4.
{{% /notice %}}

4. Back in the management console, click **Verify**. You'll see a message that your DNS is correctly configured.

{{% notice info %}}
If you have any trouble, consider looking at our [HTTPS Troubleshooting guides]({{< relref "how-to/dns/check-your-current-dns-setup.md" >}}).
{{% /notice %}}

[Let's proceed to step 3, enabling automatic SSL]({{< relref "getting-started/how-tos/going-live/enable-automatic-ssl.md" >}})
