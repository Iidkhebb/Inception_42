sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/" "/etc/php/7.3/fpm/pool.d/www.conf"
chown -R www-data:www-data /var/www/*;
chown -R 755 /var/www/*;
mkdir -p /run/php/;
touch /run/php/php7.3-fpm.pid;


if [ ! -f /var/www/html/wp-config.php ]; then
	mkdir -p /var/www/html
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp
	wp core download --path=/var/www/html --allow-root
	wp config create --dbname=$DB_NAME --dbuser=$MYSQL_USER --dbpass=$MYSQL_USER_PASSWORD --dbhost=mariadb --path=/var/www/html --allow-root --skip-check
	wp core install --url=$DOMAIN_NAME --title=wordpress --admin_user=$ADMIN_NAME --admin_password=$ADMIN_PASS --admin_email=$ADMIN_EMAIL --allow-root --path=/var/www/html
	wp user create $WP_USER_NAME $WP_EMAIL --user_pass=$WP_USER_PASS --allow-root --path=/var/www/html
	
	wp config set WP_REDIS_HOST redis --allow-root --path=/var/www/html
  	wp config set WP_REDIS_PORT 6379 --raw --allow-root --path=/var/www/html
	wp config set WP_CACHE_KEY_SALT $DOMAIN_NAME --allow-root --path=/var/www/html
	wp config set WP_CACHE true --allow-root --path=/var/www/html



	wp plugin install redis-cache --activate --allow-root --path=/var/www/html
	wp plugin update --all --allow-root --path=/var/www/html
	wp plugin activate redis-cache --allow-root --path=/var/www/html
fi

wp redis enable --force --allow-root --path=/var/www/html

exec "$@"
