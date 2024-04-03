FROM rabbitmq:3.13-management-alpine

RUN rabbitmq-plugins enable rabbitmq_management && \
    rabbitmq-plugins enable rabbitmq_prometheus
USER rabbitmq
HEALTHCHECK --interval=5s --timeout=10s --start-period=15s --retries=30 CMD [ "/opt/rabbitmq/sbin/rabbitmq-diagnostics","-q", "ping" ]
