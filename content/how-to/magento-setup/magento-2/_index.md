---
title: Set up a Magento 2 app on section.io
description: A guide for setting up a Magento 2 app on the section.io platform.
keywords: cache, https, website performance, page speed, webpage speed, website security, content delivery network, CDN
weight: 10
---

The following is a guide to going live on section.io with a Magento 2 application.

### 1) Download the section.io extension.

To get started with section.io and Varnish directly from the Magento Admin portal, you first must download the "Instant Global Cache" extension from the [Magento Marketplace](https://marketplace.magento.com/sectionio-metrics.html).

### 2) Login with or create section.io credentials

Once the extension is added, go to Reports in the left Nav and then find section.io listed in your Reports.

{{% figure src="/docs/images/magento-extension-location.png" %}}

We will ask you to login with section.io credentials. You can either create them in the Magento portal or use credentials you have created from [section.io/sign-up/](https://www.section.io/sign-up/). When you create your login we will also send you an email to verify your email address. This is required for us to setup your application.

### 3) Set up your application and Varnish Cache.

When you are logged in on your Magento Admin Portal with your section.io credentials, we will determine if you already have an application setup with us. If you do, we will show you the accounts you have with us. If you do not, we will create an application for you.

If you do not have Varnish Cache as your chosen Full Page Cache Caching Application, we will show an error message for you to update this. To update this field, go to Stores -> Configuration (under Settings) -> Advanced -> System. Then toggle the Caching Application under Full Page Cache to Varnish Cache.

{{% figure src="/docs/images/magento-cache-settings.png" %}}

Now you have a section.io application created with Varnish 4 and Varnish Cache setup as your Full Page Cache solution in Magento.

### 4) Import Magento Varnish cache configuration

On the section.io extension, you will see a Management section. The first button says “Update varnish configuration.” Clicking this button will pull in the recommended Magento VCL (Varnish Configuration Language) into your section.io application to optimize your caching for Magento.

{{% figure src="/docs/images/magento-extention-management.png" %}}

### 5) Provision a free section.io certificate (optional)

There is also a button to pull in free HTTPS certificate. This will ensure your website has the green padlock next to the url. This is a free certificate included with your section.io application that we will managed on your behalf, to include procurement, installation, and renewal. Please ensure your website has an endpoint exposed to the internet so we can validate the certificate before you go live.

**note:** if you do not perform this step, you will need to upload a custom certificate to the section.io portal in order to maintain HTTPS.

### 6) Change DNS and Go Live!

To go live with Varnish and your section.io application, you will need to change a DNS record to point to section.io. Detailed instructions can be found [here](https://www.section.io/docs/change-dns/#dns-hosting-with-your-current-provider). You can also find more information from your hosting provider as to where to go to make this change. Once you have made the change, you can click verify to see if the change was successful and traffic is currently flowing through section.io.

## Using the CLI

You can also complete the above process using the CLI

The section.io extension adds some new Magento CLI commands to allow you to automate the configuration of your site

`sectionio:setup <username> <password> <account_id> <application_id>`
Setup the section.io extension with your section.io account and application details `<username> <password>` are your [https://aperture.section.io](https://aperture.section.io) username & password.

`sectionio:updatevcl`
Update Varnish with the Magento VCL. This has the same effect as pressing the "Update varnish configuration" button in the extension UI.

  [free Turpentine Magento extension]: http://www.magentocommerce.com/magento-connect/turpentine-varnish-cache.html
  [official instructions]: https://github.com/nexcess/magento-turpentine/wiki/Installation
  [lastest section.io cli bridge here]: https://github.com/section-io/varnish-cli-bridge/releases/latest
  [Configure and use Varnish]: http://devdocs.magento.com/guides/v2.0/config-guide/varnish/config-varnish.html
  [Install Varnish]: http://devdocs.magento.com/guides/v2.0/config-guide/varnish/config-varnish-install.html
  [Configure Varnish and your web server]: http://devdocs.magento.com/guides/v2.0/config-guide/varnish/config-varnish-configure.html
  [Configure Magento to use Varnish]: http://devdocs.magento.com/guides/v2.0/config-guide/varnish/config-varnish-magento.html
