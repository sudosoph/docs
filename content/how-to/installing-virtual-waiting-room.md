---
title: Install Virtual Waiting Room
description: How to set a limit on the number of visitors your site can safely handle.
keywords: traffic management, waiting room, traffic spikes, vwr
aliases:
  - /overload-prevention/

---

The Virtual Waiting Room allows you to control the number of concurrent users on your website and display a custom waiting room page. To setup the Virtual Waiting Room carry out the following steps

## Step 1: Add GoSquared Credentials

First, you need to add a file to the root of the repository called:
gosquared-visitor-count

The content of file should be:
`<threshold> <ID> <secret> varnish <hostname> <api_key>`

* Where “threshold” is the max number of customer you want on your site.
* Where “ID” comes from end of URL when you are logged into gosquared.
* Where “secret” is a string with no spaces that only you know.
* Where "hostname" is the first hostname(domain name) used in your Section Application.
* Where "api_key" is a the api_key for your
GoSquared project provided by Section engineering team.

Example:
`300 GSN-000000-M a000000000bc111111111d00000 varnish www.mysite.com jkfjijfejADFD`

The GoSquared ID will provided by Section engineering team.

## Step 2: Add a Virtual Waiting Room folder.

In the root of your repositoryas, add a folder titled `vwr` with the following files :

- `vwr.json`
- `waiting-room.html`


`vwr.json` will contain the configuration of your virtual waiting room and should have the following data.



{{< gist section-io-gists 23679bef63d4f455c23f599a23a362fa >}}

`waiting-room.html` will contain the HTML to be displayed in case the number of concurrent users on the site are more than the threshold set by you. Any CSS required to style the page should be included in this HTML file itself. Any images you wish to serve should be stored off domain (for e.g. in an S3 bucket) and then linked.

{{< gist section-io-gists bd435ecb59e11183c6e689af629b1a63 >}}

## Step 3: Add GoSquared script provided by Section.

We will provide a gosquared script to be inserted in all pages of the website except the waiting room page. This script has to be inserted in the `<head>` tag and is used for tracking the number of users on the site. Since the script is fired after the *onLoad* event it does not effect the performance of the website.

---

## Operations

Once the initial setup is complete any future changes to *Threshold* and the *Waiting Room HTML* can be made easily through the interface provided under Quick Config in the Aperture portal at https://aperture.section.io


{{% figure src="/docs/images/vwr_config.png" %}}


### Increase/Decrease user threshold

The maximum number of concurrent users can be increased/decreased easily by using the counter under the *Control Visitor Count* section.

### Edit the Virtual Waiting Room HTML

The HTML to be displayed when the users are put in a queue can be edited under the *Upload HTML* section. A preview of the page after it has been uploaded is provided under the *Preview HTML* tab.


{{% figure src="/docs/images/vwr_preview.png" %}}


### Toggle Virtual Waiting Room

The Virtual Waiting Room can easily be turned on and off using the toggle provided under the *Control Visitor Count* section.


---


#### Note about Section-Visitors-Version:
Section-Visitors-Version determines the name of the cookie issued to visitors to remember whether they have been granted access or blocked due to exceeding the threshold.

When the threshold is increased, users with the “blocked” cookie will be given an opportunity to be granted access when their cookie expires after 3 minutes.

When the threshold is decreased, the Section-Visitors-Version is automatically incremented to invalidate all existing issued cookies and immediately enforce the new threshold.

