---
title: Proxy Contract
description: Requirements to run a reverse proxy on section.io.
keywords: reverse proxy, CDN
aliases:
  - /proxy-contract/

---

# Proxy Requirements

The following defines the interaction between the proxy container and the section.io proxy hosting platform:

## Essential

* Proxy should listen on TCP :80 for HTTP/1.1 — never HTTPS or any other port.
* Proxy must connect upstream to `next-hop:80` as HTTP, never HTTPS. The platform will ensure "next-hop" resolves to the next proxy in the chain or the origin — whichever is next upstream.
* Proxy must handle logs according to these requirements:  
   * All log files must be written under the `/var/log/` directory.
   * Any `/var/log/` subdirectories required must be created during start-up.
* Return a zero exit code and zero output if config is valid.
* Return non-zero exit code if config is invalid and output reason for invalidation to stderr (stdout is also accepted but discouraged).
* `/opt/section/logrotate.sh` will be executed regularly (hourly) to rotate logs.
  * This script needs to perform the file rotation and signal processes to re-open file descriptors.
* `/opt/section/validate.sh` will be executed by Aperture on git push pre-receive to validate that the user's Application git config is correct. Config will be in `/opt/proxy_config/` directory as above.
  * This script must exist, even if it takes no action.
* There is an update script located here: `/opt/section/update.sh`
  * This script must exist, even if it takes no action.
* It will execute when the contents of the configuration directory may have changed to indicate the proxy should re-parse and re-apply the configuration files located in this directory: `/opt/proxy_config/`.
* In certain cases, this script will be executed before container creation and the script should handle this gracefully.
* A non-zero exit code will fail the deployment.
  * The output to stderr will be recorded as the reason for the failed deployment (stdout is ignored).

## Optional

 * Proxy should expect that `/opt/proxy_config/` directory will contain the configuration for this proxy. This will be the proxy-specific subdirectory from the section.io Application git repository. Assume the directory contents are read-only.

## Things you can rely on

 * Proxy can expect X-Forwarded-Proto request header will equal "https" for HTTPS connections from the browser. Assume HTTP otherwise.
 * Proxy can expect X-Forwarded-For request header will be present.
 * Proxy should configure HTTP/1.1 keep-alive to be enabled for downstream and upstream.
/opt/section/messagehandler.sh:
 * Will be executed when a proxy message arrives
 * $1 will be the name of the message.
 * $2 will be the message arguments.
 * stdout is ignored.
 * a non-zero exit code will fail the message handling and any output to stderr will be reported as the reason.

# Proxy disclosures

* section.io currently does not support an authorized docker registry which results in the following:
  * The proxy image must be publicly accessible to allow for development in the section.io Developer PoP.
