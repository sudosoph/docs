---
title: Advanced Config
description: How to edit your varnish and modsecurity configuration files in your section.io repository.
keywords: github, repository, varnish, VCL, modsecurity, CDN configuration
aliases:
  - /its-just-modsecurity/
  - /its-just-varnish/
  - /vcl-samples/
  - /advanced-configuration/
---

When you are ready to start doing more advanced configurations, you can start editing the configuration files directly. All of the files in your repository can be accessed by going to Repository under the Configuration menu in the left nav of Aperture.

In the repository you can see all the files in your repository, commits to those files, stats, and a braching diagram. All of your advanced configuration for [varnish](#varnish-configuration) or [modsecurity](#modsecurity-configuration) will be done through editing the files here.

When you open the repostory view, you will see your files. Here you should see one folder for every reverse proxy you have setup for your application and one 'section.config.json' file, where you can add additional reverse proxies to your stack.

## Add another Reverse Proxy
The config files order the reverse proxy in the order that traffic will flow through, so be aware of the location you put the new reverse proxy in.

For example, if your application is setup with Varnish 4.0.3, you should see this at the top of your config file:

	"proxychain": [
	        {
	            "name": "varnish",
	            "image": "varnish:4.0.3"
	        },
	    ],


If you want to add modsecurity, you would edit the file so it looks like this

	"proxychain": [
	        {
	            "name": "varnish",
	            "image": "varnish:4.0.3"
	        },
	        {
	            "name": "modsecurity",
	            "image": "modsecurity"
	        }
	    ],

Reversely, if your application is setup with Modsecurity and you want to add Vanish 4.0.3, you should see this:


	"proxychain": [
	        {
	            "name": "modsecurity",
	            "image": "modsecurity"
	        },
	    ],

And edit the file so it again looks like this:

	"proxychain": [
	        {
	            "name": "varnish",
	            "image": "varnish:4.0.3"
	        },
	        {
	            "name": "modsecurity",
	            "image": "modsecurity"
	        }
	    ],


You can also do this using CLI with the command [append](/docs/cli/#section-append).

In either case, once you have edited the files or used the append command, please send us a [support ticket](https://support.section.io/hc/en-us/requests/new) so we can push those changes live for you.

## Varnish Configuration

Advanced configuration is done via the Varnish Control Language file `default.vcl`. You can access this file by going to Repository under the Configuration menu in the left nav of Aperture and then clicking on the Varnish file.

To help you get started, we've written some VCL snippets for you to review.

#### Cache Static Content

{{< gist section-io-gists 2a9e40238fffec56d3be >}}

#### Normalise Accept-Encoding

{{< gist section-io-gists 8ea78c06271d7e824431 >}}

#### Enforce HTTPS

{{< gist section-io-gists 02dba4113b8caf5da473 >}}

#### Block Access

{{< gist section-io-gists 12e0e35369e3b95ed996 >}}

#### Cache Everything

{{< gist section-io-gists 56391f3af9dff65dda36 >}}

#### Wordpress Caching

{{< gist section-io-gists 1a1ca70f1b0528442f8c >}}

For more information on how to write VCL, visit [Varnish](https://www.varnish-cache.org) documentation, where each version has its own user guide. Here is documentation for version [4.0](https://www.varnish-cache.org/docs/4.0/users-guide/vcl.html)

### How Varnish works with on section.io

At every opportunity, the implementation of Varnish on the section.io platform has been designed to be as close as possible to how it would be if you had installed Varnish yourself locally.

section.io uses the official Varnish distributions published by [Varnish Cache]. section.io does not use custom-compiled builds of Varnish.

Varnish is started, listening on port 80. Varnish will be initialised with the VCL found in the default.vcl file in the corresponding subdirectory of your section.io application repository.

Assuming Varnish is the first proxy in your proxy stack, Varnish will receive connections from the section.io TLS Offload Proxy with two additional HTTP request headers, X-Forwarded-For containing the downstream client IP address and any intermediate proxy IP addresses, and also X-Forwarded-Proto which will specify either http or https depending on the protocol with which the downstream client connected.

Issuing cache invalidation requests to Varnish is performed by sending a ban command to the Varnish management interface. section.io accepts any valid Ban expression and passes it to Varnish unaltered. We also provide some convenience tools to help
with removing particular urls from the cache, see our [Clearing the cache documentation](/docs/clearing-the-cache/) for more details.

Requesting the Varnish Log simply executes varnishlog for each Varnish instance and return the results.

Varnishncsa is also running, logging request and response details, including cache effectiveness. This data is used to drive the charts seen in Aperture.

## Modsecurity Configuration

The initial configuration in a repository starts ModSecurity’s SecRuleEngine in DetectionOnly mode (this writes log entries but never executes any disruptive actions) with rules from base\_rules & optional\_rules. This is a great starting point, as you can immediately see possible threats without stopping legitimate traffic to your site.

*Note:* Whilst many tutorials and guides use *Symbolic Links* to have content appear in the rules/activated\_rules directory, symbolic links complicate the use of source control & local development. It is recommended to copy files instead, and *never* use symbolic links in any section.io configuration.

To add a new rule set, copy the rule set .conf file into your rules/activated\_rules directory.

To remove a rule set, delete the corresponding .conf file from your rules/activated\_rules directory.

To edit a rule set, edit the text content of the corresponding .conf in your rules/activated\_rules directory.

There is also a GUI tool under Configuration&gt;Proxy in the application portal to help enable and disable rule sets.

For documentation see [Modsecurity](http://www.modsecurity.org/documentation.html) and [OWASP Modsecurity Rule Set Project](https://www.owasp.org/index.php/Category:OWASP_ModSecurity_Core_Rule_Set_Project).

### How ModSecurity work on section.io

At every opportunity, the implementation of ModSecurity on the section.io platform has been designed to be as close as possible to how it would be if you had installed ModSecurity yourself locally.

section.io uses the official ModSecurity distributions published by [Trustwave] running upon Apache. section.io does not use custom-compiled builds of modsecurity.

ModSecurity will be initialised with the configuration found in the modsecurity.conf file, and matching rule files at rules/activated\_rules/\*.conf under the corresponding subdirectory of your section.io application repository.

*Note:* Like other proxies in section.io, ModSecurity will sit between a TLS offload system accepting incoming connections, and an outbound proxy making upstream connections. Two additional HTTP request headers will be added to carry connection information, X-Forwarded-For containing the downstream client IP address and any intermediate proxy IP addresses, and also X-Forwarded-Proto which will specify either http or https depending on the protocol with which the downstream client connected.

### High Availability & ModSecurity State

To achieve high availability & performance in production, section.io will run multiple instances of your ModSecurity proxy stack. It’s important to consider that each instance is unaware of the internal state of other running instances.

A set of client requests will likely be spread across different instances, and any rules that track state (using setvar, setuid, setsid, etc) will likely act differently in a distributed environment.

### Enabling Protection

Every rule set can have false positives in new environments and any new installation should initially run with Detection only. After running ModSecurity in detection only mode for a while, review the logs and decide if any further modifications to the rule sets should be made before switching to protection mode.

To enabled protection edit the modsecurity.conf file and change the setting for SecRuleEngine from DetectionOnly to On.
