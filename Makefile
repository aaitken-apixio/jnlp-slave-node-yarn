.PHONY: default auth build push clean
.DEFAULT_GOAL := default

NAME := 'jenkins-slave'

default: auth build push clean

build:
	docker build --no-cache --squash --rm -t ${NAME}:latest .

clean:
	- docker rmi `docker images -f "dangling=true" -q --no-trunc`

push:
	docker tag ${NAME}:latest 088921318242.dkr.ecr.us-west-2.amazonaws.com/${NAME}:latest
	docker push 088921318242.dkr.ecr.us-west-2.amazonaws.com/${NAME}:latest

auth:
	@eval "eval $$\( aws ecr get-login --no-include-email \)"
