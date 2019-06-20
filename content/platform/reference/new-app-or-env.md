---
title: Adding a New Domain to Section
description: Guide to choosing a new environment, new application, or adding a domain to an existing environment.
keywords: reverse proxy, CDN
---

When you want to add a domain to Section, it is sometimes unclear where that domains should fit into the [account](/docs/platform/account/), [application](/docs/platform/application/), and [environment](/docs/platform/environment/) structure. This guide will help you decide whether it is most appropriate to create a new application, create a new environment, or add a new domain to an existing environment.

#### My new website is a Staging/uat site for a Production site that I have running or want to run on Section.
The purpose of Section's application-environment structure is to streamline the configuration testing and promotion process. As far as this scenario is concerned (with respect to configuration), the definition of an application is a git repository, and the definition of an environment is a branch within that repository. This makes promoting changes from a Staging environment to a Production environment as simple as a git merge and push. If you want to add a staging site to Section, the best solution for most use cases is to add a new environment to the same application.

**Summary**: we recommend adding a new staging site to an existing application as a new environment.

#### I want to add a new website to Section that is similar to one or more sites I already have running on Section.

Section maintains running containers for each module in your stack in each point of presence on a per environment basis. That means that if you assign www.example.com and www.demonstration.com to the same Section environment, the same containers will handle traffic for both sites. If you have a new site that has similar needs and configuration patterns to a site that is already running on section, then assigning both domains to the same environment greatly simplifies the overhead of managing them. When two sites have the same URI patterns for resources and routes that should and should not be cached (i.e. both are set up for HTML caching and use the same routes for admin functionality or checkout), then it often makes sense to assign both of these domains to the same environment.

It is even possible to assign two domains to the same environment when the websites are running on different origin servers. Section supports routing requests to [alternate origins](docs/platform/environment/how-tos/multiple-origins/) based on the incoming request's hostname or other criteria.

If the websites are mostly the same but have a few important differences, you can manage this as well within a single configuration by building hostname specific logic into your Varnish Cache Configuration like so:

if (req.url ~ "/admin" && req.http.host == "www.example.com") {
  // Take action A
} else if (req.url ~ "/admin" && req.http.host == "www.demonstration.com") {
  // Take action B
}

**Summary**: If two websites have similar needs, they should be mapped to the same environment.

#### I want to add a new website that is very different from all the sites I have running on Section. 
