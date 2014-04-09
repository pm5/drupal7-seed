#!/usr/bin/env sh

DRUPAL_DIR=web

cd /vagrant/$DRUPAL_DIR

## more devel modules
drush en -y drupalforfirebug coder_review
## devel_themer
mkdir -p sites/all/libraries/simplehtmldom
curl -o sites/all/libraries/simplehtmldom/simple_html_dom.php https://raw.githubusercontent.com/jalbertbowden/simplehtmldom/master/simple_html_dom.php
drush en -y devel_themer
