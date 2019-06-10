---
title: Add  Kraken to your proxystack
description: Adding Kraken to your Section proxy stack.
keywords: content delivery network, CDN, kraken, image optimization, reverse proxies, proxy, proxy template
weight: 1
---

## Overview

This tutorial will guide you through the process to adding the Kraken module to your proxy stack with default configuration files. This tutorial assumes you've cloned your application's git repository to your local machine.

### Step 1 - Updating section.config.json

1. Add the following object to your **proxystack** array in your **section.config.json** file located in the root of your repository.

```
{
    "name": "kraken",
    "image": "kraken:2.0.0"
}
```

{{% notice note %}}
You can add this module at any index in your proxystack array. We'd recommend adding this module behind Varnish Cache.
{{% /notice %}}

### Step 2 - Adding default files

1. Create a `kraken` directory in the root of your repository.
1. Create the following files under the **kraken** directory:
    * kraken.json

### Step 3 - Populate the kraken.json file

The `kraken.json` file will have the following format :

{{< gist section-io-gists c720b97f695ccabccf75c39239deb0c6 >}}

The `api_key` and `api_key_secret` will be provided to you by Section. You can contact us at support@section.io.

You can learn more about the different settings [here](/docs/modules/kraken/reference/kraken-advanced-config/).

### Step 4 - Deploy

Commit your changes and push them to the desired branch you are working on. If you run into any issues please contact support@section.io.