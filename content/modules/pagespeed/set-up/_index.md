---
title: Set up
description: Adding PageSpeed to your Section proxy stack.
keywords: content delivery network, CDN, pagespeed, reverse proxies, proxy, proxy template
weight: 1
aliases:
  - /modules/pagespeed/tutorials/
  - /modules/pagespeed/tutorials/add-pagespeed-to-proxystack/
---

## Overview

This tutorial will guide you through the process to adding the PageSpeed module to your proxy stack with default configuration files. This tutorial assumes you've cloned your application's git repository to your local machine.

### Step 1 - Updating section.config.json

1. Add the following object to your **proxystack** array in your **section.config.json** file located in the root of your repository.

```
{
    "name": "pagespeed",
    "image": "pagespeed:1.13.35.2"
}
```

{{% notice note %}}
You can add this module at any index in your proxystack array. We'd recommend adding this module behind Varnish Cache. 
{{% /notice %}}

### Step 2 - Adding default files

1. Create a `pagespeed` directory in the root of your repository.
1. Create the following files under the **pagespeed** directory:
    * server.conf
    * http.conf

#### server.conf content
```nginx
pagespeed On;
pagespeed RewriteLevel PassThrough;

# List of Pagespeed filters to enable, see https://modpagespeed.com/doc/config_filters#enabling for the list of filters available
pagespeed EnableFilters "inline_css,inline_import_to_link,inline_javascript,rewrite_css,rewrite_javascript";

pagespeed FetchHttps enable;
pagespeed CustomFetchHeader X-Forwarded-Proto https;
pagespeed RewriteDeadlinePerFlushMs 60;
pagespeed RespectXForwardedProto on;

# TODO: Needs custom configuration
pagespeed MapOriginDomain next-hop www.domain.com.au;
pagespeed MapOriginDomain http://next-hop https://www.domain.com.au;

# Ensure requests for pagespeed optimized resources go to the pagespeed handler
# and no extraneous headers get set. https://modpagespeed.com/doc/configuration
location ~ "\.pagespeed\.([a-z]\.)?[a-z]{2}\.[^.]{10}\.[^.]+" {
  add_header "" "";
}

# Use HTTP 1.1 to allow for keepalive connections
proxy_http_version 1.1;

# Pass the request host header through to the upstream
proxy_set_header Host $host;

# Allow http connections to be kept open
proxy_set_header Connection '';

# Pass the origin server response header through rather than allowing nginx to set it to "nginx"
proxy_pass_header Server;

location / {
    proxy_set_header Host $host;
    proxy_pass "http://next_hop_upstream";
}
```

#### http.conf content
```nginx
# Place any "pagespeed" directives that need to be specified at the nginx "http" level in this file.
# Use server.conf for all other directives.

# Set the value of the `X-Page-Speed` response header
# https://modpagespeed.com/doc/configuration#XHeaderValue
pagespeed XHeaderValue "PageSpeed";

# URL Pagespeed will beacon back page load information to assist with optimization filters
# https://modpagespeed.com/doc/faq#beacons
pagespeed BeaconUrl /.well-known/section-io/ngx_pagespeed_beacon;

# URL Pagespeed will load external resources from
# https://modpagespeed.com/doc/configuration#pagespeed_static
pagespeed StaticAssetPrefix /.well-known/section-io/pagespeed_static/;

pagespeed MemcachedServers    "memcached:2211";
pagespeed MemcachedTimeoutUs 150000; # 150,000us == 150ms. Default is 50ms. Still better than origin fetch.
```

### Step 3 - Customize server.conf

The server.conf file requires a few custom snippets to function out-of-the-box:

1. Do a find and replace for `www.domain.com.au` with the domain you intent to use for your environment.
1. *Optional:* Configure the Pagespeed filters found on line 4.

### Step 4 - Deploy

Commit your changes and push them to the desired branch you are working on. If you run into any issues please contact support@section.io.