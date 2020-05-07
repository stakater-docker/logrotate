FROM stakater/base-alpine:3.11

ARG LOGROTATE_VERSION=3.15.1-r0
ENV CRON_SCHEDULE="0 0 * * *"
RUN apk --update add "logrotate=${LOGROTATE_VERSION}"
RUN echo "${CRON_SCHEDULE}	/usr/sbin/logrotate -v /etc/logrotate.conf" >> /etc/crontabs/root && \
    mkdir -p /etc/logrotate.d

ADD logrotate.conf /etc/logrotate.conf

ENTRYPOINT [ ]
CMD ["crond", "-f"]
