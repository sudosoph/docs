---
title: Use section.io with outside DNS.
description: Guide for changing your existing DNS to go live with section.io.
keywords: DNS, DNS records, DNS hosting, bare domain, zone apex, naked domain and root domain
aliases:
  - /hosted-dns/

---

To continue hosting with your current provider you'll need to go to your domain name provider and replace any existing 'CNAME' or A records with the 'CNAME' we've provided for you in your account. After making the DNS change (and allowing time for your DNS ttl expiry) you will start to see metrics showing in the Production environment for your site.

If your site doesn’t send the right HTTP headers or you have other things preventing the site from caching (like [client-side cookies]) then you can modify the way your reverse proxies interact with your site using section.io’s local development environment.

Follow the steps below to create a DNS (Domain Name System) record that directs traffic to your website via section.io.

1.  Remove any existing the CNAME or A record for your site.
2.  Add the CNAME record “your.site.name.here.c.section.io.” to the DNS configuration for your site name. To confirm this record, visit your overview page and click on DNS.

Note: DNS changes may take some time.

To stay with section.io, don’t remove or change the DNS record, even after verification succeeds. Once you have changed your DNS, please ensure you've setup [HTTPS](/docs/setup-https).

### DNS Resources
Each registrar has its own method of adding CNAME records. Below are some links to instructions on adding DNS records
for common hosts and DNS providers.

  * <a href="https://doc.gandi.net/en/dns/zone/cname-record">Gandi</a>

  * <a href="https://www.digitalocean.com/community/tutorials/how-to-set-up-a-host-name-with-digitalocean#cname-records">DigitalOcean</a>

  * <a href="http://www.networksolutions.com/support/how-to-manage-advanced-dns-records">Network Solutions</a>

  * <a href="https://www.godaddy.com/help/add-a-cname-record-19236">GoDaddy</a>

  * <a href="https://help.hover.com/hc/en-us/articles/217282457-How-to-Edit-DNS-records-A-AAAA-CNAME-MX-TXT-SRV-">Hover</a></li>

  * <a href="https://help.dreamhost.com/hc/en-us/articles/215414867-How-do-I-add-custom-DNS-records-">Dreamhost</a>

  * <a href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/resource-record-sets-values-basic.html">Amazon Route 53</a>

  * <a href="https://www.namecheap.com/support/knowledgebase/article.aspx/9646/2237/how-can-i-set-up-a-cname-record-for-my-domain">Namecheap</a>

  * <a href="http://help.dnsmadeeasy.com/managed-dns/records/cname-record/">DNS Made Easy</a>

  * <a href="https://my.bluehost.com/cgi/help/559">Bluehost</a>
  
  * <a href="https://support.dnsimple.com/articles/record-editor/">DNSimple</a>

  * <a href="https://support.hostgator.com/articles/cpanel/how-to-change-dns-zones-mx-cname-and-a-records">Hostgator</a>

  * <a href="https://knowledge.web.com/subjects/article/KA-01097/en-us">Register.com</a>

Having trouble? Contact your domain name provider directly for further assistance.
