.PHONY: test build deploy

export PATH := bin:$(PATH)

all: build

build:
	docker build --tag hugo .
	docker run --rm --volume "$(shell pwd):/src" --workdir /src hugo

deploy:
	aws s3 sync --acl public-read --delete public/ s3://section-www.section.io/docs/
