---
title: Magento
description: How to setup a Magento website on section.io CDN with Vanish Cache.
keywords: magento, varnish, varnish cache, install varnish, turpentine, magento 1, magento 2, magento extension, cache, page speed, webpage speed
aliases:
  - /magento/

---

Magento is a common eCommerce platform that is well known for suffering performance related issues. section.io delivers huge speed improvements to Magento through caching HTML pages (and static assets) inside Varnish.

## Different Approaches for Different Magento Versions

[Prior to Magento 2.0](#magento-19-and-earlier), Varnish support is provided by HTML Streaming, Anonymous user caching or the [free Turpentine Magento extension]

[As of Magento 2.0](#magento-20-and-later), support for Varnish to cache page content is integrated into Magento. section.io offers ["Instant Global Cache"](#magento-2-extension), an extension that will let you get setup with Varnish and distribute it globally on section.io’s CDN directly from the Magento Admin portal.

### Magento 1.9 and Earlier

#### HTML optimisation options:
1.  HTML Streaming - https://www.section.io/html-streaming/
2.  Anonymous User Caching (Recommended) - https://community.section.io/t/a-novel-way-to-cache-html/79
3.  Turpentine - Detail below

#### Turpentine Process overview

Magento 1.9 and earlier does not support Varnish out of the box. Support is instead provided by the [free Turpentine Magento extension].

The Turpentine extension issues commands required for correct operation to a management port intended for Varnish. A special “bridge” program listens on this port, and makes the section.io platform look like a normal Varnish instance (Instead of a globally distributed platform that runs Varnish for you).

Follow the [official instructions] in order to install Turpentine. Since Varnish itself is already configured inside section.io you’ll only need to complete the ‘Install this plugin’ steps.

1.  Sign up & create an application at section.io using the final DNS name that your site will be accessed as.
2.  Download, install & configure the varnish-cli-bridge.
3.  Follow the standard Magento+Turpentine instructions, with some exceptions (see below).
4.  Apply the Varnish configuration from within Turpentine Configuration, to update section.io.
5.  Update your public DNS records to direct traffic to section.io for your site.

#### Creating an application

section.io provides a customized Varnish image already configured for Magento Turpentine. Create your application using the Stack “Varnish v3 Magento Turpentine”.

#### Set up the varnish-cli-bridge

This program will listen for Varnish commands and foward them to the section.io hosted Varnish platform.

##### Download

Download the [lastest section.io cli bridge here]. You will want the varnish-cli-bridge-vN.N.N-linux-amd64.tar.gz file.

##### Collect configuration details

There are 3 pieces of information required to run the bridge:

1.  API endpoint: This URL uniquely identifies your application within section.io. Most often, you’ll need the “Production varnish Proxy API endpoint” from the Configuration &gt; API page in section.io’s management portal.
2.  API username: This is a username that has permission to perform API actions.
1.  API password: This is a password for the specified user to perform API actions.

##### Run as a service

We have an [Upstart](http://upstart.ubuntu.com/) [script available](https://github.com/section-io/varnish-cli-bridge/blob/master/upstart.conf) to to run the bridge as a service.

Install Upstart if it is not already installed on your server. Copy the script above with the new name “varnish-cli-bridge.conf” into /etc/init/. Change the endpoint, username & password to match your application.

    # Step 1: Install Bridge
    cd /tmp
    curl  --remote-name --location https://github.com/section-io/varnish-cli-bridge/releases/download/v0.2.4/varnish-cli-bridge-v0.2.4-linux-amd64.tar.gz
    tar xvzf varnish-cli-bridge-v?.?.?-linux-amd64.tar.gz
    cp ./varnish-cli-bridge /usr/local/bin/varnish-cli-bridge

    # Step 2:Setup bridge to run
    cd /etc/init
    curl --location https://github.com/section-io/varnish-cli-bridge/raw/master/upstart.conf --output varnishclibridge.conf

    # Step 3: edit the file "/etc/init/varnishclibridge.conf" with your specific details
    vi varnishclibridge.conf

    # Step 4: State the varnish cli bridge as a service
    start varnishclibridge

    # Step 5:Check bridge log for success - Should see a line like this -> main.go:159: Listening on '127.0.0.1:6082'.
    tail /var/log/varnish-cli-bridge.log

Otherwise, use whatever solution is available with your distribution to run the binary as a service.

##### Configure Turpentine to talk to the bridge

In your Magento admin portal, you will want to navigate to the Turpentine "Varnish Options" section. Here we will be updating the `Server List` option with the endpoint for the Varnish CLI Bridge you just installed. Add the entry `127.0.0.1:6082` to the list and hit "Save Config" in the upper right hand corner.

{{% figure src="/docs/images/turpentine-server-list.png" %}}

If you get an error (sample error in picture below), you should revisit the bridge installation process and ensure you have done that correctly.

{{% figure src="/docs/images/turpentine-error.png" %}}

##### Deviations from official Turpentine instructions

###### Installation

See the [turpentine installation guide](https://github.com/nexcess/magento-turpentine/wiki/Installation).

Step 1-3: Skip these steps. There is no need to install or configure a local Varnish server.

###### Configuration

See the [turpentine configuration guide](https://github.com/nexcess/magento-turpentine/wiki/Configuration).

No special configuration is required to use Turpentine with the bridge & section.io.

###### Upload Turpentine configuration to section.io

The configuration must be applied/uploaded into section.io by manually hitting the Apply Varnish Configuration button on the Cache Management page.

###### Testing

There are 2 recommended tests to validate your implementation:

1.  Test Pages Are Coming From Cache - Reload your browser 3-5 times on a single page, You should start to see multiple Varnish ID’s in the HTTP response headers (In a browser debugger such as Chromes debugger) and see page response times around ~50-100ms
2.  Test Bans Are Reaching the section.io Platform - Using a Product page on your site refresh 3-5 times to ensure pages are in cache. Once the page is in cache, Add a product to your shopping cart. This will cause Turpentine to send a Ban statement to section.io to clear out the block on all pages for the user that contains the shopping cart. You should see the shopping cart updated successfully on page refresh.

### Magento 2.0 and Later

With the release of Magento 2, Varnish is required for production usage. The means that you have to have a Varnish implementation to run your Magento 2 site. We offer an extension, [Instant Global Cache](#magento-2-extension), for you to get setup within the Magento portal. If you are experiencing a low cache hit rate with Magento 2 and Varnish Cache make sure you’ve [checked these settings within Magento](https://community.section.io/t/varnish-for-magento-2-setup/87).

#### Magento 2 extension

To get started with section.io and Varnish directly from the Magento Admin portal, you first must download the "Instant Global Cache" extension from the [Magento Marketplace](https://marketplace.magento.com/sectionio-metrics.html).

Once the extension is added, go to Reports in the left Nav and then find section.io listed in your Reports.

{{% figure src="/docs/images/magento-extension-location.png" %}}

We will ask you to login with section.io credentials. You can either create them in the Magento portal or use credentials you have created from [section.io/sign-up/](https://www.section.io/sign-up/). When you create your login we will also send you an email to verify your email address. This is required for us to setup your application.

When you are logged in on your Magento Admin Portal with your section.io credentials, we will determine if you already have an application setup with us. If you do, we will show you the accounts you have with us. If you do not, we will create an application for you.

If you do not have Varnish Cache as your chosen Full Page Cache Caching Application, will will show an error message for you to update this. To update this field, go to Stores -> Configuration (under Settings) -> Advanced -> System. Then toggle the Caching Application under Full Page Cache to Varnish Cache.

{{% figure src="/docs/images/magento-cache-settings.png" %}}

Now you have a section.io application created with Varnish 4 and Varnish Cache setup as your Full Page Cache solution in Magento.

Next, on the section.io extension, you will see a Management section. The first button says “Update varnish configuration.” Clicking this button will pull in the recommended Magento VCL (Varnish Configuration Language) into your section.io application.

{{% figure src="/docs/images/magento-extention-management.png" %}}

There is also a button to pull in free HTTPS certificate. This will ensure your website has the green padlock next to the url. This is a free certificate included with your section.io application that we will managed on your behalf, to include prourement, installation, and renewal. Please ensure your website has an endpoint exposed to the internet so we can validate the certificate before you go live.

To go live with Varnish and your section.io application, you willl need to change a DNS record to point to section.io. Detailed instructions can be found [here](https://www.section.io/docs/change-dns/#dns-hosting-with-your-current-provider). You can also find more information from your hosting provider as to where to go to make this change. Once you have made the change, you can click verify to see if the change was successful and traffic is currently flowing through section.io.

#### Magento CLI Commands

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
