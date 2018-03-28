---
title: Make a Custom Graphana Dashboard
description: Create custom dashboards that are specific to your application.
keywords: data visualization, Graphana

---
## Grafana - Custom Dashboards

It may be helpful for you to create a custom dashboard that is specific to your application. You can create your own dashboard by either starting from scratch or duplicating an existing dashboard.

### Creating a dashboard from scratch

To create a dashboard from scratch:  

1. Click on the **Grafana** logo in the left hand corner.  
2. Open the **Dashboards** dropdown.  
3. Click on **New**.  
4. Select the type of panel you want to display (Graph, singlestat, table, pie chart, etc).  

{{% figure src="/docs/images/add-dashboard-scratch.png" %}}

### Duplicating an existing dashboard

To create a dashboard from an existing dashboard:  

1. Click on the **cog** wheel at the top of the screen  
2. Click on **Save as...**  '
3. Updating the name  
4. Click **save**.

In order for these changes to be permanent you **MUST** remove the `system` tag from this dashboard. To do this:  

1. Click on the same **cog** wheel as before  
2. Click on **Make editable**. This will allow you to make changes in the dashboard.  
3. Click on the **cog** wheel and then **Settings**. In the section called **tags**, you will want to remove the **system** tag (image below).


{{% figure src="/docs/images/add-dashboard-duplicate.png" %}}
