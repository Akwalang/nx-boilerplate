FROM php:8.1-fpm

ARG PACKAGE_TYPE
ARG PACKAGE_NAME

RUN apt-get update && apt-get install -y nginx

COPY ./.config/lang/php/nginx.conf /etc/nginx/nginx.conf

WORKDIR /var/www/html

COPY ./packages/${PACKAGE_TYPE}/${PACKAGE_NAME}/src /var/www/html

RUN chown -R www-data:www-data /var/www/html

EXPOSE 80

CMD ["sh", "-c", "php-fpm -D && nginx -g 'daemon off;'"]
