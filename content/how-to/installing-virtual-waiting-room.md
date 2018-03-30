---
title: Virtual Waiting Room
description: How to set a limit on the number of visitors your site can safely handle.
keywords: traffic management, varnish, VCL, traffic spikes
aliases:
  - /overload-prevention/

---

In order to use the Virtual Waiting Room feature, you must have Varnish 4+ running on your application and add a GoSquared JavaScript snippet that section.io will provide. To setup the feature you will 1) add your gosquared credentials, 2) add VCL for virtual waiting room, and then 3) call the new VCL in your default VCL file. Optionally, you can 4) edit the default Virtual Waiting Room page that will be shown to your customers. The following page will walk you through each step.

## Step 1: Add GoSquared Credentials

First, you need to add a file to the repo called:
gosquared-visitor-count

The content of file should be:
`<overflow number> <ID> <secret>`

* Where “overflow number” is the max number of customer you want on your site
* Where “ID” comes from end of URL when you are logged into gosquared
* Where “secret” is a string with no spaces that only you know

Example:
`300 GSN-000000-M a000000000bc111111111d00000`

Where to find Gosquared ID:

{{% figure src="/docs/images/gosquared-id.png" %}}

## Step 2: Add VCL for Virtual Waiting

In the Varnish folder of your repo, add section-user-throttling.vcl

{{< gist section-io-gists 0596b0765194996048e279a072eab492 >}}

## Step 3: Include Virtual Waiting Room VCL

In the varnish file of your repo, edit the default.vcl to add the following:

{{< gist mkilbo 45165c30ecf3ea141f2a12b91a486216 >}}

Be sure to update the secret and threshold values to match what you added for your GoSquared Credentials.


### Note about Section-Visitors-Version:
Section-Visitors-Version determines the name of the cookie issued to visitors to remember whether they have been granted access or blocked due to exceeding the threshold.

When the threshold is increased, users with the “blocked” cookie will be given an opportunity to be granted access when their cookie expires after 3 minutes.

When the threshold is decreased, users with the “allowed” cookie will still have access until their cookie expires after 1 hour but this may put the site under too much pressure. Change the Section-Visitors-Version to invalidate all existing issued cookies and immediately enforce the new threshold.

In our example VCL we’ve used POSIX time to determine the version as it is a new value every second. If you prefer, you can choose to increment another way.


### Note about Section-Visitors-Fallback-Block-Percentage:
As GoSquared is an external service, it is possible that the current user count may not be available and the system will not be able to determine if the threshold has been exceeded to make an appropriate decision to allow or block a new visitor. In this situation, new visitors will be randomly assigned to the “allowed” or “blocked” state based on the value of Section-Visitors-Fallback-Block-Percentage. That is, a percentage of “10” will randomly block 10% of new visitors until the current GoSquared user count data becomes available. A value of “0” will allow all new visitors and a value of “100” will block all new visitors.

## Optional Step 4: Edit the Virtual Waiting Room

The default Overload Page will show your customers a blank page with unstyled text saying “threshold exceeded”. To implement the virtual waiting room feature, first update the VCL with this default setting. Then go in and edit the VCL. Specifically, line 16 of the above gist that will be added to the default.vcl calls the html that will be displayed. To add your own HTML, simply replace the `<html>threshold exceeded</html>` with your own html.
  

## Operations

### Increase user threshold
Update both the threshold values in `gosquared-visitor-count` and VCL.

e.g.

`700 GSN-000000-M a000000000bc111111111d00000` and `set req.http.Section-Visitors-Threshold = 700;` in the VCL.


### Decrease user threshold
Update both the threshold values in `gosquared-visitor-count` and VCL.

e.g.

`100 GSN-000000-M a000000000bc111111111d00000` and `set req.http.Section-Visitors-Threshold = 100;` in VCL.

You will also need to increment the overflow header version `set req.http.Section-Visitors-Version = "1479168057";` in VCL.
