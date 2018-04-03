---
title: Configure DNS
description: Guide for changing your DNS to go live with section.io or using section.io hosted DNS.
keywords: DNS, DNS records, DNS hosting, bare domain, zone apex, naked domain and root domain
aliases:
  - /dns/
  - /hosted-dns/
  - /change-dns/

---

<!-- As soon as we've created your application, you'll be able to change your DNS. This is required for your production traffic to flow through our application.

You can use [section.io’s hosted DNS](#sectionio-hosted-dns) or change your DNS records at your [current provider](#dns-hosting-with-your-current-provider).

## section.io Hosted DNS

To simplify management for your websites, section.io can provide DNS hosting. This is especially useful for pointing a zone-apex record (ie bare domain) at a section.io endpoint if your current DNS hosting provider does not support the `ALIAS` or `ANAME` record types.

Hosting your DNS with section.io also provides convenient access to DNS management within the Aperture portal.

### Begin hosting DNS with section.io

To enable Hosted DNS with section.io:  

1) Navigate to the DNS page for your section.io application's hosted environment (eg Production).

2) Below the "Change your DNS to go live" heading you should find another heading labeled "section.io Hosted DNS". The paragraph that follows will describe the DNS zone name that we have detected that your domain belongs to. If we have detected this zone correctly, and you have access to the DNS *registrar* to change the name servers for this zone, you can proceed.

**Please note** that you need to change you name servers via the organisation through which you purchased the domain name. This may not necessarily be the same as where you currently manage your DNS records.

3) Click the `Enable Hosted DNS` button. The DNS page will refresh after a few moments with new instructions.

4) Our system will have attempted to copy the most common DNS records from your existing DNS hosting provider into our database but it can miss some records. Follow the link in "Step 1" of the new DNS page to view the records that have been copied. Verify that the existing records are correct and add any missing records.

5) When you have verified and corrected the copied records, return the the DNS page for you section.io application's environment. "Step 2" on this page lists the new name servers that you will need to enter for your zone at your DNS registrar. Once this is done the change may take up to 48 hours to propagate to all DNS servers globally, after that you can manage you DNS records via section.io and your old DNS hosting provider is not used.

6) Click the `Verify` button on the DNS page to test if HTTP requests for your site are reaching the section.io endpoints.

Once you have changed your DNS, please ensure you've setup [HTTPS](/docs/setup-https).

### Manage your DNS hosted with section.io

Once Hosted DNS has been enabled for a section.io application you can access the zone management page in two ways:

1. From the DNS page of a hosted environment (Step 1 links to the zone page) or ...
2. On the left hand navigation bar under **Account** click **DNS Hosting**.

From the zone page for a particular zone you can view:

1. The name servers that should be configured at your DNS registrar.
2. The table of DNS records defined in the zone.

From the records table you can:

1. **Delete** records that are not associated with a section.io site. Upon first click of the `Delete` button beside the target record, the button label will change to `Confirm`, upon clicking again the record will be deleted and begin propagating immediately.
2. **Add** new records by clicking the `Add` button at the bottom of the table, filling the required fields, then clicking the `Save` button. You cannot create a `CNAME` record at the zone apex, use an `ALIAS` record instead for this purpose.
3. **Edit** existing records by clicking the corresponding `Edit` button. The record types `A`, `ALIAS`, or `CNAME` can be changed to another record type in this same set and when saved the change will be applied so the record does not appear missing during the transition. -->


<!-- ## DNS Hosting with your current provider

To continue hosting with your current provider you'll need to go to your domain name provider and replace any existing 'CNAME' or A records with the 'CNAME' we've provided for you in your account. After making the DNS change (and allowing time for your DNS ttl expiry) you will start to see metrics showing in the Production environment for your site.

If your site doesn’t send the right HTTP headers or you have other things preventing the site from caching (like [client-side cookies]) then you can modify the way your reverse proxies interact with your site using section.io’s local development environment.

Follow the steps below to create a DNS (Domain Name System) record that directs traffic to your website via section.io.

1.  Remove any existing the CNAME or A record for your site.
2.  Add the CNAME record “your.site.name.here.c.section.io.” to the DNS configuration for your site name.

Note: DNS changes may take some time.

To stay with section.io, don’t remove or change the DNS record, even after verification succeeds. Once you have changed your DNS, please ensure you've setup [HTTPS](/docs/setup-https).

Having trouble? Contact your domain name provider directly for further assistance. -->

## Additional Notes on DNS

Below are some additional notes on changing DNS on two main questions. How do I setup a CNAME record for my [bare domain](#bare-domains) and how do I setup my application for [multple domains](#multiple-domains).

<!-- ### Bare Domains

Bare Domains are DNS records without www, also called Zone Apex, Naked Domain and Root Domain. To go live on section.io you need to setup a CNAME record pointing to the section.io platform.

There is a limitation in DNS that you cannot use a CNAME for your bare domain (e.g. domain.com) and define additional resource records for the same zone.

This means that if you were to setup a CNAME on your bare domain you will get unpredictable results and most likely break other records that also exist at the bare domain - such as MX records required for your email to work.

We recommend using section.io Hosted DNS so that you do not need to create a CNAME for your bare domain, as your DNS is already hosted with us. If you want to continue to use your current provider, there are 2 work arounds:

1.  Switch to running your site on “www”. This means that users will type in www.domain.com to get to your website. You would setup a HTTP 301 redirect from the bare domain to the www version so that users (and SEO) are automatically redirected to the “www” site.
2.  Use a DNS provider that supports a special `ALIAS`/`ANAME` record type at the bare domain.

For technical background on CNAME’s and the bare domains see: [RFC 1034 section 3.6.2](https://tools.ietf.org/html/rfc1034#section-3.6.2). -->

### Multiple Domains

The section.io platform  will only respond to requests using exactly the same domain name that was used to create the application on section.io. For example, if you register your application on section.io as `www.example.com` but then choose to create a `blog.example.com` CNAME record directed at the `www.example.com.c.section.io.` endpoint specified on your application's DNS page in the Aperture portal, visitors to the `http://blog.example.com` will receive an error page (`HTTP 409 Conflict` specifically).

If you would like your section.io application to respond to multiple domains, you can add them on bottom of the the Domains page under *Domains*. You can also add or delete additional domains via our API by using the following commands:

`POST /account/{accountId}/application/{applicationId}/environment/{environmentName}/domain/{hostName}`

`DELETE /account/{accountId}/application/{applicationId}/environment/{environmentName}/domain/{hostName}`

Note: Domains can only be added to a root application (ie pathPrefix of /). Domains added to this application's environment will also be used for the corresponding environment in the sub-apps.

Please review our [HTTPS setup page](/docs/setup-https) to ensure all of your domains are properly covered by either our automated HTTPS or your own custom certificates to prevent certificate errors.

*Note*: Wildcard domains (i.e. `*.example.com`) can be supported, please [contact section.io support](https://support.section.io/) to set this up.

If the additional domain names should redirect to the canonical domain name to improve search engine ranking, this can be achieved with a basic Varnish configuration, for example:

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
