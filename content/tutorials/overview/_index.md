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

The goal of this document is to give you enough technical specifics to understand how section.io works at a high level. When you’re ready to engage your website, you can [start with the activation tutorial]({{< relref "tutorials/activate-section-io/_index.md" >}}) for thorough, step-by-step instructions on setting up your website on section.io or [dive right into more detailed documentation]({{< relref "topic-guides/_index.md" >}}) for advanced technical details.

## Application Edge Overview

An Application Edge is a system that lets you control how your application delivers content to the client.

{{<mermaid align="left">}}
graph LR;
    A[Web Browser] -->|"HTTP(S)"| B(section.io)
    B -->|"HTTP(S)"| C[Application Server]
    C --> D[Database]
    style B fill:#f9f
{{< /mermaid >}}

Once you have set up your website on section.io, all requests for your website URL are rerouted to a section.io server before passing on to your origin server. The advantage of this arrangement is that all HTTP requests to your origin pass through a collection of [reverse proxies]({{< relref "tutorials/activate-section-io/_index.md" >}}) called a **configuration**. 

A section.io **configuration** is a collection of reverse proxies that can be hand-tailored to the needs of your website. Have lots of requests for static assets like images and CSS files weighing down your origin server? We have a proxy to deliver assets from cache. Dealing with bots and DDoS attacks? We have Web Application Firewall proxies to block them before they even reach your origin server. Need images to be dynamically optimized for different clients? We have a proxy for that. All of these and more can be mixed and matched to perfectly serve your website.

The section.io platform can work for you as a normal CDN, but it can do so much more. Let's see [how section.io compares to a traditional CDN]({{< relref "tutorials/overview/like-a-cdn.md" >}}).