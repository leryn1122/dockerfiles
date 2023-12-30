FROM alpine:3.18 AS runtine

RUN sed -i "s/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g" /etc/apk/repositories \
 && apk add --update --no-cache \
      bash \
      cronie

ENV CRON_TASK="*/1 * * * * echo 'run job'"

COPY docker-entrypoint.sh /usr/local/bin

RUN ln -s /usr/local/bin/docker-entrypoint.sh /docker-entrypoint.sh \
 && ln -sf /proc/1/fd/1 /var/log/cron.log

ENTRYPOINT [ "docker-entrypoint.sh" ]

CMD [ "/usr/sbin/crond", "-x", "sch", "-n", "-m", "off" ]
