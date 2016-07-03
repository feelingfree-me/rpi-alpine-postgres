FROM container4armhf/armhf-alpine:3.4
MAINTAINER feelingfree-me  <feelingfree.co.nr@gmail.com>

RUN apk --update add  postgresql postgresql-contrib curl && \
    curl -o /usr/local/bin/gosu -sSL "https://github.com/tianon/gosu/releases/download/1.9/gosu-armhf" && \
    chmod +x /usr/local/bin/gosu && \
    apk del --purge curl && \
    rm -rf /var/cache/apk/*

ENV LANG en_US.utf8
ENV PGDATA /var/lib/postgresql/data

COPY docker-entrypoint.sh /

RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 5432
VOLUME /var/lib/postgresql/data

CMD ["postgres"]
