---
title: Set up Real User Monitoring
description: section.io's real user monitoring
keywords: content delivery network, CDN, rum, performance, baseline, testing
aliases:
  - /rum/

---
section.io offers free real user monitoring for any customer that signs up and begins their trail. This enables you to see how your own visitors are experiencing your website performance with the use of a simple JavaScript snippet. Data includes:

* Back end, front end, and full page load time
* Throughput
* Traffic by user agent (browser, device type)

## Setting up RUM in section.io

To add RUM to your website, simply [login to your section.io account](https://aperture.section.io/) and go to "Real User Monitoring" under "Set Up" in the left navigation. All you need to do is paste the `script` tag above your `</head>` tag in any HTML document you want to track.

## Adding with Google Tag Manager

To add the section.io RUM script within Google Tag Manager, please follow the steps below:

1) Get the RUM script from [your section.io account](https://aperture.section.io/) and go to "Real User Monitoring" under "Set Up" in the left navigation.

2) Login to your Google Tag Manager account and navigate to the container with your domain you wish to add the script to.

3) Click on the red **New Tag** button.

{{% figure src="/docs/images/add-tag.png" %}}

4) Name the tag “section.io RUM”.

5) Under **Tag Configuration** choose custom HTML.

6) Paste the RUM script into the area that appears.

7) Under **Triggering** choose **All Pages**. Click save.

{{% figure src="/docs/images/gtm.png" %}}

8) In the upper right-hand corner, click **Publish** and continue to publish all changes.

9) Once you've completed these steps, you're ready to start collecting performance metrics.

## Viewing your metrics

To view your real user monitoring metrics [login to your section.io account](https://aperture.section.io/) and go to "Monitoring" under "Real time" in the left navigation. From there you can click on "Real User Monitoring" in the left hand corner of the screen to view your Data

{{% figure src="/docs/images/grafana.png" title="Real User Monitoring in Grafana" %}}
