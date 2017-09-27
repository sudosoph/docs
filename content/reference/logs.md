---
title: HTTP Logs
description: Information on section.io logs including what information gets passed through logs.
keywords: logs, kibana, elasticsearch, website performance, page speed, webpage speed, website security, content delivery network, CDN
aliases:
  - /logs/

---

# HTTP Logs

section.io is built with operational visibility in mind. One aspect of this is providing you with access to detailed logs of your site's behavior on the section.io platform. You can find your logs by clicking the **HTTP Logs** link below the **Real Time** section in Aperture's left-hand side navigation menu.

All web access logs for all traffic flowing through the section.io proxies are stored in Elasticsearch and retained for 7 days. We provide you with direct access to Elastic's Kibana tool for querying your log data.

## Tutorial

*Coming soon!*

## Security Concerns

section.io records logs of the URLs and query strings of all requests. If your site uses the URL or query string to transmit sensitive information, please be aware that this data will be captured in the logs. If possible, consider changing your design to send the sensitive information in the request body, or unlogged request headers, instead. See also the [OWASP Code Review Top 9](https://www.owasp.org/index.php/The_Owasp_Code_Review_Top_9#Using_HTTP_GET_query_strings) and [CWE-598: Information Exposure Through Query Strings in GET Request](https://cwe.mitre.org/data/definitions/598.html) for more information.
