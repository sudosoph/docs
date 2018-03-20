This defines the interaction with the proxy container by the section.io proxy hosting platform:

Essential:

Proxy should listen on TCP :80 for HTTP/1.1, never HTTPS
Proxy must connect upstream to next-hop:80 as HTTP, never HTTPS. The platform will ensure "next-hop" resolves to the next proxy in the chain, or the origin, whichever is next upstream.
Proxy must write its log files under the /var/log/ directory. Proxy must create any /var/log/ subdirectories required during start-up.
/opt/section/validate.sh will be executed by Aperture on git push pre-receive to validate that the user's Application git config is correct. Config will be in "/opt/proxy_config" as above.
This script must exist, even if it takes no action.
Return a zero exit code and zero output if config is valid.
Return non-zero exit code if config is invalid and output reason why invalid to stderr (stdout also accepted but discouraged).
/opt/section/logrotate.sh will be executed regularly (hourly) to rotate logs. This script needs to perform the file rotation and signal processes to re-open file descriptors.
/opt/section/update.sh:
Will be execute when the contents of the configuration directory may have changed to indicate the proxy should re-parse and re-apply the configuration in "/opt/proxy_config".
This script must exist, even if it takes no action.
It is possible this script can be executed during early container startup before the container is ready and the script should handle this gracefully.
A non-zero exit code will fail the deployment
The output to stderr will be recorded as the reason for the failed deployment (stdout is ignored)

Optional:

Proxy should expect /opt/proxy_config/ directory will contain the configuration for this proxy. This will be the proxy-specific subdirectory from the section.io Application git repository. Assume the directory contents are read-only.

Things you can rely on:

Proxy can expect X-Forwarded-Proto request header will equal "https" for HTTPS connections from the browser. Assume HTTP otherwise.
Proxy can expect X-Forwarded-For request header will be present.
Proxy should configure HTTP/1.1 keep-alive to be enabled for downstream and upstream.
/opt/section/messagehandler.sh:
Will be executed when a proxy message arrives
$1 will be the name of the message
$2 will be the message arguments
stdout is ignored
a non-zero exit code will fail the message handling and any output to stderr will be reported as the reason
