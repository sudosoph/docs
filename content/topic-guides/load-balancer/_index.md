---
title: Load Balancing
description: Use VCL to configure a layer 7 load balancer.
keywords: content delivery network, CDN, load balancer, VCL, HTTP
aliases:
  - /load-balancer/
---

Load balancing distributes traffic across origin servers so that your website can handle more visitors at once and visitors are always directed to the best server for their requests. If one of your servers is not responding or a network is experiencing an outage, you can automatically redirect traffic to the closest functioning server so that your site stays up for all visitors.

## Technical details

Section provides a layer 7 load balancer to immediately route HTTP requests based on rules you set that can include request location, device or browser type, and cookies or headers. In addition, you can utilize our load balancer to randomly distribute requests to your origin servers so that no one server is overloaded.

Section uses VCL to create common load balancing scenarios that can be easily set up in your Section portal by editing your VCL files.

## Examples

{{% children description="true" style="h3" %}}

### More examples coming soon

section.io’s load balancing allows you to:

* Direct traffic to different servers based on their response states so that users don’t get 502 errors.
* Create unlimited custom rules to route traffic based on its characteristics.

*Note:* If you have a specific request, please email support@Section and we will get the docs up ASAP!
