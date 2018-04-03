---
title: Set up DNS on section.io.
description: Guide for changing your DNS to go live with section.io.
keywords: DNS, DNS records, DNS hosting, bare domain, zone apex, naked domain and root domain
aliases:
  - /hosted-dns/

---

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
3. **Edit** existing records by clicking the corresponding `Edit` button. The record types `A`, `ALIAS`, or `CNAME` can be changed to another record type in this same set and when saved the change will be applied so the record does not appear missing during the transition.
