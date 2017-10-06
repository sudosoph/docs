---
title: Section.io at a Glance
description: Training area, section.io platform overview.
keywords: section.io, training, platform overview
weight: 1
aliases:
  - /training-platform-overview/
  - /tutorials/overview/

---

Here’s an informal overview of how to use section.io's Application Edge to deploy a fast Content Delivery Network to your website.

The goal of this document is to give you enough technical specifics to understand how section.io works, but this isn’t intended to be a tutorial or reference – but we’ve got both! When you’re ready to engage your website, you can [start with the tutorial]({{< ref "tutorials/developer-workflow.md" >}}) or [dive right into more detailed documentation]({{< relref "topic-guides/_index.md" >}}).

## Application Edge Overview

An Application Edge is a system that lets you control how your application delivers content to the destination.

{{<mermaid align="left">}}
graph LR;
    A[Web Browser] -->|"HTTP(S)"| B(section.io)
    B -->|"HTTP(S)"| C[Application Server]
    C --> D[Database]
    style B fill:#f9f
{{< /mermaid >}}

When a web browser connects to your site, they actually connect to section.io. Section.io will talk to your servers to get content, and deliver it to your users.

Each configuration is built of a number of modules (Which are actually Docker containers running as reverse proxies under the hood), you get to pick which modules you want to run in your configuration.

section.io can work for you as a normal CDN, but it can do much more. Let's see [how section.io compares to a CDN]({{< relref "tutorials/overview/like-a-cdn.md" >}}).