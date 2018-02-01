---
title: How to clear the cache using the API
---

1. From the management console, click **API** in the top menu.
![API Link](/docs/images/screenshots/menu/highlight-api-option.png?height=80px)
1. Click **Show/Hide** on **Proxy**, then click on the **POST** method ending with **state**.
![Varnish Cache Clear API Method](/docs/images/screenshots/swagger-ui/highlight-varnish-cache-clear-api-operation.png?height=80px)
1. Enter your **account id**, **application id**, **environment name**, and **proxy name**.<br/>These can be obtained from the URL in the management console. Your **proxy name** is probably `varnish`.
![Varnish Cache Clear API Example Inputs](/docs/images/screenshots/swagger-ui/example-varnish-cache-clear-api-inputs.png?height=80px)
1. Click **Run**.
1. Now, you'll see information about how you can integrate the API call into your systems.