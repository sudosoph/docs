---
title: Block a request 
description: Guide to block a request using Varnish Cache.
keywords: varnish, Varnish Cache, block, 403

---

## Overview

Varnish Cache allows you to create synthetic HTTP responses with the use of [vcl_synth](https://varnish-cache.org/docs/trunk/users-guide/vcl-built-in-subs.html#vcl-synth). This can be used to deliver a [403 forbidden](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/403) status code.

## VCL syntax

Below is an example of how to deliver a synthetic 403 response using VCL syntax 4.0. This example will deliver a 403 response if the request matches the URI path "/admin"

{{< highlight js >}}
sub vcl_recv {
    if (req.url ~ "/admin") {
        return (synth(803, "Forbidden"));
    }
}

sub vcl_synth {
    if (resp.status == 803) {
        set resp.status = 403;
        return (deliver);
    }
}
{{< / highlight >}}

{{% notice note %}}
This is just an example of how to block a request using Varnish Cache. You can utilize many different patterns to block a request. E.g. check for user agents, country codes, IP addresses, etc.
{{% /notice %}}
