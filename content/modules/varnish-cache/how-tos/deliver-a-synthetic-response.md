---
title: Deliver a synthetic response
description: Guide to deliver a synthetic http response using Varnish Cache.
keywords: varnish, Varnish Cache , cache, cached data, synthetic    

---

## Overview

Varnish Cache allows you to create synthetic HTTP responses with the use of [vcl_synth](https://varnish-cache.org/docs/trunk/users-guide/vcl-built-in-subs.html#vcl-synth). This is useful when you want to perform a redirect, deliver a 404, a custom error page, etc.

## Synthetic Responses

Below is a basic example of how to deliver a synthetic response using VCL syntax 4.0. This example will deliver a 200 response with the body content "Hello World" if a request matches the URI path "/hello"

{{< highlight js >}}
sub vcl_recv {
    if (req.url ~ "/hello") {
        return (synth(800, "Hello World"));
    }
}

sub vcl_synth {
    if (resp.status == 800) {
        set resp.status = 200;
        set resp.http.Content-Type = "text/html; charset=utf-8";
        synthetic("<h1>Hello World</h1>");
        return (deliver);
    }
}
{{< / highlight >}}

### Other use cases

* [Redirect a request]({{< relref "modules/varnish-cache/how-tos/redirect-a-request.md" >}})
* [Generate a 404 response]({{< relref "modules/varnish-cache/how-tos/respond-with-a-404.md" >}})
