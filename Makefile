PWD=`pwd`

.PHONY: build test run start stop clean

build:
	docker build --rm=true -t pomin5/docker-drupal7 .

test:
	docker run -it --rm=true -p 8080:80 --name drupal7 -v $(PWD):/app pomin5/docker-drupal7 /bin/bash

run:
	docker run -d -p 8080:80 --name=drupal7 -v $(PWD):/app pomin5/docker-drupal7

start:
	docker start drupal7

stop:
	docker stop drupal7

clean:
	docker rm -f drupal7 || true
