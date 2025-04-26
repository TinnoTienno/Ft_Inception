FROM debian:bullseye

RUN apt update && apt install -y php php-fpm php-mysql wget

# COPY ./conf/wp-config.php /var/www/html/wp-config.php

RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www

RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz

RUN		chown -R root:root /var/www/wordpress

CMD ["php-fpm", "-F"]