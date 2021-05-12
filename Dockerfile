FROM rshop/php:7.4-xdebug

RUN apk update \
    && apk add --no-cache \
        apache2 \
        php7-apache2 \
    && apk del --purge *-dev \
    && rm -rf /var/cache/apk/* /tmp/* /usr/share/man

COPY apache/* /etc/apache2/

ENTRYPOINT [ "httpd", "-D", "FOREGROUND" ]

EXPOSE 80
