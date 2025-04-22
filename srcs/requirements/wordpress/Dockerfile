FROM debian:bullseye
RUN apt update && apt install -y php php-fpm php-mysql
COPY ./conf/wp-config.php /var/www/html/wp-config.php
CMD ["php-fpm", "-F"]