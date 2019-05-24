---
title: Run PageSpeed on Section
description: Using Google's PageSpeed inside Section.
keywords: content delivery network, CDN, pagespeed, reverse proxies, proxy, proxy template
aliases:
  - /pagespeed/
  - /how-to/pagespeed/

---

Because Section is the only CDN that offers you the choice of reverse proxy, you can choose to bring the PageSpeed Module created by Google into your reverse proxy chain. PageSpeed was created by Google to improve your website's performance by rewriting web pages and optimizing static assets. You can accomplish many things with PageSpeed like: optimizing images, minifying JavaScript and CSS files, defer JavaScript libraries, and much more. Below are the following steps you will need to take to get PageSpeed up and running within your [section.io](https://www.section.io) reverse proxy chain.

## Setting up PageSpeed in Section

To add PageSpeed to your reverse proxy chain, you must add it through the local [CLI](/docs/local-development), by running the following command within the directory of your repository:

    section append pagespeed:1.12.34.2

After running this command, you will notice a **pagespeed** directory within your repo containing two files named `http.conf` and `server.conf`.

In the `http.conf` place any PageSpeed directives that need to be specified at the nginx "HTTP" level, and place all other directives within the `server.conf` file.

## Using PageSpeed alongside Varnish

PageSpeed has it's own internal cache which causes problems when used alongside the Varnish Cache reverse proxy. You will need to add a VCL file [located here](https://gist.github.com/section-io-gists/dcda5a05d1006e3b8c8bd17e7105749c), to your `varnish` directory. You will then need to add the following code snippet above your `vcl_recv` block in your `default.vcl` file:

```
include "pagespeed-requirement.vcl";
```

### Deployment scenario 1

The example `pagespeed-requirement.vcl` from above will split user-agents in to five groups, each with different support for capabilities such as WebP, Lazy load images and different type of screensize. Be aware that this will also split Varnish Cache  up in to 5 different buckets to ensure user-agents with different capabilities are served only from the bucket that stored assets corresponding to those capabilities. This is great for high traffic sites despite the splitting of the cache. High traffic should ensure the caches are populated while also receiving the benefits of user-agent specific optimisations.

### Deployment scenario 2

If you would prefer higher Varnish Cache  hit rates as opposed to user-agent specific optimisations, then you should remove all the logic under `sub pagespeed_capability_detection` in `pagespeed-requirement.vcl` and replace it with a single line
```set req.http.PS-CapabilityList = "fully general optimizations only";```
This will only enable optimisations which will work on all user-agents and will not split the cache up in to multiple buckets. This is better for low traffic sites and/or if you wish to maximise cache hit rate, which in turn minimises load on the origin.

### Deployment scenario 3

