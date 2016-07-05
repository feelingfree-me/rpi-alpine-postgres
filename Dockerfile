FROM hypriot/rpi-alpine-scratch:edge
MAINTAINER feelingfree-me <feelingfree.co.nr@gmail.com>

ADD https://github.com/tianon/gosu/releases/download/1.9/gosu-armhf /usr/local/bin/gosu

RUN apk --update add  postgresql postgresql-contrib && \
    chmod +x /usr/local/bin/gosu && \
    rm -rf /var/cache/apk/*

ENV LANG en_US.utf8
ENV PGDATA /var/lib/postgresql/data

COPY docker-entrypoint.sh /

RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 5432
VOLUME /var/lib/postgresql/data

CMD ["postgres"]
