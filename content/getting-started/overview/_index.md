---
title: Core Concepts
description: Training area, Section platform overview.
keywords: Section, training, platform overview
weight: 1
aliases:
  - /training-platform-overview/
  - /tutorials/overview/

---

Here’s an informal overview of how to use Section Application Edge to deploy a fast Content Delivery Network to your website.

The goal of this document is to give you enough technical specifics to understand how Section works at a high level. When you’re ready to engage your website, you can [start with the activation tutorial]({{< relref "/getting-started/tutorials/going-live/_index.md" >}}) for thorough, step-by-step instructions on setting up your website on Section or dive right into more detailed documentation for advanced technical details.

## Application Edge Overview

An Application Edge is a system that lets you control how your application delivers content to the client.

**Before Section**
{{<mermaid align="center">}}
graph LR;
    A[Web Browser] -->|"HTTP(S)"| B(Application Server)
    B -->|"HTTP(S)"| C[Database]
{{< /mermaid >}}

**After Section**
{{<mermaid align="center">}}
graph LR;
    A[Web Browser] -->|"HTTP(S)"| B(Section)
    B -->|"HTTP(S)"| A
    B -->|"HTTP(S)"| C[Application Server]
    C -->|"HTTPS(S)"| D[Database]
    style B fill:#47dd47
{{< /mermaid >}}

Once you have set up your website on Section, all requests for your website URL are rerouted to a Section server before passing on to your origin server. The advantage of this arrangement is that all HTTP requests to your origin pass through a collection of [reverse proxies]({{< relref "/getting-started/overview/proxy-options.md" >}}) and modules called a **configuration**. A Section **configuration** is a collection of reverse proxies and modules that can be hand-tailored to the needs of your website.

Have lots of requests for static assets like images and CSS files weighing down your origin server? We have a module to deliver assets from cache. Dealing with bots and DDoS attacks? We have Web Application Firewall modules to block them before they even reach your origin server. Need images to be dynamically optimized for different clients? We have a module for that. All of these proxy options and more can be mixed and matched to perfectly serve your website.

The Section platform can work for you as a normal CDN, but it can do so much more. Let's compare how Section is [Like a CDN]({{< relref "getting-started/overview/like-a-cdn.md" >}}).
