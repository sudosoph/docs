---
title: Load Balancing
description: Use VCL to configure a layer 7 load balancer.
keywords: content delivery network, CDN, load balancer, VCL, HTTP
aliases:
  - /load-balancer/

---

Load balancing distributes traffic across origin servers so that your website can handle more visitors at once and visitors are always directed to the best server for their requests. If one of your servers is not responding or a network is experiencing an outage, you can automatically redirect traffic to the closest functioning server so that your site stays up for all visitors.

Technical details
=================

section.io provides a layer 7 load balancer to immediately route HTTP requests based on rules you set that can include request location, device or browser type, and cookies or headers. In addition, you can utilize our load balancer to randomly distribute requests to your origin servers so that no one server is overloaded. 

section.io has uses VCL to create common load balancing scenarios that can be easily set up in your section.io portal by editing your VCL files.

Examples
========

## Static asset origin

Below is an example of how to configure your Content Delivery Grid to direct all requests for static assets to a separate origin.

Prerequisites:
* section.io account
* section.io application running Varnish
* A separate origin for your static assets (e.g. S3 bucket)

In your `default.vcl` file you can set a header that's recognizable in section.io's `last-proxy` to determine which origin address and host header to make the request with. So you are going to need to define that origin first in your `section.config.json` file located in the root of your applications git repo. You will be adding a key called `alternate_origins` under `environments.Production`.

### `section.config.json`
    
    ...
    "environments": {
        "Production": {
            "origin": {
                "address": "100.100.100.100"
            },
            "alternate_origins": {
                "assets_example_com_100_100_100_120": {
                    "address": "100.100.100.120",
                    "host_header": "assets.example.com"
                },
            }           
        },
    ...

### `default.vcl`

Next we need to tell Varnish when to use and how to define this origin for static assets. We will be using the name we defined in your `section.config.json`.

    sub vcl_recv {
        ...
        if (req.url ~ "/some-unique-url-for-static-assets") {
            set req.http.section-origin = "assets_example_com_100_100_100_120";    
        }
        ...
    }

*Note:* If your origin only accepts traffic on port 80 and you are requesting this resource over HTTPS, you will need to set the `X-Forwarded-Proto` to `http`.

    set req.http.X-Forwarded-Proto = "http";

### Overview

This use case is especially helpful if you are requesting your static assets on the same domain (e.g. `www.example.com`) to utilize HTTP/2, but want to take the load off your default origin when requesting static assets. section.io handles all the internals of actually making the request to your `assets` origin and all you have to do is configure your reverse proxy setup in your git repo!

## More examples coming soon

section.io’s load balancing allows you to:

* Direct traffic to different servers based on their response states so that users don’t get 502 errors.
* Serve unique content to different geographic locations, such as offers only available in certain regions or pages in different languages.
* Serve unique content to different user browsers, such as mobile-optimized sites for phone or tablet browsers.
* Create unlimited custom rules to route traffic based on its characteristics.

*Note:* If you have a specific request, please email support@section.io and we will get the docs up ASAP!




