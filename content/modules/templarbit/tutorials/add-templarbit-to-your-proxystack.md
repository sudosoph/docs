---
title: Add Templarbit Shield to your proxystack
description: Adding Templarbit Shield to your Section proxy stack.
keywords: content delivery network, CDN,Templarbit Shield, WAF, security, reverse proxies, proxy, proxy template
weight: 1
---

## Overview

This tutorial will guide you through the process of adding the Templarbit Shield module to your proxy stack with default configuration files. This tutorial assumes you've cloned your application's git repository to your local machine.

### Step 1 - Updating section.config.json

1. Add the following object to your **proxystack** array in your **section.config.json** file located in the root of your repository.

```
{
    "name": "templarbit",
    "image": "templarbit-shield:latest"
}
```

{{% notice note %}}
You can add this module at any index in your proxystack array. We'd recommend adding this module in front of Varnish Cache.
{{% /notice %}}

### Step 2 - Adding default files

1. Create a `templarbit` directory in the root of your repository.
1. Create the following files under the **templarbit** directory:
    *templarbit-agent.json*

### Step 3 - Populate the templarbit-agent.json file

The `templarbit-agent.json` file will have the following format :

{{< gist section-io-gists 795b96cc45155b32485c9fe6b127cea9 >}}

The `property-id` and `secret-key` will be provided to you by Templarbit portal once you've registered. See https://www.templarbit.com/shield/

### Step 4 - Deploy

Commit your changes and push them to the desired branch you are working on. If you run into any issues please contact support@section.io.