---
title: Alerting
description: Guide for setting up alerts on section.io metrics to monitor your website.  
keywords: metrics, alerting, alerts, monitor, umpire, new relic, pingdom, website performance, website security, content delivery network, CDN
---
Monitoring and Alerting
=======================

section.io is designed to easily integrate with your existing synthetic monitoring solution. We have tested with [New Relic], [Pingdom], [Site 24x7] and other popular options.

For each section.io application, we host an Umpire endpoint that enables you to build URLs which will respond with a HTTP 200 OK or a HTTP error response based upon your chosen metrics meeting your defined thresholds.

For example, you could configure an Umpire URL that will return a healthy HTTP response whilst the count of errors served by your application remains below an average of 2-per-minute for the last 5 minutes.

Such an example Umpire URL would look similar to this:

    .../umpire/check?metric=environment_X.all_regions.downstream_response.status_500_to_599.count&max=2&range=300

You can then configure your synthetic monitoring solution to hit this Umpire URL on a regular interval and to alert you when it fails, ie when your application has begun serving too many errors.

The Umpire URLs are secured with HTTP Basic Authentication and you will find your section.io application’s Umpire credentials, and a tool to help configure a suitable Umpire URL, in section.io Aperture’s Alerting page.

The full set of section.io metrics is available for you to use with Umpire. This is the same set driving the Overview page and the Grafana dashboards in Aperture. You can browse the full set of metrics via your application’s section.io-provided Graphite Web interface.

As another example, you could use a metric tracking the Varnish cache hit ratio of HTML responses and fire an alert if it becomes too low. This enables you to respond to changes in your web applications behavior that are more relevant to the overall user experience and not limited to ‘is the site down?’.

The Umpire component of section.io *is just Umpire* and you can read more about the [Umpire project], itself here.

  [New Relic]: https://newrelic.com
  [Pingdom]: https://www.pingdom.com
  [Site 24x7]: https://www.site24x7.com
  [Umpire project]: https://github.com/heroku/umpire#umpire
