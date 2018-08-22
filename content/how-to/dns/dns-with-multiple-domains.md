---
title: DNS with multiple domains
description: Guide for configuring DNS with multiple domains.
keywords: DNS, DNS records, DNS hosting, multiple domains
aliases:
  - /dns/
  - /hosted-dns/
  - /change-dns/

---

The section.io platform  will only respond to requests using exactly the same domain name that was used to create the application on section.io. For example, if you register your application on section.io as `www.example.com` but then choose to create a `blog.example.com` CNAME record directed at the `www.example.com.c.section.io.` endpoint specified on your application's DNS page in the Aperture portal, visitors to the `http://blog.example.com` will receive an error page displaying `HTTP 409 Conflict`.

If you would like your section.io application to respond to multiple domains, you can add them on bottom of the the Domains page under *Domains*. You can also add or delete additional domains via our API by using the following commands:

`POST /account/{accountId}/application/{applicationId}/environment/{environmentName}/domain/{hostName}`

`DELETE /account/{accountId}/application/{applicationId}/environment/{environmentName}/domain/{hostName}`

Note: Domains can only be added to a root application (ie pathPrefix of /). Domains added to this application's environment will also be used for the corresponding environment in the sub-apps.

Please review our [HTTPS setup page](/docs/setup-https) to ensure all of your domains are properly covered by either our automated HTTPS or your own custom certificates to prevent certificate errors.

*Note*: Wildcard domains (i.e. `*.example.com`) can be supported, please [contact section.io support](https://support.section.io/) to set this up.

If the additional domain names should redirect to the canonical domain name to improve search engine ranking, this can be achieved with a basic Varnish Cache configuration, for example:

    vcl 4.0;

    sub vcl_recv {
      return (synth(700, ""));
    }

    sub vcl_synth {
        if (resp.status == 700) {
            set resp.status = 302; # or 301 if preferred
            set resp.http.Location = "https://canonical-domain.example.com" + req.url;
            return(deliver);
        }
    }
