+++
title = "Advanced Configuration"
description = ""
weight = 1
+++

When you are ready to start creating more advanced configurations for your proxies, you can start editing the configuration files directly. All of the files in your repository can be accessed by visiting Repository under the Configuration menu in the left nav of Aperture.

In the repository you can see all the files in your repository, commits to those files, stats, and a branching diagram. All of your advanced configuration for Varnish cache or Modsecurity will be done by editing the files here.

Inside Advanced Config, you should see one folder for every reverse proxy set up for your application and one 'section.config.json' file, where you can add additional reverse proxies to your stack. If you want to add a new reverse proxy to your stack, check out our [how-to guide](/docs/how-to/install-a-new-proxy).

{{% children %}}
