---
title: Add Virtual Waiting Room to your proxystack
description: How to set a limit on the number of visitors your site can safely handle.
keywords: traffic management,virtual waiting room, traffic spikes, vwr
aliases:
  - /overload-prevention/
  - /how-to/installing-virtual-waiting-room/
  - /modules/virtual-waiting-room/tutorials/installing-virtual-waiting-room/
  - /modules/virtual-waiting-room/tutorials/

---

# Overview

This tutorial will guide you through the process to adding the Virtual Waiting Room module to your proxy stack with default configuration files. This tutorial assumes you've cloned your application's git repository to your local machine.

### Step 1 - Updating section.config.json

1. Add the following object to your **proxystack** array in your **section.config.json** file located in the root of your repository.

```
{
    "name": "virtualwaitingroom",
    "image": "virtualwaitingroom:1.0.0"
}
```

{{% notice note %}}
You can add this module at any index in your proxy stack array. We'd recommend adding this module as the first module in the proxy stack.
{{% /notice %}}

### Step 2: Add GoSquared Credentials

First, you need to add a file to the root of the repository called:
`gosquared-visitor-count`

The contents of file should be:
`<threshold> <ID> <secret> varnish <hostname> <api_key>`

You can learn more about the contents of the file [here](/docs/modules/virtual-waiting-room/reference/go-squared-credentials/).

### Step 3: Add a Virtual Waiting Room folder.

In the root of your repository, add a folder titled `virtualwaitingroom` with the following files :

- `virtualwaitingroom.json`
- `waiting-room.html`


To setup these files please see the [Virtual Waiting Room Advanced Configuration](/docs/modules/virtual-waiting-room/reference/virtual-waiting-room-advanced-configuration/) section and contact Section support at support@section.io for the relevant API key.

### Step 4: Add GoSquared script provided by Section.

We will provide a gosquared script to be inserted in all pages of the website except the waiting room page. This script has to be inserted in the `<head>` tag and is used for tracking the number of users on the site. Since the script is fired after the *onLoad* event it does not affect the performance of the website.

### Step 5 - Deploy

Commit your changes and push them to the desired branch you are working on. If you run into any issues please contact support@section.io