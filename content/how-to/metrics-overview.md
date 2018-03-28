---
title: Monitoring
description: Step-by-step guide on how to use section.io metrics to analyze and improve your website performance and security.
keywords: metrics, grafana, graphite, kibana, varnish, modsecurity, website performance, website security, content delivery network, CDN
aliases:
  - /metrics-overview/

---

Logs and Metrics can be used to analyze your website and identify where you can focus resources to improve your site.

## Overview Page

In the Dashboard section of aperture, the first view you see is the Overview page which can be found under the **Content Delivery Grid** section on the left nav. The overview page starts by showing your stack, ie. how traffic flows through each of the proxies setup for your application. All stack’s begin with the edge proxy and ends with the origin proxy. The middle proxies selection and order can be configured using [advanced configuration](/docs/advanced-configuration/). The [log](#logs) view will allow you to see what traffic is passing through each proxy in more detail.

{{% figure src="/docs/images/proxy-stack.png" %}}

We also show you an overview graph that can be toggled between three metrics: Number of HTTP responses served per minute, Breakdown of error requests for the last hour, and Downstream response bandwidth served per minute. This data is pulled from Graphite in the [Metrics](#metrics) view, so you can go here to dig deeper into the data.

{{% figure src="/docs/images/http-response-count.png" %}}

Number of HTTP responses served per minute shows the total number of HTTP responses served per minute for your site, which represents the overall volume of traffic hitting your website. This includes all HTML content and all static resources like images & CSS files. You can use this graph to see traffic spikes to your website.

Breakdown of error requests for the last hour shows the error responses served to your users, broken down into 3XX (Redirections), 4XX (Client request errors) & 5XX (Server errors) errors. You can use this graph to see if there has been a recent increase in errors served which you can investigate using [Logs](#logs).

Downstream response bandwidth served per minute shows you the total amount of bandwidth sent to your customers. This represents the volume of data sent, not the count which is represented by HTTP responses, If you see this increasing but your number of HTTP responses is the same, then you may have increased the average size of content being requested. You can review the bandwidth by file type in [Metrics](#metrics) to see what may be causing this increase.

In addition to the overview graph, we also show data depending on whether your application is set up with [Varnish](#varnish) or [Modsecurity](#modsecurity).

#### Varnish

For Varnish we show Cache hit, pass and misses for the last hour and Upstream request bandwidth served per minute.

{{% figure src="/docs/images/varnish-cache-hit-miss-pass.png" %}}

Cache hit, pass and misses for the last hour shows the breakdown of how Varnish Cache handled your requests.  The higher the hit percentage, the faster your website will perform and the less work required by your servers. You can dig in deeper on the [Varnish Statistics](#varnish-statistics) view.


Upstream request bandwidth served per minute shows the volume of data sent by the origin proxy. The more content you cache using Varnish, the lower this will be. By lowering this number you decrease the amount of work required by your servers.  

#### Modsecurity

For Modsecurity we show Intercepts, audits and passes % for the last hour and Upstream request bandwidth served per minute.

{{% figure src="/docs/images/modsecurity-audits-intercepts.png" %}}

Intercepts, audits and passes % for the last hour shows you the breakdown of how Modsecurity handled your requests. Intercepted means that modsecurity blocked the request (a function that must be activated in your configuration). Audits means that modsecurity looked at the request based on the rules you have turned on. Passes means that modsecurity did not look at the request. You can dig in deeper on the [Modsecurity Statistics](#modsecurity-statistics) view.

Upstream request bandwidth served per minute shows the volume of data sent by the origin proxy. The more malicious requests you block using Modsecurity, the lower this will be. By lowering this number you decrease the amount of work required by your servers.

To dig into these metrics further, go to the [Metrics](#metrics) tab.

## Metrics (Monitoring)

When you open the Monitoring view, you first see the Grafana view. You can toggle between Grafana and Graphite by clicking on the buttons in the sub nav bar.

## Grafana

The Grafana view shows you aggregate level visualization using queries from Graphite. We’ve created 4 dashboards that can be accessed in the top right of the Grafana frame under the section "Content Delivery Grid."

{{% figure src="/docs/images/grafana-navigate-metrics.png" %}}

You can also toggle the display and time frame for each of the graphs just above the "Content Delivery Grid" button.

You can open up Grafana in a new window for better viewing by clicking “Open in new window” button at the top of the frame.

{{% figure src="/docs/images/grafana-new-window.png" %}}

#### Traffic Summary

The first view you will see is your "Traffic Summary," which is helpful for understanding your website's traffic overview. You will be able to see the amount of HTTP Requests served per minute and the corresponding bytes served per minute.

We also give you an overview of the HTTP responses served by status code, which is helpful for debugging errors. Following this chart is a break down of all client side errors (4xx status code) and server side errors (5xx status code).

#### Varnish Overview

The “Varnish Overview” dashboard, which is only has data viewable if you have a Varnish proxy setup on your application. These charts go into detail on the hit, miss, pass ratios and help you understand how  many of your requests are able to be handled by Varnish Cache.

A “hit” means that the cache was able to respond to the request. A “miss” means that the cache was checked for the the content but it wasn’t there and did not respond to the request (and subsequently sent the request to the server). A “pass” means that the cache was not checked for the content and the request went straight to the server.

These charts give you a good high level understanding of how much content you are serving from the cache. The higher the number of cache hits, the faster your website loads and the less work is required by your servers. You can increase the overall cache hit count by caching more content, which can be managed in your [Varnish proxy configurations](/docs/basic-configuration/#varnish).

#### Varnish Request Performance

The “Varnish Request Performance” dashboard goes detail on time to serve and bandwidth by hit type, content type, and response type. Here we start to go into detail on time to serve and bandwidth by hit type, content type, and response type.

Hit type refers to Hit, Miss or Pass. With time to serve, you can start seeing the impact a cache hit has on speed to deliver content and bandwidth required by your servers.

Content type refers to what kind of content was requested: images, html, css, etc. This gives you a good idea of what type of content takes the longest to serve and requires to most work from your servers. It should provide a good starting indication of where to focus your efforts on which type of content to cache.

Response type refers to how your website responded to their request. A 200 code means that the content was delivered successfully. A 3XX means there was a redirect. Since redirects load two different objects, they require more time and resources to deliver than a 200. If you see an increase in 3XX codes, you should review your redirects and see if they are necessary or if they can be removed. 4XX and 5XX codes mean that the content was not delivered successfully and they should be reviewed in [Logs](#logs) to understand how to fix the issue.

#### Varnish Cache Hit Rates
The “Varnish Cache Hit Rates” dashboard breaks down the overall hit rates by content type: HTML, Images, CSS, Javascript. This breaks down the overall hit rates by content type: HTML, Images, CSS, Javascript.

* HTML is the set of instructions required to load the page.
* Images are any images or icons you load.
* CSS is the style instruction for how to load images, text, and content on the page. And
* JS is small scripts your browser will run as when it is instructed to by the HTML.

For each content type, you can view your hit rates, volume of requests, and time to serve.

#### Modsecurity Statistics
The fourth view is Modsecurity Statistics, which is only viewable if you have a Modsecurity proxy setup on your application. Here you can see the total amount of traffic (count and bytes) that went through the Modsecurity proxy, the time in took to process each, your most active rules and most active countries.

<!-- ## Grafana - Custom Dashboards

It may be helpful for you to create a custom dashboard that is specific to your application. You can create your own dashboard by either starting from scratch or duplicating an existing dashboard.

### Creating a dashboard from scratch

To create a dashboard from scratch, you can click on the **Grafana** logo in the left hand corner `->` Open the **Dashboards** dropdown `->` and clicking on **New**. From there you can select the type of panel you want to display (Graph, singlestat, table, pie chart, etc).

{{% figure src="/docs/images/add-dashboard-scratch.png" %}}

### Duplicating an existing dashboard

To create a dashboard from an existing dashboard you will have to click on the **cog** wheel at the top of the screen and click on **Save as...** `->` updating the name `->` and click **save**.

In order for these changes to be permanent you **MUST** remove the `system` tag from this dashboard. To do this you will need to click on the same **cog** wheel, and click on **Make editable**. This will allow you to make changes in the dashboard. Then you will need to click on the same **cog** wheel `->` then **Settings**. In the section called **tags**, you will want to remove the **system** tag (image below).

{{% figure src="/docs/images/add-dashboard-duplicate.png" %}} -->

<!-- ## Graphite

By toggling the view at the top of the screen from "Grafana Dashboards" to "Graphite Metrics", you can pull your own data using the same data source. Each Grafana chart is built on these data points so you can use these create your own Grafana dashboards. You can click “Open in new window,” located at the top of the frame, to have more space to work.

You will see some folder on the left with different environments. The first environment will usually be your production environment, the second your development environment, and then any other environments. To see production data for Varnish, you would go to the first environment > section hosted > varnish.

{{% figure src="/docs/images/graphite-metrics-folders.png" %}}

You can use this data to create graphs. For example: Varnish > content_type > text-html > status > 200 > time_taken > mean will show me the mean time it took to serve a successful html doc.

{{% figure src="/docs/images/graphite-metrics-create-graph.png" %}}

By clicking “Graph Data” under the graph, I can edit the data in the graph. For instance, “edit” allows me to manually update the query and if I replace “text-html” with “\*” it will show me all content types, not just html docs. Keep in mind when you edit, Graphite will try to auto fill your response. You can click out of the drop down to have it keep your entered text (required when using \*), or you can select from the drop down.

{{% figure src="/docs/images/graphite-metrics-edit-graph.png" %}}

You can also “apply function” to the data which can sum different queries, change the time interval for the data points, add a second axis, change legends, and much more.

The “Graph Options” button under the graph will let you change the look of the graph. Clicking the clock or calendar icon above the graph will allow you to change the time range of the data. There is so much more you can do here, and you can follow the Graphite documentation to manipulate the data in the way that you need. This documentation for available functions is a great one to review.  https://graphite.readthedocs.io/en/latest/functions.html -->

<!-- ## HTTP Logs

Clicking on "HTTP Logs" in the left navigation bar opens up a view of Kibana. Kibana will allow you to search through your logs to dig deeper into trends you found in Graphite or Grafana. To open Kibana in its own window, click the “open in new window” button at the top of the Kibana frame.

On the Discover view in Kibana, you can either select items from the left nav, or type searches into the search bar. Here are a fields that are useful to know:

* **varnish_handling** - will add a column and show you whether a log was a hit or a miss.
* **varnish_handling: “miss”** - will show all logs that were misses
* **content_type** - shows you whether the content was image, html, js, etc
* **status** - shows response code (200, 3XX, 4XX, etc)
* **_type** - will indicate if the log was for varnish, origin proxy, last proxy, etc
* **scheme** - will indicate if the request was HTTP or HTTPS

You can then take these searches and turn them into different Graphs in the “Visualization” view. Then you can save these visualizations to a Dashboard to view later under the “Dashboard” view.

If you want to analyze your website using GRaphite, start by grouping metrics such as error rates, cache hit and miss rates and then apply functions to help smooth data points for bigger trends or show variance between individual data sets. -->
