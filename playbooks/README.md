
Playbooks
=========

* `deploy.yml` deploys the current code to codeservers.
* `development.yml`, `test.yml`, `production.yml` provision the respective environments on all roles.

To build an instance of the web site usually involves provision an environment and deploy the current code.

May need more playbooks in the future:

* `content.yml` or `data.yml` to deploy content from backups.

### Project specific

* `vagrant.yml` brings up the web site with the code under `docroot` and development environment on Vagrant VMs using Vagrant Ansible provision.
* `digitalocean.yml` builds up the production web site on DigitalOcean.