This is in addition to scenario 1 or 2. Pagespeed also has an option called IPRO(In place resource optimisations) See [documentation](https://modpagespeed.com/doc/system#ipro). This allows pagespeed to optimise assets that are linked to from Javascript which does not support standard Pagespeed renamed assets. This option is enabled by default since Pagespeed version 1.9.32.1.

When IPRO is enabled, the URL for an asset such as `123.jpg` will not be changed to Pagespeed URLs such as `123.jpg.pagespeed.ce.3VC2ZiyLDo.jpg` in Javascript and will maintain the URL `123.jpg`. If the resource has not finished optimising, Pagespeed will send an `s-maxage=10` value in the Cache-Control header so Varnish Cache will only keep that asset for 10 seconds then recheck with Pagespeed if that asset is requests after 10 seconds. Once the asset is optimised, Pagespeed will send a much longer Cache-Control header so Varnish Cache will store the optimised asset for longer.

If you are experiencing issue with Javascript linked resources, you can turn off IPRO by using the following code in `server.conf`
```pagespeed InPlaceResourceOptimization on;```



## Basic Config

### Turning PageSpeed on and off

To turn PageSpeed on and off simply change **line 1** in your default `server.conf` file located in your **pagespeed** directory on your application repository:

If you want PageSpeed turned on:

    pagespeed On;

If you want PageSpeed turned off:

    pagespeed Off;

### Enable and disable filters

By default we have enabled only the specific filters listed in **EnableFilters**, not the PageSpeed **CoreFilters** on **line 7** of the default `server.conf` file.

    pagespeed RewriteLevel PassThrough;

This link [here](https://modpagespeed.com/doc/config_filters#enabling) provides a list of filters available with PageSpeed's **EnableFilters**. To enable or disable any of the filters just *append* or *remove* the filter name from **line 10** of the default `server.conf` file.

    pagespeed EnableFilters "add_head,combine_css,combine_javascript,convert_meta_tags,extend_cache,fallback_rewrite_css_urls,flatten_css_imports,inline_css,inline_import_to_link,inline_javascript,rewrite_css,rewrite_images,rewrite_javascript,rewrite_style_attributes_with_url";

## Debugging
If you wish to see debugging information about a certain page, perhaps trying to find out why an asset isn't being optimised by Pagespeed, you can view source on the page you are trying to debug. Then add this querystring `?PageSpeedFilters=+debug` to the view-source URL. If the URL of the page already contains querystrings, use `&PageSpeedFilters=+debug`. You should now see comments next to assets that indicate reasons why is was not optimised. e.g.

```<!--deadline_exceeded for filter CacheExtender--><!--deadline_exceeded for filter Javascript-->```
```<!--Resource headers are preventing rewriting of https://www.example.com/123.gif-->```

## Advanced Config

To learn how to configure PageSpeed, please check out the [PageSpeed config documentation](https://modpagespeed.com/doc/config_filters).

Below are a list of all the PageSpeed filters with links to instructions on how to properly implement them within your `server.conf` file. You will be following the **nginx** configuration instructions as PageSpeed is configured with **nginx** on [section.io](https://www.section.io).

* [Add Head](https://modpagespeed.com/doc/filter-head-add)
* [Add Instrumentation](https://modpagespeed.com/doc/filter-instrumentation-add)
* [Async Google AdSense](https://modpagespeed.com/doc/filter-make-show-ads-async)
* [Async Google Analytics](https://modpagespeed.com/doc/filter-make-google-analytics-async)
* [Canonicalize JavaScript Libraries](https://modpagespeed.com/doc/filter-canonicalize-js)
* [Collapse Whitespace](https://modpagespeed.com/doc/filter-whitespace-collapse)
* [Combine CSS](https://modpagespeed.com/doc/filter-css-combine)
* [Combine JavaScript](https://modpagespeed.com/doc/filter-js-combine)
* [Combine Heads](https://modpagespeed.com/doc/filter-head-combine)
* [Convert Meta Tags](https://modpagespeed.com/doc/filter-convert-meta-tags)
* [Deduplicate Inlined Images](https://modpagespeed.com/doc/filter-dedup-inlined-images)
* [Defer JavaScript](https://modpagespeed.com/doc/filter-js-defer)
* [Elide Attributes](https://modpagespeed.com/doc/filter-attribute-elide)
* [Extend Cache](https://modpagespeed.com/doc/filter-cache-extend)
* [Extend Cache PDFs](https://modpagespeed.com/doc/filter-cache-extend-pdfs)
* [Filters and Options for Optimizing Images](https://modpagespeed.com/doc/reference-image-optimize)
* [Flatten CSS @imports](https://modpagespeed.com/doc/filter-flatten-css-imports)
* [Hint Resource Preloading](https://modpagespeed.com/doc/filter-hint-preload-subresources)
* [Include JavaScript Source Maps](https://modpagespeed.com/doc/filter-source-maps-include)
* [Inline @import to Link](https://modpagespeed.com/doc/filter-css-inline-import)
* [Inline CSS](https://modpagespeed.com/doc/filter-css-inline)
* [Inline Google Fonts API CSS](https://modpagespeed.com/doc/filter-css-inline-google-fonts)
* [Inline JavaScript](https://modpagespeed.com/doc/filter-js-inline)
* [Inline Preview Images](https://modpagespeed.com/doc/filter-inline-preview-images)
* [Insert Google Analytics](https://modpagespeed.com/doc/filter-insert-ga)
* [Lazily Load Images](https://modpagespeed.com/doc/filter-lazyload-images)
* [Local Storage Cache](https://modpagespeed.com/doc/filter-local-storage-cache)
* [Make Images Responsive](https://modpagespeed.com/doc/filter-image-responsive)
* [Minify JavaScript](https://modpagespeed.com/doc/filter-js-minify)
* [Move CSS Above Scripts](https://modpagespeed.com/doc/filter-css-above-scripts)
* [Move CSS to Head](https://modpagespeed.com/doc/filter-css-to-head)
* [Optimize Images](https://modpagespeed.com/doc/filter-image-optimize)
* [Outline CSS](https://modpagespeed.com/doc/filter-css-outline)
* [Outline JavaScript](https://modpagespeed.com/doc/filter-js-outline)
* [Pedantic](https://modpagespeed.com/doc/filter-pedantic)
* [Pre-Resolve DNS](https://modpagespeed.com/doc/filter-insert-dns-prefetch)
* [Prioritize Critical CSS](https://modpagespeed.com/doc/filter-prioritize-critical-css)
* [Remove Comments](https://modpagespeed.com/doc/filter-comment-remove)
* [Remove Quotes](https://modpagespeed.com/doc/filter-quote-remove)
* [Rewrite CSS](https://modpagespeed.com/doc/filter-css-rewrite)
* [Rewrite Domain](https://modpagespeed.com/doc/filter-domain-rewrite)
* [Rewrite Style Attributes](https://modpagespeed.com/doc/filter-rewrite-style-attributes)
* [Run Experiments](https://modpagespeed.com/doc/module-run-experiment)
* [Sprite Images](https://modpagespeed.com/doc/filter-image-sprite)
* [Trim URLs](https://modpagespeed.com/doc/filter-trim-urls)
