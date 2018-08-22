---
title: Graphite Monitoring 
description: An overview of the Graphite tool and its application within the section.io platform
keywords: monitoring, graphite, metrics, logs
aliases:
  - /graphite/
---

  ## Graphite

By toggling the view at the top of the screen from "Grafana Dashboards" to "Graphite Metrics", you can pull your own data using the same data source. Each Grafana chart is built on these data points so you can use these create your own Grafana dashboards. You can click “Open in new window,” located at the top of the frame, to have more space to work.

You will see some folder on the left with different environments. The first environment will usually be your production environment, the second your development environment, and then any other environments. To see production data for Varnish, you would go to the first environment > section hosted > varnish.

{{% figure src="/docs/images/graphite-metrics-folders.png" %}}

You can use this data to create graphs. For example: Varnish Cache > content_type > text-html > status > 200 > time_taken > mean will show me the mean time it took to serve a successful html doc.

{{% figure src="/docs/images/graphite-metrics-create-graph.png" %}}

By clicking “Graph Data” under the graph, I can edit the data in the graph. For instance, “edit” allows me to manually update the query and if I replace “text-html” with “\*” it will show me all content types, not just html docs. Keep in mind when you edit, Graphite will try to auto fill your response. You can click out of the drop down to have it keep your entered text (required when using \*), or you can select from the drop down.

{{% figure src="/docs/images/graphite-metrics-edit-graph.png" %}}

You can also “apply function” to the data which can sum different queries, change the time interval for the data points, add a second axis, change legends, and much more.

The “Graph Options” button under the graph will let you change the look of the graph. Clicking the clock or calendar icon above the graph will allow you to change the time range of the data. There is so much more you can do here, and you can follow the Graphite documentation to manipulate the data in the way that you need. This documentation for available functions is a great one to review.  https://graphite.readthedocs.io/en/latest/functions.html
