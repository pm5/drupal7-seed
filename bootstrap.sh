#!/usr/bin/env sh

APP_DIR=/app
PUBLIC_DIR=${APP_DIR}/public

apt-get update
apt-get install -y php5 php5-gd php5-curl php5-sqlite php-pear unzip php5-mysql php5-pgsql apache2 libapache2-mod-php5 curl

pear channel-discover pear.drush.org
pear install drush/drush

mkdir -p ${PUBLIC_DIR}

cd ${APP_DIR}
drush make bootstrap.make ${PUBLIC_DIR}
cd ${PUBLIC_DIR}
drush site-install -y standard --site-name='Drupal7 Sandbox' --account-name=admin --account-pass=admin --db-url=sqlite://sites/default/files/.ht.sqlite

rm -rf /var/www
ln -fs ${PUBLIC_DIR} /var/www
perl -pi -e's/AllowOverride None/AllowOverride all/g' /etc/apache2/sites-enabled/000-default
sudo a2enmod rewrite
sudo a2enmod expires
sudo a2enmod auth_basic
sudo a2enmod headers
sudo service apache2 restart
