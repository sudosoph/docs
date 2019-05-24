---
title: Serve stale content while the backend is offline
description: How to configure Varnish Cache to serve stale content
keywords: CDN, content delivery network, performance, stale content
aliases:
  - /origin-shield/
  - /stale-content/
  - /varnish-grace/
  - /how-to/varnish-cache/configure-varnish-cache-to-serve-content-while-the-backend-is-offline/
---

Configuring Varnish Cache to serve stale content is very useful for when your origin crashes. This behavior is achievable when running Varnish Cache as a reverse proxy within the Section Content Delivery Grid.

#### Prerequisites

Make sure you have an [account on Section](https://www.section.io/sign-up/), and have selected Varnish Cache to run in your proxy stack.

_Note: This guide will be using VCL 4 syntax, so if you are interested in VCL 3 syntax please reach out to us at support@section.io._

## Set up

_This guide assumes you know basic VCL and the flow of HTTP traffic through Varnish Cache._

### Step 1 - `vcl_backend_response`

We will need to add logic within `vcl_backend_response` to begin the process for serving stale content.

You will need to check for the backend response status, from your origin server, for any "5XX" errors and return `abandon`. You will also need to set the grace period of the object.

    sub vcl_backend_response {
        if (beresp.status >= 500 && beresp.status <= 599) {
            return (abandon);
        }

        ...

        set beresp.grace = 24h;
    }

### Step 2 - `vcl_synth`

In `vcl_synth` we need to check the `resp.status` for a 503 code as this is the code set by `return(abandon)`. If this is the case, we will utilize `restart` to run through the VCL code again.

    sub vcl_synth {
        if (resp.status == 503 && req.http.sie-enabled) {
            unset req.http.sie-enabled;
            return (restart);
        }

        ...
    }

### Step 3 - `vcl_hit`

This part is where we actually tell Varnish Cache to serve stale content is the restart count is greater than 0 and the grace period plus the time to live is greater than 0. If both cases match, we serve the stale content.

    sub vcl_hit {
        if (obj.ttl < 0s && obj.ttl + obj.grace > 0s) {
            if (req.restarts == 0) {
                set req.http.sie-enabled = true;
                return (fetch);
            } else {
                set req.http.sie-abandon = true;
                return (deliver);
            }
        }

        if (obj.ttl >= 0s) {
            return (deliver);
        }

        return (fetch);
        # Varnish Cache 5 needs to not fetch -> return (miss);
    }

## Testing

You can test this logic, by enabling maintenance mode on your server which will serve some type of 500 error. Keep in mind if the request is not in the cache before your origin goes down, the end user will still receive an error.
