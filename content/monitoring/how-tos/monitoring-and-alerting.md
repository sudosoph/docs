---
title: Set up alerting with metrics
description: Guide for setting up 3rd party alerts on Section to monitor your website.  
keywords: metrics, alerting, alerts, monitor, umpire, new relic, pingdom, website performance, website security, content delivery network, CDN
aliases:
  - /monitoring-and-alerting/
  - /topic-guides/monitoring-and-alerting/

---

Section is designed to easily integrate with your existing synthetic monitoring solution. We have tested with [New Relic], [Pingdom], [Site 24x7] and other popular options.

For each Section application, we host an Umpire endpoint that enables you to build URLs which will respond with a HTTP 200 OK or a HTTP error response based upon your chosen metrics meeting your defined thresholds.

For example, you could configure an Umpire URL that will return a healthy HTTP response whilst the count of errors served by your application remains below an average of 2-per-minute for the last 5 minutes.

Such an example Umpire URL would look similar to this:

    .../umpire/check?metric=environment_X.all_regions.downstream_response.status_500_to_599.count&max=2&range=300

You can then configure your synthetic monitoring solution to hit this Umpire URL on a regular interval and to alert you when it fails, ie when your application has begun serving too many errors.

The Umpire URLs are secured with HTTP Basic Authentication and you will find your Section application’s Umpire credentials, and a tool to help configure a suitable Umpire URL, in Section Aperture’s Alerting page.

The full set of Section metrics is available for you to use with Umpire. This is the same set driving the Overview page and the Grafana dashboards in Aperture. You can browse the full set of metrics via your application’s Section-provided Graphite Web interface. For a more in depth guide on how to find and explore available metrics to alert on, see [this guide on using graphite](/docs/monitoring/overview/graphite/_index.md).

As another example, you could use a metric tracking the Varnish Cache  hit ratio of HTML responses and fire an alert if it becomes too low. This enables you to respond to changes in your web applications behavior that are more relevant to the overall user experience and not limited to ‘is the site down?’.

The Umpire component of Section *is just Umpire* and you can read more about the [Umpire project], itself here.

  [New Relic]: https://newrelic.com
  [Pingdom]: https://www.pingdom.com
  [Site 24x7]: https://www.site24x7.com
  [Umpire project]: https://github.com/heroku/umpire#umpire
