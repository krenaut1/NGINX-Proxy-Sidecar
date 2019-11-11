FROM nginx
# initialize container with root priviledges
USER root:root
# circuit breaker maximum requests per second per client IP
ENV PROXY_REQ_RATE="50"
# circuit breaker max number of concurrent connections per client IP
ENV PROXY_LIMIT_CONN="5"
ENV PROXY_CONNECT_TIMEOUT="15s"
ENV PROXY_READ_TIMEOUT="60s"
ENV PROXY_SEND_TIMEOUT="60s"
# target protocol can be either http or https
ENV PROXY_TARGET_PROTOCOL="http"
ENV PROXY_TARGET_PORT="8080"
ENV TZ="UTC"
RUN chmod 666 /etc/nginx/nginx.conf
ADD nginx.template /etc/nginx/
RUN chmod 644 /etc/nginx/nginx.template
ADD sed.template /etc/nginx/
RUN chmod 644 /etc/nginx/sed.template
ADD startup.sh /
RUN chmod 755 /startup.sh
# switch to running in unpriviledged mode
USER nobody:nogroup
ENTRYPOINT ["sh", "/startup.sh"]