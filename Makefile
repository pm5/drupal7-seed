
.PHONY: install start provision

install:
	scripts/ansible-install.sh

start:
	vagrant up

provision:
	vagrant provision

update:
	cd docroot && drush make -y ../drupal.make.yml
