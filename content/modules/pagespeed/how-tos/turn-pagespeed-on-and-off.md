---
title: Turn PageSpeed On and Off
description: How to turn pagespeed on and off.
keywords: pagespeed, on and off
weight: 1
---

## Overview

To turn PageSpeed on and off simply change **line 1** in your default `server.conf` file located in your **pagespeed** directory on your application repository.

### Implementation

If you want PageSpeed turned on:

```nginx
pagespeed On;
```

If you want PageSpeed turned off:

```nginx
pagespeed Off;
```