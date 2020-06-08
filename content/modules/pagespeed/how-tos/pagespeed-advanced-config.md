---
title: PageSpeed Advanced Configuration
description: More advanced configuration using PageSpeed
keywords: pagespeed, configuration
weight: 1
aliases:
  - /modules/pagespeed/reference/pagespeed-advanced-config/
---

## Overview

To learn how to configure PageSpeed, please check out the [PageSpeed config documentation](https://modpagespeed.com/doc/config_filters).

Below are a list of all the PageSpeed filters with links to instructions on how to properly implement them within your **server.conf** file. You will be following the **nginx** configuration instructions as PageSpeed is configured with **nginx** on [Section](https://www.section.io).

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
