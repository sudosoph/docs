---
title: Kraken - Image Optimization
description: Using the Kraken Image Optimization module inside Section.
keywords: image optimization, kraken
aliases:
  - /kraken/

---

Use Kraken.io to optimize images and reduce page weight and load time.

Deploying the Kraken edge module on Section’s Edge Compute Platform means you will immediately have access to Kraken Enterprise and all the advanced image optimization features included:

- Reduce page weight without sacrificing image quality
- Speed up page delivery
- Take workload off the marketing department and let Kraken manage image size and quality
- Optimize browser rendering

Image optimization for the web is one of the most important elements of delivering faster pages. Having large image files or a high number of individual images can significantly impact load times, and unrendered images result in poor user experience. Kraken optimizes all common image file types by compressing them so that visitors receive images that work best with their device type and browser. Kraken also resizes images on the fly.

To see how Kraken can reduce image sizes by 50% or more, visit the [Kraken docs](https://kraken.io/docs/getting-started).

## Setting up Kraken in Section


Contact Section support. Our engineers will setup your site on the Section platform with the Kraken module.


## Kraken Module Settings

Once your application has been set up with Kraken you will find the following settings under `Advanced Config > kraken` in the Aperture portal. We will go over these settings under Operations.

{{< gist section-io-gists c720b97f695ccabccf75c39239deb0c6 >}}

---

## Operations

### Change the optimized image quality

You can control the optimized image quality by changing the following settings :

`"lossy" : "true/false"`

Enable disable lossy compression.

`"quality" : 1 - 100`

 This options will only be used if the LOSSY option is set to true. Can be a number in the range of 1 - 100. If the quality option is not provided it will default to "auto" where Kraken will optimize the images based on their characteristics.


### Clear Kraken Cache

`"cache_version" : "v1"`

You can update the "cache_version" to clear the entire Kraken cache.

To clear the cache for an individual URL you can use our API: https://aperture.section.io/api/ui/#!/Proxy/proxyStatePost

with the `proxyName` as Kraken and the URL of the image as the `banExpression`.

You can also clear the cache for the URL using the Aperture portal. The feature is an option available under `Clear Cache > kraken`

{{% figure src="/docs/images/kraken-cache-clear.png" %}}

When using Kraken behind Varnish be sure to [clear the Varnish cache]({{< relref "how-to/varnish-cache/clearing-the-cache.md" >}})  to see the updated image.

### Set the Cache-Control time

`"ttl" : <time>`

Sets as cache-control maxage in the response headers sent downstream

### Enabled/Disable Kraken

`"enabled" : true/false`

You can enable/disable image optimization by changing the value for the "enabled" option. When in a disabled state the module acts as a reverse proxy.

### Store images in an S3 bucket

Section provides free storage for optimized images. If you want the optimized images to be stored in your own S3 bucket we can set it up for you.

---

## Other things to note
The Section platform writes a log for each HTTP request that passes through Kraken. These will be available in our powerful Kibana interface alongside logs from all of the other proxies in your stack.
