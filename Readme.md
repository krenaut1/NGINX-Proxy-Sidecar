This container build creates a proxy sidecar using NGINX.  The sidecare can be used to terminate SSL sessions.  It also provides access logs for you services.  Additionally, it logs any x-trace-id headers.

The sidecar can be configured using the following environment variables

# max number of requests per second
PROXY_REQ_RATE=5
# max number of connections per client IP address
PROXY_LIMIT_CONN=5
# initial connection timeout
PROXY_CONNECT_TIMEOUT="5s"
# read timeout
PROXY_READ_TIMEOUT="60s"
# send/write timeout
PROXY_SEND_TIMEOUT="60s"
# target protocol http or https on localhost
PROXY_TARGET_PROTOCOL="http"
# target port on localhost
PROXY_TARGET_PORT="8080"