---
title: Testing
description: How to evaluate your website performance using webpagetest.org.
keywords: webpagetest, performance testing, metrics, website performance, page speed, webpage speed, website security
aliases:
  - /testing/

---

This is a guide to help you run some basic tests against your website using either [webpagetest.org](http://webpagetest.org) which is a free real browser synthetic test agent, or [locally](#testing-locally) using your own browser.

While synthetic tests do not neccessarily provide an accurate indication of how fast your site will be in the hands of your users, they can be useful to help you understand which items you can work on to the improve performance of individual pages.   By focussing on key pages, you can thence improve the overall performance of your website.

These tests assumes you have [signed up](https://www.section.io/sign-up) with section.io and that you have [added your application](https://www.section.io/docs/create-application/).

## Testing using WebPageTest

### A. BASIC TEST

Visit [webpagetest.org](http://webpagetest.org) and run a test against a sample page from your website.  Run say 5 tests with first and repeat views from a location which may be relevant to your users.

{{% figure src="/docs/images/webpagetestbasic.png" %}}

### B. TEST WTH SECTION.IO

#### **1  Find the cname Record for Your Application**

Visit your section.io portal and view the Change DNS settings. Also found under the Repository settings if you have not selected to use section.io's hosted DNS offering.

You should see something like:    www.website.com.c.section.io

Copy this as you will need it for the next step.

#### **2  Set Webpagetest to Test the Site Running Through section.io**

At the home screen of webpagetest, select the "Script" tab and enter a DNS reroute so that webpage test thinks the origin server for your website is at section.io.

{{% figure src="/docs/images/webpagetestscript.png" %}}

You may also need to set webpagetest so that it ignores any SSL errors assuming you have a cert installed on your website which you have not yet installed on section.io.

{{% figure src="/docs/images/webpagetestssl.png" %}}

Run another 5 tests with first and repeat views.

#### **3 Review Your Results**

You should be able to see the section.io markers in the responses for the items.  Select one of the webpagetest waterfalls and click on the response.  The section.io id provides you with confirmation that the test has traversed the section.io platform.

{{% figure src="/docs/images/webpagetestsection.png" %}}

#### **4 Optimise Your Website Performance**

Now you can modify your VCL in section.io platform and re run multiple tests for caching or modify the page to serve entirley HTTPS so you can take advantage of section.io's HTTP/2 platform.

The cache hit headers will be apparent on the responses you see in webpagetest.

You can also then correlate the responses to your logs and metrics in section.io's portal.  Simply take a copy of the section.io ID for a particular response anc copy and paste it into the query frame in Kibana in section.io's portal.  This will provide you with detail for that particular request and how it was dealt with at the section.io platform.

{{% figure src="/docs/images/webpagetestlogs.png" %}}


#### **5 Rinse and Repeat**

This process can allow you to see the impact you can have on your website with section.io.  As you pregressively improve the configuration in section.io you should be able to see these changes reflected in your webpagetest results.

Once you have made your DNS change, these tests become even more simple as the script you entered will no longer be required.



## Testing Locally

Instead of using WebPageTest, you may wish to test the site through section.io locally using your own browser. You can achieve this by changing how DNS to the site is resolved on your local test machine.

### **1 Obtaining a test IP**
For our managed customers, our engineers will provide you with a test IP and you can skip to part 2.

For self serve customers, to find out the IP address of the section.io platform for your site, run the following command from a command prompt

nslookup site_domain.c.section.io
For www.example.com that would be, nslookup www.example.com.c.section.io

This will give you one or more IP addresses. e.g. 203.0.113.1

### **2 Find local DNS lookup file**
Open the test machine's 'hosts' file in a text editor. This will need to be done as an administrator or with root privilege.

Default locations:
Windows:  C:\Windows\System32\Drivers\etc\hosts
MacOS and Linux:  /etc/hosts


### **3 Change local DNS lookup file**
Add a DNS entry into the file that will tell your test machine to send requests for that domain to the section.io platform instead of performing a DNS lookup.

For the example from point 1) and 2) this would look like:
203.0.113.1 www.example.com

Then save the file.

### **4 Test on browser**
Now open a new browser tab or window and navigate to the site with dev tools open.
Requests served from the section will always have a section-io-id response header.
Please note that if you have not uploaded an SSL certificate for the site on to our platform and try to navigate to a HTTPS page, your browser will display a warning about an insecure site, this is expected and not a problem for testing.
You can by-pass this warnining in Chrome by clicking Advanced then Proceed to site.
The warning will disappear once you have either uploaded a custom SSL certificate or after you have pointed DNS at our platform and have provisioned our free SSL certificate.

{{% figure src="/docs/images/testing_section_header.png" %}}

If this header isn't present, check that the HOST file is correctly edited and saved. You may also need to flush the DNS cache of the browser. For Chrome enter the following in the address bar: chrome://net-internals/#dns  then clear the host cache.

If you still do not see a section-io-id, contact our support team through which ever channel is available to your support plan.


We recommend focusing on functional testing of the site, such as user login, add to cart, checkout etc.

Performance testing when the site is not live on our platform can yield varying results due to the cache being cold from lack of real world traffic. Remember that the busier a site is, the better it should perform as the cache will be better populated.

## What should I be testing on my website?

Now that you have the ability to test your site on section.io the next step is to work through your testing process.

The actions below will enable you to test 99.9% of your core site functionality and be ready to go live with confidence.

### Testing key actions

The following steps will enable you to prime the CDN caches and follow a process that identifies caching issues for resolution ahead of actual customer traffic:

#### **1 Load your site's Homepage 3-4 times**

This will ensure that assets are stored in cache and any optimisations that are being applied are activated

#### **2 Browse to another page (eg Product page)**

If your site is an ecommerce site add a product to cart (or perform a similar action that personalises the users experience)

Test checklist item: Confirm that add to cart action works

#### **3 Browse back to the Homepage**

This tests the experience when a user has performed some actions elsewhere and returns to a cached / optimised page

Test checklist item: Confirm that user still has products in cart and page rendering looks normal

#### **4 Login to your sites User portal**

If your site has an area for users to manage their username and password and other account related settings login now

Test checklist item: Confirm that login works and user portal rendering looks normal

#### **5 Browse back to the Homepage**

This tests that your site renders properly after logging in when browsing a cached / optimised page.

Test checklist item: Confirm that the page displays the user logged in status correctly

#### **5a (Optional) Load the Homepage in a new Incognito window**

Loading your website in an Incognito window (in Chrome browser for example) simulates a new user that is not related to your existing user on the site. This enables you to confirm that things like cart/logged in status are unique per user.

Test checklist item: Confirm that the page displays correctly and that the page does not have any cart items or logged in status

#### **6 Complete Checkout/Key call to action**

Complete the primary call to action on your site to ensure that users can complete this step without any issues.

Test checklist item: Confirm that an order / booking / enquiry has been placed and that your user has received any confirmation emails as appropriate

#### **7 Login to your sites Admin (CMS) portal and reload 3-4 times**

Tests that the user portal of your site is functioning when assets may have been cached / optimised

Test checklist item: Ensure that you can perform 1-2 of your most common CMS functions

### Testing Complete - Go live!
Now that you have followed the above process, you have tested the core functionality of your site. Through the above process it's critical to focus on the functional elements of testing. Seeing actual user performance will only be relevant when you have actual users on your website.
