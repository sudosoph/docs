---
title: StatusPage
description: Integrate with StatusPage to monitor and alert when the delivery system is unhealthy.
keywords: StatusPage, Alerting, Monitor
aliases:
 

---
#### A Guide to Integrating StatusPage with Section to monitor and alert on delivery system health.

The StatusPage integration allows customer stakeholders to sign up to be alerted via email, SMS, and Slack when the delivery system is unhealthy.  In addition, the integration will identify which leg (Origin > Section or Section > enduser) is down.  



StatusPage Integration

To integrate StatusPage with Section:

#### 1) step one


You will see it under `Edge-access-log` documents in Kibana as `section_io_tag`

{{% figure src="/docs/images/section_io_tag.png" %}}

This is a HTTP header and is therefore visible downstream, so care should be taken with what information is presented in this header to prevent security issues.


#### 2) Log using Varnish Cache std.log

Varnish Cache 4.1+ VCL can call `std.log("section-io-cache-tag:CUSTOM_VALUE_HERE");` in `sub vcl_deliver` and the value specified will be indexed in Kibana `varnish-ncsa-log` documents as the `section_io_cache_tag` field. This is not a HTTP header and is therefore not visible upstream or downstream. 

Here is an example usage where an origin response header named `origin-information` is captured and logged in `sub vcl_deliver` then removed so it is not visible downstream:
    
    import std;
    sub vcl_deliver {
        std.log("section-io-cache-tag:" + resp.http.origin-information);
        unset resp.http.origin-information;
    }


If the value of `origin-information` header was `Hello again!` you would see following in Kibana.

{{% figure src="/docs/images/section_io_cache_tag.png" %}}

Note: Varnish Cache is setup to only log these custom values from `sub vcl_recv` and `sub vcl_deliver`. Logging information from other subroutines such as `sub vcl_backend_response` will be ignored. 


