.PHONY: test build

export PATH := bin:$(PATH)

all: build

build:
	docker build --tag hugo .
	docker run --rm --volume "$(shell pwd):/src" --workdir /src hugo
