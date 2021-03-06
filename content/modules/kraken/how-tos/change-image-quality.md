---
title: Change optimized image quality
description: How to change optimized image quality?
keywords: Section, training, platform overview
weight: 1
---

## Overview

Kraken module allows the flexibility to control the quality of the optimized image.

## How To

You can control the optimized image quality by changing the following settings in the [advanced configuration](/docs/modules/kraken/reference/kraken-advanced-config/) settings for Kraken :

- `"lossy" : "true/false"`

Enable disable lossy compression.

- `"quality" : 1 - 100`

 This options will only be used if the LOSSY option is set to true. Can be a number in the range of 1 - 100. If the quality option is not provided it will default to "auto" where Kraken will optimize the images based on their characteristics.
