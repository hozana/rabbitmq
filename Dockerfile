FROM rabbitmq:3-management-alpine

COPY etc/rabbitmq/conf.d/11-hozana.conf /var/lib/rabbitmq/
COPY usr/local/bin/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

RUN rabbitmq-plugins enable rabbitmq_management && \
    rabbitmq-plugins enable rabbitmq_prometheus
USER rabbitmq
HEALTHCHECK --interval=5s --timeout=10s --start-period=15s --retries=30 CMD [ "/opt/rabbitmq/sbin/rabbitmq-diagnostics","-q", "ping" ]
