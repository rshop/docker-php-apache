FROM rshop/php:8.0

RUN apk update \
    && apk add --no-cache \
        apache2 \
        php8-apache2 \
    && apk del --purge *-dev \
    && rm -rf /var/cache/apk/* /tmp/* /usr/share/man

COPY apache/* /etc/apache2/

ENTRYPOINT [ "httpd", "-D", "FOREGROUND" ]

EXPOSE 80
