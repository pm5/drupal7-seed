
Requirements
------------

* Vagrant
* Ansible

Usage
-----

        # Put your Drupal site under `docroot` directory
        # (Optional) put database dump at `data/database.mysql.gz`
        # (Optional) put public files dump at `data/files.tar.gz`
        $ scripts/ansible-install.sh
        $ vagrant up

You can connect to MySQL at `localhost:3306` with

* DB Name: drupal
* DB User: drupal
* DB Password: drupal

### Drush

        $ cp vg.aliases.drushrc.php ~/.drush/
        $ vagrant ssh-config > ssh_config
        $ drush @vg status
        # and possibly
        $ drush site-set @vg

Settings
--------

This environment sets up two machines: `web` and `db`.   Both are Debian wheezy. `web` runs Apache with mod_php5, while `db` runs MySQL and Memcached.

Typical `settings.php` goes like this:

        $databases['default']['default'] = array(
          'driver' => 'mysql',
          'database' => 'drupal',
          'username' => 'drupal',
          'password' => 'foobar',
          'host' => '192.168.10.3',
          'prefix' => '',
        );

        # if you have Drupal memcache module installed
        $conf['cache_backends'][] = 'sites/all/modules/contrib/memcache/memcache.inc';
        $conf['cache_default_class'] = 'MemCacheDrupal';
        $conf['cache_class_cache_form'] = 'DrupalDatabaseCache';
        $conf['memcache_servers'] = array(
          '192.168.10.3:11211' => 'default',  // to your Memcached installation
        );

