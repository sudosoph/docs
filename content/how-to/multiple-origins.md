---
title: Multiple Origins
description: Set up section.io so that it can deliver content from multiple origin servers
keywords: multiple origins, multiple upstreams, origin address, origin server, origin, cache, cached data, content delivery network, CDN
aliases:
  - /multiple-origins/

---
# How to use Multiple Origins to Deliver Content

When you have a single origin or upstream server, your section.config.json file will contain something like this:

    "origin": {
        "address": "origin.example.com",
        "host_header": "override.example.com"
    }

However, there are cases where it is useful to have two different upstream services, perhaps you want to make two backend systems appear on the same domain.

section.io supports multiple origins in a single configuration which allows you to compose multiple backends into one domain.

## Adding More than One Origin Server

Adding another backend service or origin to your configuration involves the following steps:

1. Define the Alternate Origins in your `section.config.json` in your application's git repository.
1. Configure your proxy to consume the defined Alternate Origin.

### Defining Alternate Origins

Working from the case above, we can add a second origin by adding an `alernate_origins` block.

Here's an example of adding `origin2.example.com` to `section.config.json`

    "origin": {
        "address": "origin.example.com",
        "host_header": "override.example.com"
    },
    "alternate_origins": {
        "origin2_example_com": {
            "address": "origin2.example.com",
            "host_header": "origin2.example.com"
        }
    }

Note that the alternate origin definition is a named object. We advise naming the alternate origin similarly to the `address` field.

The `address` field tells section.io the IP address or DNS name that it should connect to. You will also want to specify the `host_header` that will be used on the HTTP requests that section.io makes to this upstream.

### Using the Alternate Origin

To tell section.io that a HTTP request should be served by that origin, you need to add a HTTP Request Header to the request as it is made from your configuration to our egress system.

Here's an example using Varnish VCL that you could incorporate into your `default.vcl`.

    sub vcl_recv {
        if (req.url ~ "sitemap.xml" ) {
            set req.http.section-origin = "origin2_example_com";
        }
    }

This `if` statement would be included in your existing `vcl_recv` function.

This example says "If the requested URL contains sitemap.xml then add a new header, `section-origin`, with the value `origin2_example_com`".

Now, when section.io receives a request for sitemap.xml it will add the HTTP request header, which signals the egress system to contact your other upstream backend.
