---
title: Enable or disable PageSpeed filters
description: Enable or disable PageSpeed filters
keywords: pagespeed, filters, enable, disable
weight: 1
---

## Overview

By default we have enabled only the specific filters listed in **EnableFilters**, not the PageSpeed **CoreFilters** on **line 7** of the default `server.conf` file.

```nginx
pagespeed RewriteLevel PassThrough;
```

### Implementation

This link [here](https://modpagespeed.com/doc/config_filters#enabling) provides a list of filters available with PageSpeed's **EnableFilters**. To enable or disable any of the filters just *append* or *remove* the filter name from **line 10** of the default **server.conf** file.

```nginx
pagespeed EnableFilters "add_head,combine_css,combine_javascript,convert_meta_tags,extend_cache,fallback_rewrite_css_urls,flatten_css_imports,inline_css,inline_import_to_link,inline_javascript,rewrite_css,rewrite_images,rewrite_javascript,rewrite_style_attributes_with_url";
```