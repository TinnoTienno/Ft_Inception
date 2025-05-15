#!/bin/bash

# downloads the PHP Archive 
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

# check if WordPress directory is correctly set up
if [ -e /var/www/html/wordpress ]; then
    rm -rf /var/www/html/wordpress/*
fi
mkdir -p /var/www/html/wordpress

cd /var/www/html/wordpress

# download WordPress
wp core download --allow-root --path=/var/www/html/wordpress

# create a new wp-config.php
wp config create \
	--allow-root \
	--dbname=$WORDPRESS_DB_NAME \
	--dbuser=$WORDPRESS_DB_USER \
	--dbpass=$WORDPRESS_DB_PASSWORD \
	--dbhost=$WORDPRESS_DB_HOST \
	--dbprefix=wp_

# install WordPress and create admin (change --url for VM -> eschussl.42.fr)
wp core install \
	--allow-root \
	--skip-email \
	--title=wordpress \
	--url=localhost \
	--admin_user=$MYSQL_ROOT_USER \
	--admin_password=$MYSQL_ROOT_PASSWORD \
	--admin_email=$MYSQL_ROOT_EMAIL \


# create a 2nd user
wp user create $WORDPRESS_DB_USER $WORDPRESS_DB_EMAIL --role=subscriber --user_pass=$WORDPRESS_DB_PASSWORD --allow-root

wp theme install leanCV --allow-root

# start in the foreground mode
exec php-fpm -F