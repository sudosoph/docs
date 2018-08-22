---
title: Install A New Proxy
description: How to install a new proxy within an existing proxy configuration.
keywords: proxy, installation

---
## The section.config.json file
The config files dictates the order that traffic will flow through the proxy chain — be aware of the location you put the new reverse proxy in.

For example, if your application is setup with Varnish Cache 4.0.3, you should see this at the top of your config file:

	"proxychain": [
	        {
	            "name": "modsecurity",
	            "image": "modsecurity:2.2.7"
	        }
	    ]

## 1) Add the proxy to your environment's section.config.json file
Let's add Varnish Cache 6.0.0 to the example above. You can find a list of current proxies [here]({{< relref "reference/proxy-list.md" >}})

To add a proxy, we need to insert a json object containing the proxy's name and image (the specific version of the proxy you want). After adding the Varnish Cache proxy, our file looks like:

	"proxychain": [
	        {
	            "name": "modsecurity",
	            "image": "modsecurity:2.2.7"
	        },
	        {
	            "name": "varnish",
	            "image": "varnish:6.0.0"
	        }
	    ],

Note that different proxies have different ways of specifying the image.  

## 2) Deploy your new configuration
Once you've made the above changes to your configuration files, you're going to need a section.io engineer to deploy the new configuration. Once you've changed the config.json file to your liking, please send us a [support ticket](https://support.section.io/hc/en-us/requests/new) so we can push those changes live for you.
