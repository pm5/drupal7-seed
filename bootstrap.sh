#!/usr/bin/env sh

APP_DIR=/app
PUBLIC_DIR=${APP_DIR}/public
DB_NAME=app
DB_USER=root
DB_PASS=foobar

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
echo "UPDATE user SET host = '%' WHERE user = 'root' AND host = 'localhost'; FLUSH PRIVILEGES;" | mysql -u root mysql -h127.0.0.1
sed -i 's/^bind-address/#bind-address/' /etc/mysql/my.cnf
/etc/init.d/mysql restart

cat > /home/vagrant/.my.cnf <<END
[client]
password=$DB_PASS
END

cd ${APP_DIR}
usermod -aG docker vagrant
make run-docker
