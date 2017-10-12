---
title: SSL - Provision free certificate 
description: How to provision a free SSL certificate in section.io portal.
keywords: SSL, certificate, custom, upload, update, CDN configuration
---

Get started
------------
Log into your Aperture dashboard and under **Set up** navigate to the **HTTPS** page.


Select domain
------------
The SSL information for the first domain in this application will automatically load. If you have setup multiple domains on a single application, click the drop down box "Select your domain" and select the domain you wish to upload a certificate for. 

Provision certificate
------------
Click the "**Renew certificate**" button. If you previously used a custom certificate, click the "**Switch to Let's Encrypt**" button.
Let's Encrypt will run validation tests over the domain then provision a new certificate once validation is complete.

If you have only recently performed Go-Live(pointed DNS at section.io) the validation process might require multiple attempts, as DNS propagation can take some time. So if your free certificate doesn't provision straightaway, click the "Renew certificate" button again in a few minutes. If it still doesn't provision after 3 or 4 attempts, contact our support team. 

Once the certifcate has been provisioned, it will automatically renew every 3 months.

