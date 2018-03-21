---
title: Available Proxies
description: Information on which reverse proxies are available to use on section.io's content delivery network.
keywords: content delivery network, CDN, varnish, turpentine, modsecurity, reverse proxies, proxy, proxy template
aliases:
  - /proxy-list/

---

section.io offers a number of different proxies that can be used in your reverse proxy chain. A proxy template is a combination of the proxy software (eg. Varnish Cache) and a set of default files to configure the proxy (eg. the `default.vcl` file).

If you want to experiment with different proxies you can use our [developer POP](/docs/developer-pop/) to run your proxy stack on your local machine.

## Varnish Cache v6.0

- Varnish Cache 6.0.0
- Std VMOD - <https://www.varnish-cache.org/docs/6.0/reference/vmod_std.generated.html>
- Cookie, Header, Softpurge, Var, and Xkey VMODs - <https://github.com/varnish/varnish-modules#readme>

## Varnish Cache v5.2

- Varnish Cache 5.2.1
- Std VMOD - <https://www.varnish-cache.org/docs/5.2/reference/vmod_std.generated.html>
- Cookie, Header, Softpurge, Var, and Xkey VMODs - <https://github.com/varnish/varnish-modules#readme>
- UUID VMOD - <https://github.com/Sharecare/libvmod-uuid#readme>

## Varnish Cache v5.1

- Varnish Cache 5.1.3
- Std VMOD - <https://www.varnish-cache.org/docs/5.1/reference/vmod_std.generated.html>
- Cookie, Header, Softpurge, Var, and Xkey VMODs - <https://github.com/varnish/varnish-modules#readme>
- UUID VMOD - <https://github.com/Sharecare/libvmod-uuid#readme>

## Varnish Cache v4.1

Varnish Cache 4.1 is available if you need this version

- Varnish Cache 4.1.9
- Std VMOD - <https://www.varnish-cache.org/docs/4.1/reference/vmod_std.generated.html>
- Cookie, Header, Softpurge, Var, and Xkey VMODs - <https://github.com/varnish/varnish-modules#readme>
- UUID VMOD - <https://github.com/Sharecare/libvmod-uuid#readme>

## Varnish Cache v4.0

Varnish Cache 4.0 is available if you need this version

- Varnish Cache 4.0.3
- Std VMOD - <https://www.varnish-cache.org/docs/4.0/reference/vmod_std.generated.html>
- Cookie VMOD - <https://www.varnish-cache.org/vmod/cookie>
- Maxmind GeoIP VMOD - <https://www.varnish-cache.org/vmod/maxmind-geoip>
- Header VMOD - <https://www.varnish-cache.org/vmod/header-manipulation>
- UUID VMOD - <https://github.com/Sharecare/libvmod-uuid#readme>

## Varnish Cache v3

If you have a need to run Varnish 3, eg. you have existing v3 VCL you want to run in section.io, pick this one. This proxy also has ESI enabled to support the [Magento Turpentine extension]

- Varnish Cache 3.0.5
- Cookie VMOD - <https://www.varnish-cache.org/vmod/cookie>
- Maxmind GeoIP VMOD - <https://www.varnish-cache.org/vmod/maxmind-geoip>
- Header VMOD - <https://www.varnish-cache.org/vmod/header-manipulation>

## ModSecurity

- apache 2.4.7
- modsecurity 2.7.7
- OWASP ModSecurity Core Rule Set ([commit c63affc9dfa6294ecf8782ae4d1f1fb2c9fd5a18]) included by default

## PageSpeed

- pagespeed 1.12.34.2

## Threat-X

Please contact support at [support@section.io](mailto:support@section.io) to configure your environment with Threat-X.

  [Magento Turpentine extension]: https://github.com/nexcess/magento-turpentine
  [commit c63affc9dfa6294ecf8782ae4d1f1fb2c9fd5a18]: https://github.com/SpiderLabs/owasp-modsecurity-crs/tree/c63affc9dfa6294ecf8782ae4d1f1fb2c9fd5a18
