#!/usr/bin/env sh

DRUPAL_DIR=web

apt-get update
apt-get install -y php5 php5-gd php5-curl php5-sqlite php-pear unzip php5-mysql php5-pgsql apache2 libapache2-mod-php5 curl

pear channel-discover pear.drush.org
pear install drush/drush

cd /vagrant
drush make bootstrap.make $DRUPAL_DIR
cd $DRUPAL_DIR
drush site-install -y standard --site-name='Drupal Zen' --account-name=admin --account-pass=admin --db-url=sqlite://sites/default/files/.ht.sqlite
drush en -y admin_menu_toolbar pathauto views_ui views_content page_manager panels
drush en -y entityreference link date_popup
drush en -y zen
drush en -y devel_generate
drush dis -y toolbar

rm -rf /var/www
ln -fs /vagrant/$DRUPAL_DIR /var/www
perl -pi -e's/AllowOverride None/AllowOverride all/g' /etc/apache2/sites-enabled/000-default
sudo a2enmod rewrite
sudo a2enmod expires
sudo a2enmod auth_basic
sudo a2enmod headers
sudo service apache2 restart
