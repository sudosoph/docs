---
title: Set up Real User Monitoring
description: section.io's real user monitoring
keywords: content delivery network, CDN, rum, performance, baseline, testing
aliases:
  - /rum/

---
section.io offers free real user monitoring for any customer that signs up and begins their trial. This enables you to see how your own visitors are experiencing your website performance with the use of a simple JavaScript snippet. Data includes:

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

## Set up RUM with Classifications

section.io RUM can also provide user statistics subdivided by page classifications, giving you pageload statistics for specific page classifications and site-wide statistics.

### To setup RUM with page classifications:

#### 1) Decide what classifications you want

In order to build out the rest of your RUM script, you need to decide what page classifications you want to collect data for. Our available classifications are: `Home`,`Product`, `Checkout`, `Category`, and `Uncategorised`.

**Note**: *Make sure you do not change the spelling of 'Uncategorised'. It will not collect the data.*

These classifications would give you statistical metrics on your home page, your individual product pages, your product category pages, and your checkout process. Uncategorised collects metrics on everything that doesn't fall into one of those classifications.

#### 2) Come up with a descriptive HTML classname for each one of your classifications

A good classname for your Product classification would be something like `rum-product`. All that matters is that it makes sense and is easily replicable.

#### 3) Add these descriptive classnames to your HTML.

In order for our script to recognize a given page under the classification you want, it needs to have the appropriate classname in its HTML body. For example, if you chose `rum-product` as your classname for Product in Step #2, then all your Product pages should have `rum-product` as one of the classes on their HTML body.

#### 4) Create a folder in your repository (found under Advanced Configuration) named `rum`.

**Note**: *In order to do this, you will need to pull down your configuration repository onto your local machine. Folders and files cannot be created in the UI*.

#### 5) Create a JavaScript file inside `rum` with the same name as your Hostname/Production domain name.

 If your Production domain name is `www.example.com`, then your JS file should be `www.example.com.js`. Similarly, if you are using a bare domain such as `abc.com`, then your JS file should be named `abc.com.js`.

#### 6) Tailor this template to fit your classifications and insert into your JS file:

```
(function (w) {

  var pageUrl = w.location.pathname;

  var pageName = "Uncategorised";

  if (bodyHasClass("home")) {
    pageName = "Home";
  } else if (bodyHasClass("category-view")) {
    pageName = "Category";
  } else if (pageUrl.match("/checkout")) {
    pageName = "Checkout";
  } else if (bodyHasClass("product-view")) {
    pageName = "Product";
  } else {
    pageName = "Uncategorised";
  }

  w.sq_pagetype_override = pageName ;

  function bodyHasClass(className) {
    return document.getElementsByTagName("BODY")[0].classList.contains(className);
  }
})(window);
```
**Note again**: *Don't change the spelling of Uncategorised*

The only sections you should need to configure are the if-statements. The pageName variable will default to `Uncategorised`, but that default is overwritten if any if-statement resolves to true. The `bodyHasClass()` method will inspect the body for a given class and return a boolean, but you're free to make the if-logic pass in any other way that makes sense. In the example above, `Checkout` pages are identified by URL matching as opposed to HTML classnames. What matters is that pageName is set to the right value.

#### 6) Contact section.io

In order to go-live with your new RUM, you'll need a section.io engineer. Email us at `support@section.io`.

## Viewing your metrics

To view your real user monitoring metrics [login to your section.io account](https://aperture.section.io/) and go to "Monitoring" under "Real time" in the left navigation. From there you can click on "Real User Monitoring" in the left hand corner of the screen to view your Data

{{% figure src="/docs/images/grafana.png" title="Real User Monitoring in Grafana" %}}
