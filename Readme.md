# NGNIX-Proxy-sidecar

WARNING:  The sed and startup scripts will not work properly if they contain windows CRLF newlines.  They must only have unix style LF only line endings to work properly.

This container build creates a proxy sidecar using NGINX.  The sidecare can be used to terminate SSL sessions.  It also provides access logs for your services.  Additionally, it logs any x-trace-id headers.

The sidecar can be configured using the following environment variables:

# Max number of requests per second
PROXY_REQ_RATE=5
# Max number of connections per client IP address
PROXY_LIMIT_CONN=5
# Initial connection timeout
PROXY_CONNECT_TIMEOUT="5s"
# Read timeout
PROXY_READ_TIMEOUT="60s"
# Send/write timeout
PROXY_SEND_TIMEOUT="60s"
# Target protocol http or https on localhost
PROXY_TARGET_PROTOCOL="http"
# Target port on localhost
PROXY_TARGET_PORT="8080"