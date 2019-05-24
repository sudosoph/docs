---
title: Networks and POPs
description: How to construct your own content delivery network using Section templates.
keywords: CDN, content delivery network, AWS, AWS Cloudformation, AWS Cloudformation templates, AWS Route 53, Route 53
aliases:
  - /networks/
  - /reference/networks/

---

Section offers a network of highly availabile, redundant, multi-datacenter and globally distributed proxy containers to form a content delivery network like edge.

If you do not wish to use this network you can construct your own network very simply. Section publishes AWS Cloudformation templates that can be booted into any AWS location, or any service provider with a Cloudformation compatible service. Booting this Cloudformation template will create various resources to create a highly available, redundant and auto-scaling point of presence that can be joined with other points of presence using your favourite routing techniques. AWS’ Route 53 Latency Based records are very useful for presenting multiple Section edge location as a globally distributed network.

To create your network just let our helpdesk know and they will provide you with the authentication information you need.
