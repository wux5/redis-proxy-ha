FROM haproxy:alpine

ADD haproxy.conf /etc/haproxy/haproxy.conf
# RUN chown haproxy:haproxy /etc/haproxy/haproxy.conf
ENV ADMIN_USERNAME admin
ENV ADMIN_PASSWORD password
ENV REDIS_HOSTS redis_1,redis_2,redis_3
ADD entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
