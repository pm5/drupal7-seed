#!/usr/bin/env sh

APP_DIR=/app
PUBLIC_DIR=${APP_DIR}/public
DB_NAME=app
DB_USER=root
DB_PASS=foobar

usermod -aG docker vagrant

apt-get update && \
  apt-get upgrade -y

curl -s https://get.docker.io/ | sh

mkdir -p ${PUBLIC_DIR}

echo "mysql-server mysql-server/root_password password $DB_PASS" | debconf-set-selections
echo "mysql-server mysql-server/root_password_again password $DB_PASS" | debconf-set-selections
apt-get -y install mysql-server
if [ -r "${APP_DIR}/database.sql.gz" ]; then
    mysqladmin -u $DB_USER -p$DB_PASS create $DB_NAME
    gunzip -c ${APP_DIR}/database.sql.gz | mysql -u $DB_USER -p$DB_PASS $DB_NAME
fi

cat > /home/vagrant/.my.cnf <<END
[client]
password=$DB_PASS
END

cd ${APP_DIR}
make run-docker
