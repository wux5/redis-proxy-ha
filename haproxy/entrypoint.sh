#!/bin/sh
sed -i "s/\$ADMIN_USERNAME/$ADMIN_USERNAME/g" /etc/haproxy/haproxy.conf
sed -i "s/\$ADMIN_PASSWORD/$ADMIN_PASSWORD/g" /etc/haproxy/haproxy.conf

echo "=> Adding Redis Nodes to Health Check"
COUNT=1

for i in $(echo $REDIS_HOSTS | sed "s/,/ /g")
do
    # call your procedure/other scripts here below
    echo "  server redis-backend-$COUNT $i:6379 maxconn 1024 check inter 1s" >> /etc/haproxy/haproxy.conf
    COUNT=$((COUNT + 1))
done

echo "=> Starting HAProxy"
exec /docker-entrypoint.sh haproxy -f /etc/haproxy/haproxy.conf
