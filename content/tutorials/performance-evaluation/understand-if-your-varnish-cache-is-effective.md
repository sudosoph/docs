---
title: Understand if your cache is effective
description: Guide for evaluating your website performance and how to use section.io to make improvements.
keywords: cache, https, website performance, page speed, webpage speed, website security, content delivery network, CDN
weight: 1
---

**What is it?:** How effectively customer requests are being answered by the cache. A hit means that the request was answered by the cache. A miss means that the request went to the cache but could not answer the request. A pass means that the request didn’t look at the cache to answer the request. The goal is to increase Hit % and decrease Miss and Pass %. A good starting goal would be 50% Hit.

**Why do you care?:** When a customer request is answered by the cache, the request did not need to be answered by your website server. This improves page load time for your users which can increase revenue and decreases work required by your servers which reduces cost.

**How do you see it?:** This is the first chart we show you on the section.io dashboard. For the Bootcamp application, the url is [here](https://aperture.section.io/account/1/application/1/environment/Production/overview).


![/assets/images/docs/varnish-cache-usage-metrics.png](/assets/images/docs/varnish-cache-usage-metrics.png)

For more detailed information, such as the absolute number of requests and size of those requests, you can view Trending Metrics [here](https://aperture.section.io/account/1/application/1/environment/Production/metrics##1).

##### **2 Content Type Caching** - Discover your quick cache wins

**What is it:** Your website has several different types of content that can be cached: HTML, Images, CSS, and JS are the main file types for consideration.

* HTML is the set of instructions required to load the page.
* Images are any images or icons you load.
* CSS is the style instruction for how to load images, text, and content on the page. And
* JS is small scripts your browser will run as when it is instructed to by the HTML.

You can view your hit rates, volume of requests, and time to serve for each of these different content types.

**Why do you care?:** Understanding which types are being requested the most, require the most time to serve, and are being cached the most frequently helps you understand where your quick wins are to get started optimizing your cache configurations.

Most of the time, images and CSS will be the easiest to get some cache wins and HTML is the most likely to give you your biggest performance and scalability wins as the hit rate increases.

**How do you see it?:** There are two dashboards in Grafana under `Real Time -> Monitoring` to understand content type caching.

First, is request performance which shows throughput and time to serve by status. You can access this for Bootcamp [here](https://aperture.section.io/account/1/application/1/grafana-web).

![/assets/images/docs/content-type-cache-performance-metrics.png](/assets/images/docs/content-type-cache-performance-metrics.png)

Second, is asset cache hit rates which shows the hit rate by content type. You can access this for Bootcamp [here](https://aperture.section.io/account/1/application/1/grafana-web).

![/assets/images/docs/content-type-hit-rate.png](/assets/images/docs/content-type-hit-rate.png)

##### **3 Secure Delivery** - Uncover how often you are using HTTPS

**What is it?:** HTTP is a protocol for how web requests are handled. HTTPS is an enhanced version of that protocol to add security by encrypting your customers data so it is protected from threats. You can see when a webpage has HTTPS because the url will show a green padlock.

**Why do you care?:** The percentage of requests that have HTTPS show how often your customer data is protected. If this ratio is low, you are putting your customers’ data at a higher risk for incident.  Websites which serve entirely over HTTPS can also take advantage of the performance benefits of HTTP/2 and will be ranked higher by Google in search results.

**How do you see it?:** You can your websites breakdown of HTTP vs HTTPS by going into your logs. To build a nice pie chart, you want to filter by `_type:edge-access-log` which limits the count to only requests to the edge proxy and then split by `scheme` which indicates HTTP or HTTPS. You can see this for Bootcamp [here](https://aperture.section.io/account/1/application/1/kibana/#/visualize/create?_a=(filters:!(),linked:!f,query:(query_string:(analyze_wildcard:!t,query:'*')),vis:(aggs:!((id:'1',params:(),schema:metric,type:count),(id:'2',params:(filters:!((input:(query:(query_string:(analyze_wildcard:!t,query:'_type:edge-access-log'))))),row:!t),schema:split,type:filters),(id:'3',params:(field:scheme,order:desc,orderBy:'1',size:5),schema:segment,type:terms)),listeners:(),params:(addLegend:!t,addTooltip:!t,isDonut:!f,shareYAxis:!t),type:pie))&indexPattern=account1-app1-*&type=pie&_g=()). (note our Bootcamp application is showing a low HTTPS ratio)

![/assets/images/docs/https-ratio-kibana.png](/assets/images/docs/https-ratio-kibana.png)


-------

##### **Completed all 7 steps?**

Awesome! Steps 5 through 7 are meant to be an iterative process. Focus on big wins first using your metrics evaluation. Then after you’ve improved those areas, you can focus on other areas to fine tune.


##### **How do I know if I’ve been successful?**

* You have improved your Cache Hit Rate
* You have ensured your most requested content is being cached
* You have increased the ratio of HTTPS on your site
* Because you’ve achieved these three goals, you see your customers bouncing less frequently and viewing more pages on your website - which will translate into more revenue for you! Congrats!

##### **Need Help?**

section.io is here to help with setup and can be reached by emailing contact@section.io. If you want help with configuration you can ask us about consulting engagements, and if you want a fully managed service please contact us for a quote.
