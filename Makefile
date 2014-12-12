PWD=`pwd`

.PHONY: build test run start stop clean

build:
	docker build -t pomin5/drupal7 .

test-docker:
	docker run -it --rm -p 8080:80 --name drupal7 -v $(PWD):/app pomin5/drupal7 /bin/bash

run-docker:
	docker run -d -p 8080:80 --name=drupal7 -v $(PWD):/app pomin5/drupal7

start-docker:
	docker start drupal7

stop-docker:
	docker stop drupal7

clean:
	docker rm -f drupal7 || true
