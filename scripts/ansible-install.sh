#!/bin/bash

cd playbooks
ansible-galaxy install -r ansible-galaxy.yml

git clone https://github.com/pm5/ansible-role-drupal.git roles/pm5.drupal || true
git clone https://github.com/pm5/ansible-role-glusterfs.git roles/pm5.glusterfs || true
