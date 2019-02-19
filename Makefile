.RECIPEPREFIX +=

DOCKERHUB = jones2748/alpine-ansible-py3

default: help


build:  ## build container
 @docker build -t $(DOCKERHUB) .

build-no-cache:  ## build container without cache
 @docker build --no-cache -t $(DOCKERHUB) .

run:  ## run container
 @docker run -it --rm $(DOCKERHUB)

clean:  ## remove images
 @docker rmi $(DOCKERHUB)

test:  ## test container with builtin tests
 docker run -it --rm $(DOCKERHUB) version
 docker run -it --rm $(DOCKERHUB) setup


.PHONY: help
help:  ## this help
 @grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
