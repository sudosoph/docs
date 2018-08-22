---
title: Varnish Cache  and section.io  
description: A high level overview of how section.io runs Varnish Cache 
keywords: [Varnish,caching]

---
### How Varnish Cache  works on section.io

At every opportunity, the implementation of Varnish Cache on the section.io platform has been designed to be as close as possible to how it would be if you had installed Varnish Cache yourself locally.

section.io uses the official Varnish Cache distributions published by [Varnish Cache ]. section.io does not use custom-compiled builds of Varnish Cache.

Varnish Cache is started, listening on port 80. Varnish Cache will be initialized with the VCL found in the default.vcl file in the corresponding subdirectory of your section.io application repository.

Assuming Varnish Cache is the first proxy in your proxy stack, Varnish Cache will receive connections from the section.io TLS Offload Proxy with two additional HTTP request headers, X-Forwarded-For containing the downstream client IP address and any intermediate proxy IP addresses, and also X-Forwarded-Proto which will specify either http or https depending on the protocol with which the downstream client connected.

Issuing cache invalidation requests to Varnish Cache is performed by sending a ban command to the Varnish Cache management interface. section.io accepts any valid Ban expression and passes it to Varnish Cache unaltered. We also provide some convenience tools to help
with removing particular urls from the cache, see our [Clearing the cache documentation](/docs/clearing-the-cache/) for more details.

Requesting the Varnish Cache Log simply executes varnishlog for each Varnish Cache instance and return the results.

Varnishncsa is also running, logging request and response details, including cache effectiveness. This data is used to drive the charts seen in Aperture.
