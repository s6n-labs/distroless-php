ARG TAG
FROM php:${TAG} AS php

RUN mkdir -p /tmp/lib && cd /lib && \
    ldd /usr/local/bin/php | grep '=> /lib/' | cut -d' ' -f3 | sed 's#/lib/##g' | xargs -I % cp --parents "%" /tmp/lib/

RUN mkdir -p /tmp/usr/lib && cd /usr/lib && \
    ldd /usr/local/bin/php | grep '=> /usr/lib/' | cut -d' ' -f3 | sed 's#/usr/lib/##g' | xargs -I % cp --parents "%" /tmp/usr/lib/

FROM gcr.io/distroless/cc-debian12

COPY --from=php /bin/sh /bin/
COPY --from=php /tmp/lib/ /lib/
COPY --from=php /tmp/usr/lib/ /usr/lib/
COPY --from=php /usr/local/lib/libphp.* /usr/local/lib/
COPY --from=php /usr/local/bin/docker-php-* /usr/local/bin/php* /usr/local/bin/

ENTRYPOINT ["docker-php-entrypoint"]
