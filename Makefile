MYSQL_ROOT_PASSWORD=foobar
MYSQL_USER=drupal
MYSQL_PASSWORD=foobar
MYSQL_DATABASE=drupal

.PHONY: dev clean

dev:
	MYSQL_ROOT_PASSWORD=foobar \
	MYSQL_USER=drupal \
	MYSQL_PASSWORD=foobar \
	MYSQL_DATABASE=drupal \
	fig up

clean:
	fig rm --force
