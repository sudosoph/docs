---
title: Edge Proxy
description: Explanation for section.io's edge proxy, which handles a number of tasks before being passed to your proxy configuration.
keywords: edge proxy, tls, tls handshake, http2, http/2, proxy configuration, reverse proxies
aliases:
  - /edge-proxy/

---
# What is section.io's Edge Proxy?

Every section.io application proxy stack implicitly begins with the Edge proxy. The Edge proxy is the endpoint to which the User-Agent (eg web browser) connects and it has a few responsibilities:

* Performing the TLS handshake for HTTPS connections
* Routing requests to the corresponding application proxy stack
* Implementing the HTTP/2 protocol
* Request correlation
* Serving custom error pages

This enables a consistent experience on the section.io platform regardless of which proxies are in your application's stack or in which sequence they appear.

## IP geolocation

For each incoming request, the Edge proxy attempts to resolve the client's connecting IP address to a geographic location. The results of the lookup are then exposed to the other proxies in the proxy stack and to the origin web server as HTTP request headers. These headers are:

* `section-io-geo-country-code` - the [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country code such as `US` for the United States, or `AU` for Australia.
* `section-io-geo-country-name` - the country name such as `United States` or `Australia`.
* `section-io-geo-region-code` - examples include `CA` and `VA` for US IPs or `NSW` for Australian IPs.
* `section-io-geo-region-name` - examples include `California` and `Virginia` for US IPs or `New South Wales` for Australian IPs.
* `section-io-geo-city` - examples include `New York`, `Mountain View`, `Sydney`, and `Drummoyne`.
* `section-io-geo-latlon` - the approximate latitude and longitude in the format `-33.8696,151.2099`.
* `section-io-geo-postal-code` - examples include `2047` for Drummoyne, NSW, Australia and `80302` for Boulder, CO, USA.
* `section-io-geo-dma-code` - The Nielsen Designated Market Area ID as used by DoubleClick. Only for US IPs.

Not all headers are populated for all IP addresses.

The latitude, longitude, country code, and city values are also available in the access logs.

## Client IP Detection

For each request the edge proxy will also add a `True-Client-IP` request header which provides the IP address of the client that connected to us.  This is the same IP address used for the IP geolocation.

This request header can be used in a number of ways:

 * Fraud detection
 * IP Whitelist/Blacklisting, including [restricting access to particular urls](https://community.section.io/t/can-i-whitelist-ip-addresses-for-my-admin-routes-and-deny-everyone-else-access/164).
 * Logging client usage
 * Rate limiting

section.io also sets the [`X-Forwarded-For`](https://en.wikipedia.org/wiki/X-Forwarded-For) header if you need to use that, however this header will often be a list of IP addresses depending on how the request has been proxied prior to arriving at section.io and is not always reliable.

## Request correlation

When the Edge proxy handles each incoming request, a unique identifier is generated and is added to the request via a `section-io-id` HTTP request header.

This request header then propagates through to each proxy in your application's proxy stack and ultimately to your application's configured origin web server. When the final response is returned from your application, via the proxy stack, to the User-Agent, the Edge proxy also inserts the same identifier as a `section-io-id` HTTP response header.

The `section-io-id` value is available in all the proxy logs provided by Aperture to enable easy correlation of log entries across the different proxies in the stack. You can also choose to log the `section-io-id` request header on your origin server to aid with diagnostics.

By providing the identifier as a request header, its value can be consumed in your chosen proxies. For example, Varnish can refer to `req.http.section-io-id` in the VCL.

The format of the `section-io-id` identifier is subject to change without notice so it should be treated as an opaque string and no meaning should be inferred from its value.

## Content compresssion

By default section.io will gzip responses to requests that can be compressed. This is typically text content like HTML, CSS & Javascript files. We will enable this compression even if your origin server does not send gzipped responses to improve performance for your site's visitors. In the unlikely scenario that compression causes issues for your site, you can disable this feature in [Advanced Configuration](/docs/advanced-configuration).

Edit the `section.config.json` and add `"maintain_upstream_content_encoding": true` to the environment you want to disable gzip encoding on.

    "environments": {
        "Production": {
            "origin": {
                "address": "origin.example.com",
                "host_header": "override.example.com"
            },
            "maintain_upstream_content_encoding": true
        }
    }

Commit this change and all responses will retain the content-encoding that is sent from the origin.