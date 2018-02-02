---
title: Upload a Custom Certificate 
description: How to upload a custom SSL certificate in section.io portal.
keywords: SSL, certificate, custom, upload, update, CDN configuration
---

## Get started

Log into your Aperture dashboard and under **Set up** navigate to the **HTTPS** page.


## Select domain

The SSL information for the first domain in this application will automatically load. If you have setup multiple domains on a single application, click the drop down box "Select your domain" and select the domain you wish to upload a certificate for. 

If you have multiple sub domains in this application, and wish to upload a wild card certificate, or a certifate with multiple domains in the Subject Alternate Name(SAN), you will need to upload the certifcate for each domain.

Click on "Specify a custom certificate", or "Change custom certificate" if you had previously uploaded a custom certificate. This will drop open a new panel on the page where you will see an input box for "Public certificate & chain" and one for "Private key"


## Paste certificate and key

You will need to copy the site certificate and any intermediate certificates to the "Public certificate & chain" box. Make sure NOT to include the root certificate.
The order of certificates needs to be domain certificate first, followed by any intermediate certificate(s) in order.
The certificates should be PEM encoded so will look like this in a text editor:

    
    -----BEGIN CERTIFICATE-----
    /* contents of domain certificate */
    -----END CERTIFICATE-----
    -----BEGIN CERTIFICATE-----
    /* contents of intermediate certificate */
    -----END CERTIFICATE-----

If there are more than one intermediate certificate, you will need to make sure they are copied in correct order.

    -----BEGIN CERTIFICATE-----
    /* contents of domain certificate */
    -----END CERTIFICATE-----
    -----BEGIN CERTIFICATE-----
    /* contents of intermediate certificate 1*/
    -----END CERTIFICATE-----
    -----BEGIN CERTIFICATE-----
    /* contents of intermediate certificate 2*/
    -----END CERTIFICATE-----

If you are unsure about certificate order, see [this page for instructions](/docs/how-to/ssl-determine-certificate-order/).

Now copy and paste your private key in to the "Private key" input area. the private key should look like:

    -----BEGIN RSA PRIVATE KEY-----
    /* contents of private key */
    -----END RSA PRIVATE KEY-----



## Upload 

Once you have copy and pasted the certificates and private key, click the "Save Changes" button. The portal will perform a check to make sure the certificate is for the correct domain, and the private key is a match for the certificate. Once that is accepted, a deployment is made to the section.io platform and you should see the new certificate on the site in moments. You will also see the uploaded certificate information at the right hand side of the HTTPS page.

You can also check your newly uploaded certificate using either a command line or 3rd party online tool. See [this page for more details](/docs/how-to/https/check-your-current-https-setup/)