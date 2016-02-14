
.PHONY: install start provision

install:
	scripts/ansible-install.sh

dev:
	vagrant up --provision

update:
	cd docroot && drush make -y ../drupal.make.yml

ssh-config:
	vagrant ssh-config > ssh_config
