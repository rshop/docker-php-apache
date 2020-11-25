FROM rshop/php:7.4

RUN apk update \
    && apk add --no-cache \
        apache2 \
        php7-apache2 \
        php7-xdebug \
    && apk del --purge *-dev \
    && rm -rf /var/cache/apk/* /tmp/* /usr/share/man

ENV PHP_XDEBUG_ENABLED 0
ENV PHP_XDEBUG_MAX_NESTING_LEVEL 250
ENV PHP_XDEBUG_REMOTE_HOST docker.for.mac.localhost

COPY apache/* /etc/apache2/
COPY conf.d/* /etc/php7/conf.d/

ENTRYPOINT [ "httpd", "-D", "FOREGROUND" ]

EXPOSE 80
