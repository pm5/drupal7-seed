
.PHONY: build run-docker clean

build:
	docker build -t pomin5/drupal7 .

run-docker:
	docker run -d --name=drupal7 -p 8080:80 -v $(PWD):/app pomin5/drupal7

clean:
	docker rm -f drupal7 || true
