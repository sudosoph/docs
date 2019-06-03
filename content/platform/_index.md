---
title: "Platform"
description: ""
weight: 120
aliases:
  - /topic-guides/platform-monitoring/
  - /platform/overview/
---

| Component | Function | Description  | Links |   |
|:--|:--|---|---|---|
| Aperture | Dashboard | Section web portal to manage the users, accounts, applications, environments, domains and logging. | [Overview](/docs/platform/aperture/) |   |
| User | User management | Users can manage accounts, environments, applications etc. |   |   |
| Account | Organization | Users can be associated with one or many accounts. Accounts represent organizations like businesses. | [How-to](/docs/platform/how-tos/account/), [Reference](/docs/platform/reference/account-management/)  |   |
| Application | Website configuration | Configuration for your content-delivery and proxy setup, monitors HTTP traffic from the client through your proxy stack to your origin and back again, and manages the state of your website content. |   |   |
| Environment | Staging, Development, Production etc  | An application supports multiple environments like staging, development, and production on git branches within the application repository. Each of these environments can have different proxy configurations. |   |   |
| Domains | www.yourdomain.com | Each application can also have multiple domains for any number of websites with the same proxy configuration setup, greatly simplifying the management process for many similar sites. |   |   |
| Edge Proxy | Ingress/Edge Proxy | Every application proxy stack begins with the Edge proxy. |   |   |
| Proxy | Reverse Proxy | A Proxy or "Reverse Proxy” is the server handling requests within each environment e.g. Varnish Cache. |   |   |
| Proxy Stack | Chained Proxies | Where more than one Proxy is “chained” together we refer to this as a Proxy Stack. |   |   |
| Support | Customer Engineers | Section is a managed platform and Customer Engineers are ready to support. |   |   |

### Table of contents

{{% children depth="3" %}}
