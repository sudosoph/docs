---
title: Debug PageSpeed filters
description: How to debug PageSpeed filters
keywords: pagespeed, debugging
weight: 1
---

## Overview

If you wish to see debugging information about a certain page, perhaps trying to find out why an asset isn't being optimised by Pagespeed, you can view source on the page you are trying to debug. 

## Implementation

1. View the source of the page.
1. Add this querystring `?PageSpeedFilters=+debug` to the view-source URL. 
    * If the URL of the page already contains querystrings, use `&PageSpeedFilters=+debug`.
    
You should now see comments next to an assets that indicate reasons why is was not optimised. e.g.

```html
<!--deadline_exceeded for filter CacheExtender--><!--deadline_exceeded for filter Javascript-->
```

or 

```html
<!--Resource headers are preventing rewriting of https://www.example.com/123.gif-->
```