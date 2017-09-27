---
title: API
description: Guide for section.io API including definition, authentication, and version.
keywords: API, Swagger, cURL, content delivery network, CDN
aliases:
  - /api/
---

Overview of the key entities and account structure referred to throughout section.io

Introduction
------------

The section.io API makes it easy to automate gathering information and performing actions on your stack.

All production API requests are made to: `https://aperture.section.io/api/<version>`

Although you don’t *need* to use it, the section.io API definition is provided in Swagger notation. Swagger is a specification and tool ecosystem for describing, producing, and consuming RESTful web services. You can find out more about Swagger at <http://swagger.io/>

Authentication
--------------

All of our API endpoints support Basic credentials. See https://en.wikipedia.org/wiki/Basic_access_authentication for more information.

Use the username and password that you use to login to the section.io management interface.

`curl` examples will need to have `-u username:password` added to them. For example, `curl -X GET -u username:password --header "Accept: application/json" "https://aperture.section.io/api/v1/account"`.

Trust
-----

The API endpoint (https://aperture.section.io/api) requires TLS v1.1 or later. Older SSL/TLS clients may need to explicitly specify the latest TLS version when connecting or may need to be upgraded.

We strongly encourage client-side verification of the certificate presented by the API during the TLS handshake. This verification may fail for older clients with an outdated root certificate authority trust list. The best resolution is to update the client's trusted CAs - we do *not* recommend disabling peer verification.

A recent CA list usable with cURL, PHP, Ruby and similar API clients is available from the cURL website at <https://curl.haxx.se/docs/caextract.html>.

Version
-------

The current version of the API is v1. Backwards incompatible changes will result in a version increment.

API definition
--------------

The interactive API definition is available online at <https://aperture.section.io/api/ui/>

N.B. The current version of Swagger UI does not support Basic Authentication. `curl` examples will need to have `-u username:password` added to them.
