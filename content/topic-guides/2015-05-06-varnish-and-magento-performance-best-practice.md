---
title: Varnish and Magento Performance Best Practice
description: Review of Magento Performance Options Using Varnish
keywords: magento performance, Varnish Cache, varnish install, web page performance, magento, speed up magento
date: 2015-05-06
author: Matthew Johnson
---


## Overview

In this article we will work through ways you can speed up your Magento implementation using Varnish Cache.

Magento performance is a common issue for many businesses. There have been a number of products developed to try to improve Magento performance, Most of these products rely on Varnish Cache (the defacto standard for HTTP acceleration).

We will provide insight into a number of options to improve Magento performance below, Each have pro's and con's. Our recommended pattern for Magento Varnish optimisation is listed last.
  
  
### Core HTML caching concept - Hole Punching (Or removing personalisation)
Before we begin to look at options there is a core concept that is important to understand. The concept of hole punching details how personalised information (Such as the shopping cart status or "Hello Bob") is removed from the document HTML to make the document generic (and Cacheable!).

There are 2 main methods available for hole punching dynamic content:
  
  
* ESI - This uses the Varnish Edge Side Includes (ESI) feature to mark portions of page HTML that will be requested from the origin servers every time, With the rest of the page content then being cacheable.

* AJAX - The HTML page that is served is a generic page that is the same for every user (and hence very cacheable). Where personalised content is required (Such as to say "Hello Bob" at the top of a page) a separate request is made to the origin application to get the personalised content and this is applied to the HTML in the page load process.
  
    
      
## Turpentine
Turpentine is a full page cache extension for Magento, It integrates tightly with Varnish and offers the user the ability to control Varnish configuration from within the Magento (The Turpentine extension pushes VCL updates out when configuration is changed inside the Magento Admin portal).

The default hole punching option for Turpentine is ESI. Its recommended to switch this to use AJAX whenever possible as this opens up additional Varnish caching strategies (Detail below).

Turpentine is a popular choice for Magento optimisation. The deployment model of controlling all configuration from within Magento Admin makes it attractive to those that dont want to get their "hands dirty" in Varnish.

Pros:


* Easy management once implemented (Magento Admin)

Cons:


* Requires restructure of your application environment to accomodate Varnish sitting infront of your application
* Blackbox in terms of how well the extension is performing - Requires a separate Varnish metrics / management strategy
* Tightly coupled interface to Magento means frequent cache invalidation - reduces cache hit rates

[Turpentine further details](https://github.com/nexcess/magento-turpentine)

## Phoenix Page Cache

Phoenix Page Cache is a Magento module that controls HTML page cacheability from within the Magento Admin portal. The implementation provides you with a static VCL that you need to use as a replacement for the Varnish default.vcl file.

The out of the box installation does not support personalised content (Eg "Hello Bob" or cart status), This limits the effectiveness of the module as personalisation is commonly used on all Magento pages.
    
There is an additional feature in the Enterprise edition that supports ESI tags for hole punching personalised content. This enables better cache hit rates.


Pros:


* Easy management once implemented (Magento Admin)

Cons:


* Requires purchase of Enterprise edition to enable ESI tags (Cache hit rates will be almost non existant without this)
* Tightly coupled interface to Magento means frequent cache invalidation - reduces cache hit rates


[Phoenix Page Cache further details](https://github.com/PHOENIX-MEDIA/Magento-PageCache-powered-by-Varnish)


## Lesti FPC

This is an option that does not leverage Varnish to manage the HTML cache. The extension is implemented on your Magento instance and stores components of the page in a file structure that is defined according to the rules you have setup to vary the cache by.

Personalised content is supported via defining which areas are hole punched.

Whilst this implementation is simpler, driving an effective performance outcome becomes harder as you have no visibility into cache hit rates and how well the solution is working overall.

Pros:


* No Varnish install required

Cons:


* No visibility into performance of the module
* Varnish is a specialised HTTP cache designed for HTTP Acceleration. Trying to recreate this functionality and achieve the same performance / visibility is going to be a significant challenge
* Tightly coupled interface to Magento means frequent cache invalidation - reduces cache hit rates

[Lesti FPC further details](https://gordonlesti.com/projects/lestifpc/)

## section.io - Pure Varnish pattern

This Magento Performance option leverages Varnish alone (No Magento modules required). The concept that's implemented in this approach is to decouple the Magento implementation from the Varnish server.

All too often agreessive cache clearing is a cause of poor performance as content that is safe to remain in cache is evicted before it should be.

Our implementation approach is to configure rules in Varnish to cache pages for a specific period of time. There is no requirement for Magento integration as you define different cache times for different types of pages (eg Homepage, Category Page, Product Page) using a variety of methods.

Here are some of options to define how long to cache pages:


* Have your application send an appropriate cache control header with each response
    
    For example: "Cache-Control: s-maxage" using s-maxage is a reverse proxy specific directive that enables intermediate caches (ie. Varnish) to follow the cache time set here. 
    Other devices (such as browsers) would then follow the standard max-age directive in responses
* Configure rules in your VCL to cache different URL structures

This design requires hole punching to be implemented (Preferably via AJAX)

Pros
* Very high cache hit rates

Cons
* Requires hole punching to be implemented in your application (Preferably via AJAX)
  
    
[Further details - Sign up to www.section.io](/)

## Summary
Magento optimisation is a significant topic. The Varnish solution you choose to deploy needs to consider the speed, effectiveness and architectural best practices you require.

Using section.io it's possible to support all of these Magento options and have the setup, configuration and metrics you require available in seconds. This places you in an ideal situation to be able to tune and extract the most value from whichever solution works for you and best of all it's free until you start to use a serious amount of data. Check it out if you want a quick Varnish win - [www.section.io](www.section.io)

